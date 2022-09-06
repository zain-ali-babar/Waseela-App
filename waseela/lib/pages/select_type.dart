import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SelectType extends StatefulWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(mediaQuery.size.height * 0.1),
              child: Image.asset(
                'images/waseela_urdu_color.png',
                height: mediaQuery.size.height * 0.2,
              ),
            ),
            InkWell(
              child: Container(
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width * 0.43,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.handshake_outlined,
                        color: Colors.white,
                        size: mediaQuery.size.height * 0.15,
                      ),
                    ),
                    Text('I want to help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuery.size.height * 0.03,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Container(
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width * 0.43,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: 400,
                        child: Icon(
                          Icons.front_hand_outlined,
                          color: Colors.white,
                          size: mediaQuery.size.height * 0.15,
                        ),
                      ),
                    ),
                    Text('I need help',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mediaQuery.size.height * 0.03,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
