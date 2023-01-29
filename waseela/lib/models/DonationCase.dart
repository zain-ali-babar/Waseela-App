import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DonationCase {
  int amountRequired;
  int amountCollected;
  String address;
  String title;
  String description;
  DateTime closingDate;
  String category;
  DateTime startDate;
  String accountId;
  bool showCase;
  bool showReceiverDetails;
  bool? targetAchieved;

  DonationCase(
      {required this.amountRequired,
      required this.amountCollected,
      required this.address,
      required this.title,
      required this.description,
      required this.closingDate,
      required this.category,
      required this.startDate,
      required this.accountId,
      required this.showCase,
      required this.showReceiverDetails,
      this.targetAchieved = false});

  factory DonationCase.fromJson(Map<String, dynamic> json) {
    return DonationCase(
        amountRequired: json['amountRequired'],
        amountCollected: json['amountCollected'],
        address: json['address'],
        title: json['title'],
        description: json['description'],
        closingDate: (json['closingDate'] as Timestamp).toDate(),
        category: json['category'],
        accountId: json['accountId'].toString(),
        showCase: json['showCase'],
        showReceiverDetails: json['showReceiverDetails'],
        targetAchieved: json['targetAchieved'],
        startDate: (json['startDate'] as Timestamp).toDate());
  }

  // DonationCase fromObject(Object json) {
  //   json = jsonDecode(jsonEncode(json));
  //   return DonationCase(
  //       amountRequired: json['amountRequired'],
  //       amountCollected: json['amountCollected'],
  //       address: json['address'],
  //       title: json['title'],
  //       description: json['description'],
  //       closingDate: (json['closingDate'] as Timestamp).toDate(),
  //       category: json['category'],
  //       accountId: json['accountId'],
  //       showCase: json['showCase'],
  //       showReceiverDetails: json['showReceiverDetails'],
  //       targetAchieved: json['targetAchieved'],
  //       startDate: (json['startDate'] as Timestamp).toDate());
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amountRequired'] = this.amountRequired;
    data['amountCollected'] = this.amountCollected;
    data['address'] = this.address;
    data['title'] = this.title;
    data['description'] = this.description;
    data['closingDate'] = this.closingDate;
    data['category'] = this.category;
    data['startDate'] = this.startDate;
    data['accountId'] = this.accountId;
    data['showCase'] = this.showCase;
    data['showReceiverDetails'] = this.showReceiverDetails;
    data['targetAchieved'] = this.targetAchieved;
    return data;
  }

  void printData() {
    print("****************************");
    print("title ${this.title}");
    print("total amount ${this.amountRequired}");
    print("amount collected ${this.amountCollected}");
    print("****************************");
  }
}
