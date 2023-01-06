import 'package:coffecustomer/extensions/extensions.dart';
import 'package:coffecustomer/ui/screen/main/components/select_language_dialog.dart';
import 'package:coffecustomer/ui/theme/app_notifier.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutx/flutx.dart';
import 'package:coffecustomer/ui/theme/theme_type.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _showNotification = true;
  bool _themeMode = true;

  late CustomTheme customTheme;
  late ThemeData theme;

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _themeMode = AppTheme.theme == AppTheme.darkTheme ? false : true;
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.dark);
    } else {
      Provider.of<AppNotifier>(context, listen: false)
          .updateTheme(ThemeType.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: FxText.titleMedium("settings".tr(), fontWeight: 600),
      ),
      body: ListView(
        padding: FxSpacing.nTop(20),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FxText.titleMedium("show_notifications".tr(),
                    fontWeight: 600),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    _showNotification = value;
                  });
                },
                value: _showNotification,
                activeColor: theme.colorScheme.primary,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FxText.titleMedium("change_theme".tr(), fontWeight: 600),
              ),
              Switch(
                onChanged: (bool value) {
                  setState(() {
                    _themeMode = value;
                    changeTheme();
                  });
                },
                value: _themeMode,
                activeColor: theme.colorScheme.primary,
              )
            ],
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      const SelectLanguageDialog());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.language,
                      size: 24, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child:
                          FxText.titleMedium('language'.tr(), fontWeight: 600),
                    ),
                  ),
                  Icon(MdiIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: FxText.bodySmall("other".tr().toUpperCase(),
                fontWeight: 600,
                color: theme.colorScheme.onBackground.withAlpha(200),
                letterSpacing: 0.3),
          ),
          FxSpacing.height(8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(MdiIcons.lockOutline,
                    size: 24, color: theme.colorScheme.onBackground),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: FxText.titleMedium("privacy_and_security".tr(),
                        fontWeight: 600),
                  ),
                ),
                Icon(MdiIcons.chevronRight,
                    size: 24, color: theme.colorScheme.onBackground),
              ],
            ),
          ),
          const Divider(
            thickness: 0.3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(MdiIcons.faceAgent,
                    size: 24, color: theme.colorScheme.onBackground),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: FxText.titleMedium("help_support".tr(),
                        fontWeight: 600),
                  ),
                ),
                Icon(MdiIcons.chevronRight,
                    size: 24, color: theme.colorScheme.onBackground),
              ],
            ),
          ),
          const Divider(
            thickness: 0.3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(MdiIcons.helpCircleOutline,
                    size: 24, color: theme.colorScheme.onBackground),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: FxText.titleMedium("about".tr(), fontWeight: 600),
                  ),
                ),
                Icon(MdiIcons.chevronRight,
                    size: 24, color: theme.colorScheme.onBackground),
              ],
            ),
          ),
          const Divider(
            thickness: 0.3,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8,
                ),
                FxText.titleSmall(
                  "Version ${packageInfo.version}",
                ),
                const SizedBox(
                  height: 8,
                ),
                Image.asset(
                  AppTheme.themeType == ThemeType.dark
                      ? "assets/images/mandalinasoft-horizontal-white-logo.png"
                      : "assets/images/mandalinasoft-horizontal-black-logo.png",
                  width: MediaQuery.of(context).size.width / 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
