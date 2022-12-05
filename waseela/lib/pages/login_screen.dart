import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waseela/pages/otp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  void dispose() {
    phoneNumber.dispose();
    password.dispose();

    super.dispose();
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: BoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 72, 71, 71),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Username',
              // hintStyle: HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: BoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Color.fromARGB(255, 72, 71, 71),
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 14.0),
              hintText: 'Password',
              // hintStyle: HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildForgotPasswordBtn() {
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: FlatButton(
  //       onPressed: () => print('Forgot Password Button Pressed'),
  //       padding: EdgeInsets.only(right: 0.0),
  //       child: Text(
  //         'Forgot Password?',
  //         style: kLabelStyle,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        // elevation: 5.0,
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  OTPScreen("+92${phoneNumber.text.trim()}")));
        },
        // padding: EdgeInsets.all(15.0),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(30.0),
        // ),
        // color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Color.fromARGB(255, 4, 4, 4),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: (Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(0, 255, 255, 255),
              child: Column(children: [
                Text(
                  'Be a helping hand',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    height: mediaQuery.size.height * 0.9522,
                    width: double.infinity,
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
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80),
                        )),
                    child: Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Enter your Phone Number',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                width: mediaQuery.size.width * 0.9,
                                height: mediaQuery.size.height * 0.05,
                                child: TextField(
                                  controller: phoneNumber,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.white),
                                    ),
                                    hintText: "Phone Number",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 30.0),
                            // _buildEmailTF(),
                            // SizedBox(
                            //   height: 30.0,
                            // ),
                            // _buildPasswordTF(),
                            _buildLoginBtn()
                          ],
                        ),
                      ),
                    )),
              ]))),
          // Container(
          //     alignment: Alignment.topCenter,
          //     height: mediaQuery.size.height * 0.77,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Color(0xFF0a0e0d),
          //           Color(0xFF0c1919),
          //           Color(0xFF0f2d2d),
          //           Color(0xFF123939),
          //         ],
          //         stops: [0.1, 0.4, 0.7, 0.9],
          //       ),
          //     ),
          //     child: Container(
          //       height: double.infinity,
          //       child: SingleChildScrollView(
          //         physics: AlwaysScrollableScrollPhysics(),
          //         padding: EdgeInsets.symmetric(
          //           horizontal: 40.0,
          //           vertical: 120.0,
          //         ),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Text(
          //               'Login',
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontFamily: 'OpenSans',
          //                 fontSize: 30.0,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             SizedBox(height: 30.0),
          //             _buildEmailTF(),
          //             SizedBox(
          //               height: 30.0,
          //             ),
          //             _buildPasswordTF(),
          //             _buildLoginBtn()
          //           ],
          //         ),
          //       ),
          //     )),
        ),
      ),
    );
  }
}

Future signIn(number) async {
  await FirebaseAuth.instance.signInWithPhoneNumber("+92${number}");
}
