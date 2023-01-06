import 'package:coffecustomer/core/view/notification_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:coffecustomer/const.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/core/view/banner_view.dart';
import 'package:coffecustomer/firebase_options.dart';
import 'package:coffecustomer/localizations/app_localization_delegate.dart';
import 'package:coffecustomer/localizations/language.dart';
import 'package:coffecustomer/locator.dart';
import 'package:coffecustomer/ui/landing_screen.dart';
import 'package:coffecustomer/ui/theme/app_notifier.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppNotifier>(
          create: (context) => AppNotifier(),
        ),
        ChangeNotifierProvider<NotificationView>(
          create: (context) => NotificationView(),
        ),
        ChangeNotifierProvider(
          create: (context) => BannerView(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthView(),
        ),
        ChangeNotifierProvider<FxAppThemeNotifier>(
          create: (context) => FxAppThemeNotifier(),
        ),
      ],
      child: Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
          return MaterialApp(
            theme: AppTheme.theme,
            title: title,
            debugShowCheckedModeBanner: debugMode,
            builder: (context, child) {
              return Directionality(
                textDirection: AppTheme.textDirection,
                child: child!,
              );
            },
            localizationsDelegates: [
              AppLocalizationsDelegate(context),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: Language.getLocales(),
            // home: IntroScreen(),
            // home: SplashScreen(),
            home: const LandingScreen(),
          );
        },
      ),
    );
  }
}
