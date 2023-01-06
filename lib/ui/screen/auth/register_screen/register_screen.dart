import 'package:coffecustomer/core/model/customer_model.dart';
import 'package:coffecustomer/core/model/error_model.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/error_code.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String nameSurname = "";

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
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              title: const Text(''),// You can add title here
              leading:  IconButton(
                icon:  const Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent, //You can make this transparent
              elevation: 0.0, //No shadow
            ),),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Center(
                    child: FxText.titleLarge("Create an Account", fontWeight: 600),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        hintText: "Email address",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
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
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        hintText: "Name Surname",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: const Icon(
                          MdiIcons.accountOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name surname';
                        } else {
                          if (!value.contains(" ")) {
                            return "Please enter name surname";
                          } else {
                            nameSurname = value;
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      obscureText: _passwordVisible,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        hintText: "Password",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
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
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: FxTextStyle.bodyLarge(
                          letterSpacing: 0.1,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      obscureText: _passwordVisible,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintStyle: FxTextStyle.bodyLarge(
                            letterSpacing: 0.1,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        hintText: "Same Password",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
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
                          return 'Please enter again same password';
                        } else {
                          if (password != value) {
                            return 'Please enter same password';
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
                        return FxButton.block(
                          elevation: 0,
                          borderRadiusAll: 4,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await value
                                  .createUserWithEmailAndPassword(
                                email,
                                password,
                                nameSurname,
                              )
                                  .then((res) {
                                if (res is CustomerModel) {
                                  Navigator.of(context).pop();
                                }else if(res is ErrorModel){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: FxText.titleSmall(res.message, color: theme.colorScheme.onPrimary),
                                      backgroundColor: theme.colorScheme.error,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );

                                }else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: FxText.titleSmall(errorMessage, color: theme.colorScheme.onPrimary),
                                      backgroundColor: theme.colorScheme.error,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );

                                }
                              });
                            }
                          },
                          child: FxText.bodyMedium(
                            "Register",
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
                  Navigator.of(context).pop();
                },
                child: FxText.bodyMedium(
                  "I've already an account",
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
