import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:coffecustomer/core/model/history_model.dart';
import 'package:coffecustomer/ui/screen/main/components/history_widget.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  late ThemeData theme;
  late CustomTheme customTheme;

  late List<HistoryModel> _historyModel;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    _historyModel = [
      HistoryModel(historyType: HistoryType.earned,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
      HistoryModel(historyType: HistoryType.spent,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
      HistoryModel(historyType: HistoryType.earned,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
      HistoryModel(historyType: HistoryType.spent,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
      HistoryModel(historyType: HistoryType.earned,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
      HistoryModel(historyType: HistoryType.spent,processId: "123", processDate: Timestamp.now(), starAmount: 2, price: 15.5,branchName: "Bjorn, Kazımdirik"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: FxText.titleMedium("History", fontWeight: 600),
        ),
        body: ListView.separated(
          padding: FxSpacing.all(0),
          itemCount: _historyModel.length,
          separatorBuilder: (context, index) => const Divider(
          ),
          itemBuilder: (context, index) {
            return HistoryWidget(historyModel: _historyModel[index]);
          },

        ));
  }
}
