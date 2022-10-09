import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterDonor extends StatefulWidget {
  const RegisterDonor({Key? key}) : super(key: key);

  @override
  State<RegisterDonor> createState() => _RegisterDonorState();
}

class _RegisterDonorState extends State<RegisterDonor> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Text('Be a helping hand'),
              Container(
                height: mediaQuery.size.height * 0.8,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF0a0e0d),
                        Color(0xFF0c1919),
                        Color(0xFF0f2d2d),
                        Color(0xFF123939),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
