import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:coffecustomer/core/model/history_model.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistoryWidget extends StatelessWidget {
  final HistoryModel historyModel;

  const HistoryWidget({Key? key, required this.historyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FxSpacing.xy(16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Icon(
              historyModel.historyType == HistoryType.spent
                  ? MdiIcons.coffeeToGo
                  : MdiIcons.starPlus,
              size: 32,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.titleMedium(
                    historyModel.historyType == HistoryType.spent
                        ? "Spent Star(s)"
                        : "Earned Star(s)",
                    fontWeight: 600,
                  ),
                  FxText.bodyMedium(
                    historyModel.branchName,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FxText.titleMedium(
                    historyModel.historyType == HistoryType.spent
                        ? historyModel.starAmount.toString()
                        : "${historyModel.price}₺ - ${historyModel.starAmount}",
                    fontWeight: 600,
                  ),
                  FxText.bodySmall(
                    DateFormat('dd MMM yy - kk:mm')
                        .format(historyModel.processDate.toDate()),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
