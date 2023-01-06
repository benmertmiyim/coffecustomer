import 'package:coffecustomer/core/model/error_model.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/ui/screen/auth/forget_screen/forget_screen.dart';
import 'package:coffecustomer/ui/screen/auth/register_screen/register_screen.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: FxText.titleLarge("Welcome Back", fontWeight: 600),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                    style: FxTextStyle.bodyLarge(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: FxTextStyle.titleSmall(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide.none),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide.none),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: customTheme.card,
                      prefixIcon: const Icon(
                        MdiIcons.emailOutline,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else {
                        if (!value.contains("@") || !value.contains(".")) {
                          return "Please enter an email";
                        } else {
                          email = value;
                        }
                      }
                      return null;
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  autofocus: false,
                  obscureText: _passwordVisible,
                  textInputAction: TextInputAction.done,
                  style: FxTextStyle.bodyLarge(
                      letterSpacing: 0.1,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500),
                  decoration: InputDecoration(
                    hintStyle: FxTextStyle.titleSmall(
                        letterSpacing: 0.1,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    hintText: "Password",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: customTheme.card,
                    prefixIcon: const Icon(
                      MdiIcons.lockOutline,
                      size: 22,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      child: Icon(
                        _passwordVisible
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        size: 22,
                      ),
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else {
                      password = value;
                    }
                    return null;
                  },
                ),
              ),
              FxSpacing.height(20),
              Container(
                alignment: Alignment.centerRight,
                child: FxButton.text(
                  padding: FxSpacing.zero,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ForgetScreen(),
                      ),
                    );
                  },
                  child: FxText.bodyMedium(
                    "Forgot Password ?",
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              FxSpacing.height(20),
              Consumer<AuthView>(
                builder: (BuildContext context, value, Widget? child) {
                  if (value.authProcess == AuthProcess.idle) {
                    return FxButton.block(
                      elevation: 0,
                      borderRadiusAll: 4,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await value
                              .signInWithEmailAndPassword(email, password)
                              .then((res) {
                            if (value.customerModel == null) {
                              if (res is ErrorModel) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: FxText.titleSmall(res.message, color: theme.colorScheme.onPrimary),
                                    backgroundColor: theme.colorScheme.error,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            }
                          });
                        }
                      },
                      child: FxText.bodyMedium(
                        "Sign in",
                        fontWeight: 600,
                        color: theme.colorScheme.onPrimary,
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              FxSpacing.height(20),
              Center(
                child: FxButton.text(
                  elevation: 0,
                  borderRadiusAll: 4,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: FxText.bodyMedium(
                    "I haven't an account",
                    decoration: TextDecoration.underline,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
