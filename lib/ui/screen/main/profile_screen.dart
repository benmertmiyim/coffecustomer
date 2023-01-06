import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/extensions/widgets_extension.dart';
import 'package:coffecustomer/ui/screen/main/history_screen.dart';
import 'package:coffecustomer/ui/screen/main/notifications_screen.dart';
import 'package:coffecustomer/ui/screen/main/settings_screen.dart';
import 'package:coffecustomer/ui/theme/app_notifier.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:coffecustomer/ui/theme/theme_type.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;
  late AuthView authView;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    authView = Provider.of<AuthView>(context);

    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return ListView(
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FxText.titleLarge(authView.customerModel!.nameSurname,
                  fontWeight: 700, letterSpacing: 0),
              FxText.titleMedium(authView.customerModel!.email,
                  fontWeight: 600, letterSpacing: 0.3),
              FxText.titleSmall(
                "Membership date: ${DateFormat('dd MMM yy').format(authView.customerModel!.registrationDate.toDate())}",
                fontWeight: 600,
                letterSpacing: 0.3,
                color: theme.colorScheme.onBackground.withOpacity(.5),
              ),
            ],
          ),
          FxSpacing.height(16),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              FxContainer.bordered(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FxText.titleLarge(authView.customerModel!.starBalance.toStringAsFixed(0),
                            fontWeight: 600, letterSpacing: 0.3),
                        FxSpacing.width(2),
                        Icon(
                          MdiIcons.star,
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: FxText.labelMedium("Star balance",
                            textAlign: TextAlign.center, fontWeight: 600))
                  ],
                ),
              ),
              FxContainer.bordered(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FxText.titleLarge("2",
                            fontWeight: 600, letterSpacing: 0.3),
                        FxSpacing.width(2),
                        Icon(
                          MdiIcons.coffeeOutline,
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: FxText.labelMedium("Reward drink",
                            textAlign: TextAlign.center, fontWeight: 600))
                  ],
                ),
              ),
              FxContainer.bordered(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FxText.titleLarge("${authView.customerModel!.balance.toStringAsFixed(2)} ₺",
                        fontWeight: 600, letterSpacing: 0.3),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: FxText.labelMedium(
                        "Balance",
                        fontWeight: 600,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          FxSpacing.height(16),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MdiIcons.bellRingOutline,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                      FxSpacing.width(20),
                      Expanded(
                        child:
                            FxText.bodyLarge("Notifications", fontWeight: 600),
                      ),
                      Container(
                        child: Icon(MdiIcons.chevronRight,
                                size: 22, color: theme.colorScheme.onBackground)
                            .autoDirection(),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MdiIcons.walletPlusOutline,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                      FxSpacing.width(20),
                      Expanded(
                        child:
                        FxText.bodyLarge("Add Money", fontWeight: 600),
                      ),
                      Container(
                        child: Icon(MdiIcons.chevronRight,
                            size: 22, color: theme.colorScheme.onBackground)
                            .autoDirection(),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HistoryScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        MdiIcons.history,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                      FxSpacing.width(20),
                      Expanded(
                        child: FxText.bodyLarge("History", fontWeight: 600),
                      ),
                      Container(
                        child: Icon(MdiIcons.chevronRight,
                                size: 22, color: theme.colorScheme.onBackground)
                            .autoDirection(),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MdiIcons.tag,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    FxSpacing.width(20),
                    Expanded(
                      child: FxText.bodyLarge("Invite Your Friends",
                          fontWeight: 600),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
                    ),
                  ],
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.settings,
                          size: 22, color: theme.colorScheme.onBackground),
                      FxSpacing.width(20),
                      Expanded(
                        child: FxText.bodyLarge("Settings", fontWeight: 600),
                      ),
                      Container(
                        child: Icon(MdiIcons.chevronRight,
                                size: 22, color: theme.colorScheme.onBackground)
                            .autoDirection(),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  AuthView authView =
                      Provider.of<AuthView>(context, listen: false);
                  authView.signOut();
                  //TODO
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(MdiIcons.logout,
                          size: 22, color: theme.colorScheme.error),
                      FxSpacing.width(20),
                      Expanded(
                        child: FxText.bodyLarge(
                          "Logout",
                          fontWeight: 600,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      Container(
                        child: Icon(MdiIcons.chevronRight,
                                size: 22, color: theme.colorScheme.onBackground)
                            .autoDirection(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }
}
