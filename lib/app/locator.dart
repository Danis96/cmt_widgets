import 'package:cmt/app/stores/widget_store.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void registerStores() {
   getIt.registerLazySingleton(() => WidgetStore());
}