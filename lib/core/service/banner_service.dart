import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffecustomer/firestore_paths.dart';
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/base/banner_base.dart';
import 'package:coffecustomer/core/model/banner_model.dart';

class BannerService implements BannerBase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<BannerModel>?> getBanners() async {
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection(bannerPath).where("active",isEqualTo: true).get();
      List<BannerModel> list = [];
      for (int i = 0; i < querySnapshot.size; i++) {
        Map<String,dynamic> bannerMap = querySnapshot.docs[i].data() as Map<String, dynamic>;
        list.add(BannerModel.fromMap(bannerMap));
      }
      return list;
    } catch (e) {
      debugPrint(
        "BannerService - Exception - Get Banners : ${e.toString()}",
      );
      return null;
    }

  }

}
