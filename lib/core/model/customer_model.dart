import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  final String uid;
  final String email;
  final String nameSurname;
  final Timestamp registrationDate;
  double balance;
  double starBalance;
  String? cardUserKey;

  CustomerModel({
    required this.uid,
    required this.email,
    required this.nameSurname,
    required this.registrationDate,
    required this.balance,
    required this.starBalance,
    this.cardUserKey,
  });


  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      uid: json["uid"],
      email: json["email"],
      nameSurname: json["nameSurname"],
      balance: json["balance"].toDouble(),
      starBalance: json["starBalance"].toDouble(),
      cardUserKey: json["cardUserKey"] ?? null,
      registrationDate: json["registrationDate"] as Timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": this.uid,
      "email": this.email,
      "nameSurname": this.nameSurname,
      "registrationDate": this.registrationDate,
      "balance": this.balance,
      "starBalance": this.starBalance,
      "cardUserKey": this.cardUserKey,
    };
  }

  @override
  String toString() {
    return 'CustomerModel{uid: $uid, email: $email, nameSurname: $nameSurname, registrationDate: $registrationDate, balance: $balance, starBalance: $starBalance, cardUserKey: $cardUserKey}';
  }
}
