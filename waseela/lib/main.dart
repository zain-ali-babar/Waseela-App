import 'package:flutter/material.dart';
import 'package:waseela/pages/donor/billing_details.dart';
import 'package:waseela/pages/donor/donor_dashboard.dart';
import 'package:waseela/pages/needy/register_need.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DonorDashboard(),
    );
  }
}
