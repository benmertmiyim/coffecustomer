import 'package:cloud_firestore/cloud_firestore.dart';

enum HistoryType{
  spent,
  earned,
}
class HistoryModel{
  final HistoryType historyType;
  final String processId;
  final String branchName;
  final Timestamp processDate;
  final int starAmount;
  final double price;

  HistoryModel({required this.historyType,required this.processId, required this.processDate, required this.starAmount, required this.price,required this.branchName});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      processId: json["processId"],
      historyType: json["historyType"] as HistoryType,
      branchName: json["branchName"],
      processDate: json["processDate"] as Timestamp,
      starAmount: int.parse(json["starAmount"]),
      price: double.parse(json["price"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "processId": this.processId,
      "processDate": this.processDate,
      "starAmount": this.starAmount,
      "price": this.price,
      "historyType": this.historyType,
      "branchName": this.branchName,
    };
  }

//

}