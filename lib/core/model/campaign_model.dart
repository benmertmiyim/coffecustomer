import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModel {
  final String campaignId;
  final String bannerURL;
  final String title;
  final String description;
  final Timestamp validityDate;

  CampaignModel(
      {required this.campaignId,
      required this.bannerURL,
      required this.title,
      required this.description,
      required this.validityDate});

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      campaignId: json["campaignId"],
      bannerURL: json["bannerURL"],
      title: json["title"],
      description: json["description"],
      validityDate: json["validityDate"] as Timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "campaignId": this.campaignId,
      "bannerURL": this.bannerURL,
      "title": this.title,
      "description": this.description,
      "validityDate": this.validityDate,
    };
  }
}
