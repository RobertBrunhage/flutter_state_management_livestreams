import 'package:flutter/material.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxvms_learning/managers/cat_facts_manager.dart';
import 'package:rxvms_learning/models/cat_fact.dart';
import 'package:rxvms_learning/pages/cat_fact_page.dart';
import 'package:rxvms_learning/service_locator.dart';

class CatFactsPage extends StatefulWidget {
  @override
  _CatFactsPageState createState() => _CatFactsPageState();
}

class _CatFactsPageState extends State<CatFactsPage> {
  @override
  void initState() {
    super.initState();
    sl<CatFactsManager>().getCatFactsCommand();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat facts app'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: StreamBuilder<int>(
              stream: sl<CatFactsManager>().incrementFactsRead,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  'posts read: ${snapshot.data}',
                  style: Theme.of(context).primaryTextTheme.title,
                );
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<CommandResult<List<CatFact>>>(
        stream: sl.get<CatFactsManager>().getCatFactsCommand.results,
        builder: (context, snapshot) {
          final result = snapshot.data;
          if (result.isExecuting) {
            return Center(child: CircularProgressIndicator());
          } else if (result.hasData) {
            return ListView.builder(
              itemCount: result.data.length,
              itemBuilder: (context, index) {
                final catFact = result.data[index];
                return CatFactsTile(catFact: catFact);
              },
            );
          } else {
            return Center(child: Text('There was an error'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sl.get<CatFactsManager>().getCatFactsCommand,
      ),
    );
  }
}

class CatFactsTile extends StatelessWidget {
  const CatFactsTile({
    Key key,
    @required this.catFact,
  }) : super(key: key);

  final CatFact catFact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        sl.get<CatFactsManager>().incrementFactsRead();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CatFactPage(catFact: catFact),
          ),
        );
      },
      title: Text(catFact.userName),
      subtitle: Text(catFact.text),
    );
  }
}
