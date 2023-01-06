
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/ui/screen/auth/forget_screen/forget_screen.dart';
import 'package:coffecustomer/ui/screen/auth/login_screen/login_screen.dart';
import 'package:coffecustomer/ui/screen/auth/register_screen/register_screen.dart';
import 'package:coffecustomer/ui/screen/main/main_screen.dart';
import 'package:coffecustomer/ui/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthView authView = Provider.of<AuthView>(context);

    if (authView.authState == AuthState.landing) {
      return const SplashScreen();
    } else {
      if (authView.authState == AuthState.intro) {
        return const LoginScreen();
      } else if (authView.authState == AuthState.auth) {
        return const LoginScreen();
      }  else {
        return const MainScreen();
      }
    }
  }
}
