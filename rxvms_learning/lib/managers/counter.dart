import 'package:rx_command/rx_command.dart';

// ErrorLens for errors
abstract class CounterManager {
  RxCommand<int, int> addCounter;
}

class CounterManagerImplementation implements CounterManager {
  CounterManagerImplementation() {
    addCounter = RxCommand.createSync<int, int>((count) {
      _count += count;
      return _count;
    });
  }

  int _count = 0;

  @override
  RxCommand<int, int> addCounter;
}
