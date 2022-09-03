import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DonorDashboard extends StatefulWidget {
  const DonorDashboard({Key? key}) : super(key: key);

  @override
  State<DonorDashboard> createState() => _DonorDashboardState();
}

class _DonorDashboardState extends State<DonorDashboard> {
  @override
  Widget build(BuildContext context) {
    Widget HorizontalListCard(mediaQuery) {
      return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Container(
          // height: mediaQuery.size.height * 0.25,
          width: mediaQuery.size.width * 0.48,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      );
    }

    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Container(
            height: mediaQuery.size.height * 0.35,
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
                  stops: [0.05, 0.1, 0.15, 0.25],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: mediaQuery.size.height * 0.03),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Make or schedule a Donation.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Help Humanity. Save Humanity.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Recent Donations',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: mediaQuery.size.height * 0.02),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: mediaQuery.size.height * 0.28, left: 20),
            height: mediaQuery.size.height * 0.22,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
                HorizontalListCard(mediaQuery),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height * 0.51),
            height: mediaQuery.size.height * 0.48,
            width: double.infinity,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10),
                      child: Text(
                        'Let\'s Help',
                        style: TextStyle(
                            fontSize: mediaQuery.size.height * 0.035,
                            fontWeight: FontWeight.w400),
                      ),
                    )),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: mediaQuery.size.height * 0.18,
                            width: mediaQuery.size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Container(
                            height: mediaQuery.size.height * 0.18,
                            width: mediaQuery.size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 10, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: mediaQuery.size.height * 0.18,
                            width: mediaQuery.size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Container(
                            height: mediaQuery.size.height * 0.18,
                            width: mediaQuery.size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
