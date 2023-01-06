import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:coffecustomer/ui/theme/theme_type.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    AuthView authView = Provider.of<AuthView>(context);

    if (authView.authProcess == AuthProcess.busy) {
      return const CircularProgressIndicator();
    } else {
      return Padding(
        padding:
            FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              foregroundColor: AppTheme.themeType == ThemeType.dark
                  ? Colors.white
                  : Colors.black,
              data: authView.customerModel!.uid,
              version: QrVersions.auto,
            ),
            FxSpacing.height(8),
            FxText.titleSmall(authView.customerModel!.uid,
                fontWeight: 700, letterSpacing: 0),
            FxSpacing.height(8),
            FxText.displaySmall(authView.customerModel!.nameSurname,
                fontWeight: 700, letterSpacing: 0),
            FxText.bodyLarge(
                "Balance: ${authView.customerModel!.balance.toStringAsFixed(2)} ₺",
                letterSpacing: 0),
          ],
        ),
      );
    }
  }
}
