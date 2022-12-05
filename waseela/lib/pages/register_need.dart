import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waseela/pages/explore.dart';
import 'package:waseela/pages/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterNeed extends StatefulWidget {
  final String phone;
  RegisterNeed(this.phone);
  // const RegisterNeed({Key? key}) : super(key: key);

  @override
  State<RegisterNeed> createState() => _RegisterNeedState();
}

class _RegisterNeedState extends State<RegisterNeed> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void dispose() {
    phoneNumber.dispose();
    password.dispose();
    name.dispose();
    email.dispose();
    country.dispose();
    city.dispose();

    super.dispose();
  }

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
                      controller: email,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        hintText: "Email",
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
                      controller: name,
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
                      controller: dateOfBirth,
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
                      controller: city,
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
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.85,
                    height: mediaQuery.size.height * 0.05,
                    child: TextField(
                      controller: country,
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
                  padding: EdgeInsets.only(top: 8.0, left: 16, bottom: 8),
                  child: SizedBox(
                    width: mediaQuery.size.width * 0.9,
                    // child: Text(
                    //   'Briefly Explain what you need.',
                    //   textAlign: TextAlign.left,
                    //   style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    // ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(4.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border(
                //             left: BorderSide(width: 1.0, color: Colors.grey),
                //             bottom:
                //                 BorderSide(width: 1.0, color: Colors.grey))),
                //     width: mediaQuery.size.width * 0.85,
                //     height: mediaQuery.size.height * 0.15,
                //     child: TextField(
                //       maxLines: 5,
                //       style: TextStyle(color: Colors.white),
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //       ),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () async {
                      users.add({
                        'full_name': name.text,
                        'phoneNumber': widget.phone,
                        'email': email.text,
                        'city': city.text,
                        'country': country.text,
                      }).then((value) {
                        print("User Added");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Explore(widget.phone)));
                      }).catchError(
                          (error) => print("Failed to add user: $error"));
                    },
                    child: Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
