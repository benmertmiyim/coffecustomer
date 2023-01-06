import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/model/campaign_model.dart';
import 'package:coffecustomer/ui/screen/main/campaign_detail_screen.dart';

class CampaignWidget extends StatelessWidget {
  final CampaignModel campaignModel;

  const CampaignWidget({Key? key, required this.campaignModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CampaignDetailScreen(
                  campaignModel: campaignModel,
                ),
              ),
            );
          },
          child: Hero(
            tag: campaignModel.campaignId,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              imageUrl: campaignModel.bannerURL,
            ),
          ),
        ),
      ),
    );
  }
}
