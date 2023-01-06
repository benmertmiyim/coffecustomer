import 'package:coffecustomer/core/service/notification_service.dart';
import 'package:coffecustomer/core/view/notification_view.dart';
import 'package:get_it/get_it.dart';
import 'package:coffecustomer/core/service/auth_service.dart';
import 'package:coffecustomer/core/service/banner_service.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/core/view/banner_view.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AuthView());
  locator.registerLazySingleton(() => BannerService());
  locator.registerLazySingleton(() => BannerView());
  locator.registerLazySingleton(() => NotificationView());
  locator.registerLazySingleton(() => NotificationService());
}
