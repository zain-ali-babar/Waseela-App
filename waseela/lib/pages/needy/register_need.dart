import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterNeed extends StatefulWidget {
  const RegisterNeed({Key? key}) : super(key: key);

  @override
  State<RegisterNeed> createState() => _RegisterNeedState();
}

class _RegisterNeedState extends State<RegisterNeed> {
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
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: mediaQuery.size.height * 0.08,
                      bottom: mediaQuery.size.height * 0.02),
                  height: mediaQuery.size.height * 0.15,
                  child: Image.asset('images/waseela_urdu_color.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'You\'re the Future.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.9,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.9,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: InputBorder.none,
                        hintText: "Full Name",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: InputBorder.none,
                        hintText: "D.O.B",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: InputBorder.none,
                        hintText: "Country",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        border: InputBorder.none,
                        hintText: "City",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.9,
                    child: Text(
                      'Briefly Explain what you need.',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 1.0, color: Colors.grey),
                            bottom:
                                BorderSide(width: 1.0, color: Colors.grey))),
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.15,
                    child: TextField(
                      maxLines: 5,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
