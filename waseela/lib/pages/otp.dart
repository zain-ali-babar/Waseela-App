import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:waseela/pages/explore.dart';
import 'package:waseela/pages/register_need.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String verificationCode = "";
  final pinputFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  _verifyPhone() async {
    print("Verifying number");
    await auth.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("Verification complete");

          await auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              print("*******phone number verified******");
              users.where("phoneNumber", isEqualTo: widget.phone).get().then(
                (snapshot) {
                  if (snapshot.docs.isEmpty) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterNeed(widget.phone)),
                        (route) => false);
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Explore(widget.phone)),
                        (route) => false);
                  }
                },
                onError: (e) {
                  print("error completing: $e");
                },
              );
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify ${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              pinAnimationType: PinAnimationType.fade,
              focusNode: pinputFocusNode,
              onCompleted: null,
              onSubmitted: (pin) async {
                try {
                  await auth
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: pin))
                      .then((value) async {
                    print("Phone Number verified");
                    users
                        .where("phoneNumber", isEqualTo: widget.phone)
                        .get()
                        .then(
                      (snapshot) {
                        if (snapshot.docs.isEmpty) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterNeed(widget.phone)),
                              (route) => false);
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Explore(widget.phone)),
                              (route) => false);
                        }
                      },
                      onError: (e) {
                        print("error completing: $e");
                      },
                    );
                    // if (value.user != null) {
                    //   Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => Explore()),
                    //       (route) => false);
                    // }
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
