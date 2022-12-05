import 'package:cloud_firestore/cloud_firestore.dart';

class DonationCase {
  int totalAmount;
  int amountCollected;
  String city;
  String name;
  String description;
  String country;
  DateTime closingDate;
  String category;
  DateTime startDate;

  DonationCase(
      {required this.totalAmount,
      required this.amountCollected,
      required this.city,
      required this.name,
      required this.description,
      required this.country,
      required this.closingDate,
      required this.category,
      required this.startDate});

  factory DonationCase.fromJson(Map<String, dynamic> json) {
    return DonationCase(
        totalAmount: json['totalAmount'],
        amountCollected: json['amountCollected'],
        city: json['city'],
        name: json['name'],
        description: json['description'],
        country: json['country'],
        closingDate: (json['closingDate'] as Timestamp).toDate(),
        category: json['category'],
        startDate: (json['startDate'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['amountCollected'] = this.amountCollected;
    data['city'] = this.city;
    data['name'] = this.name;
    data['description'] = this.description;
    data['country'] = this.country;
    data['closingDate'] = this.closingDate;
    data['category'] = this.category;
    data['startDate'] = this.startDate;
    return data;
  }
}
