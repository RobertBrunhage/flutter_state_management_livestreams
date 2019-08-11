import 'package:get_it/get_it.dart';
import 'package:rxvms_learning/managers/cat_facts_manager.dart';
import 'package:rxvms_learning/managers/counter.dart';
import 'package:rxvms_learning/services/cat_facts_service.dart';

GetIt sl = GetIt();

void setUpServiceLocator() {
  // Registers services
  sl.registerLazySingleton<CatFactService>(() => CatFactServiceImplementation());

  // Registers managers
  sl.registerLazySingleton<CounterManager>(() => CounterManagerImplementation());
  sl.registerLazySingleton<CatFactsManager>(() => CatFactsManagerImplementation());
}
