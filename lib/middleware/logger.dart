import 'package:docweb/store/data_store.dart';
import 'package:redux/redux.dart';

class LoggerMiddleware {
  static loggingMiddleware(
      Store<AppDataStore> store, action, NextDispatcher next) {
    print('${new DateTime.now()}: $action');

    next(action);
  }
}
