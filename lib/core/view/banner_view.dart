
import 'package:flutter/material.dart';
import 'package:coffecustomer/core/base/banner_base.dart';
import 'package:coffecustomer/core/model/banner_model.dart';
import 'package:coffecustomer/core/service/banner_service.dart';
import 'package:coffecustomer/locator.dart';

enum BannerProcess {
  idle,
  busy,
}

class BannerView with ChangeNotifier implements BannerBase {
  BannerProcess _bannerProcess = BannerProcess.idle;
  BannerService bannerService = locator<BannerService>();
  List<BannerModel>? bannerList;

  BannerProcess get bannerProcess => _bannerProcess;

  set bannerProcess(BannerProcess value) {
    _bannerProcess = value;
    notifyListeners();
  }

  BannerView(){
    getBanners();
  }

  @override
  Future<List<BannerModel>?> getBanners() async {
    try {
      bannerProcess = BannerProcess.busy;
      bannerList = await bannerService.getBanners();
    } catch (e) {
      debugPrint(
        "BannerView - Exception - Get Banners : ${e.toString()}",
      );
    } finally {
      bannerProcess = BannerProcess.idle;
    }
    return bannerList;
  }
}
