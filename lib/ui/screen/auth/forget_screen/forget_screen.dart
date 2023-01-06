import 'package:flutter/material.dart';
import 'package:coffecustomer/core/model/error_model.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  final formKey = GlobalKey<FormState>();
  String email = "";

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: const Text(''),
              // You can add title here
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              //You can make this transparent
              elevation: 0.0, //No shadow
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: FxText.titleLarge("Forgot Password?",
                          fontWeight: 600),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(
                          MdiIcons.emailOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
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
                      },
                    ),
                  ),
                  FxSpacing.height(20),
                  Consumer<AuthView>(
                    builder: (BuildContext context, value, Widget? child) {
                      if (value.authProcess == AuthProcess.idle) {
                        return FxButton(
                          elevation: 0,
                          borderRadiusAll: 4,
                          padding: FxSpacing.y(12),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await value
                                  .sendPasswordResetEmail(email)
                                  .then((result) {
                                if (result is ErrorModel) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: FxText.titleSmall(result.message, color: theme.colorScheme.onPrimary),
                                      backgroundColor: theme.colorScheme.error,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: FxText.titleSmall("We sent an email to reset your password.", color: theme.colorScheme.onPrimary),
                                      backgroundColor: theme.colorScheme.error,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                          child: FxText.bodyMedium("Reset Password",
                              color: theme.colorScheme.onPrimary,
                              letterSpacing: 0.5,
                              fontWeight: 600),
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
                        Navigator.pop(context);
                      },
                      child: FxText.bodyMedium(
                        "Sign In",
                        decoration: TextDecoration.underline,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
