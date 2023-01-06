import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:coffecustomer/core/model/campaign_model.dart';
import 'package:coffecustomer/ui/theme/app_notifier.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CampaignDetailScreen extends StatefulWidget {
  final CampaignModel campaignModel;

  const CampaignDetailScreen({Key? key, required this.campaignModel})
      : super(key: key);

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        theme = AppTheme.theme;
        customTheme = AppTheme.customTheme;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: FxText.titleMedium(
              widget.campaignModel.title,
              fontWeight: 600,
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              Hero(
                tag: widget.campaignModel.campaignId,
                child: Image.network(
                  widget.campaignModel.bannerURL,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: FxSpacing.fromLTRB(16, 16, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.titleSmall(
                      "Valid until ${DateFormat('dd MMM yy')
                          .format(widget.campaignModel.validityDate.toDate())}",
                      fontWeight: 700,
                    ),
                    FxText.bodyMedium(
                      widget.campaignModel.description,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
