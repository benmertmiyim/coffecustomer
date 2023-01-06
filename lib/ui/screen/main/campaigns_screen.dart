import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:coffecustomer/core/model/campaign_model.dart';
import 'package:coffecustomer/ui/screen/main/components/campaign_widget.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FxSpacing.fromLTRB(16, 16, 16, 0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CampaignWidget(
            campaignModel: CampaignModel(
              campaignId: index.toString(),
              bannerURL:
                  "https://firebasestorage.googleapis.com/v0/b/influencedby-ms.appspot.com/o/banners%2FBanner5BlueModerncard.png?alt=media&token=7d23d98e-1704-4325-bf3e-9eae55f24de8",
              title: "title $index",
              description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              validityDate: Timestamp.now(),
            ),
          );
        },
      ),
    );
  }
}
