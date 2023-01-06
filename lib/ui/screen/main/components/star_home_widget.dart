import 'package:coffecustomer/core/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class StarHomeWidget extends StatelessWidget {
  const StarHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthView authView = Provider.of<AuthView>(context);
    return FxContainer.bordered(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleSmall(
                    "Star left for drink",
                    fontWeight: 600,
                    letterSpacing: 0.3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(MdiIcons.star),
                      Icon(MdiIcons.star),
                      Icon(MdiIcons.starOutline),
                      Icon(MdiIcons.starOutline),
                      Icon(MdiIcons.starOutline),
                    ],
                  ),
                ],
              ),
            ),
            const VerticalDivider(
            ),
            Expanded(
              child:               Column(
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
                      const Icon(
                        MdiIcons.star,
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: FxText.labelMedium("Star balance",
                          fontWeight: 600))
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
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
                      const Icon(
                        MdiIcons.coffeeOutline,
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: FxText.labelMedium("Reward drink",
                          fontWeight: 600),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
