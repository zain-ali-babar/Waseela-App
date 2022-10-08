import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    Widget ListCard(mediaQuery) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          height: mediaQuery.size.height * 0.28,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      );
    }

    var filterSelected = 'All';

    Widget FilterButton(mediaQuery, name, selected) {
      return Padding(
          padding: EdgeInsets.all(5),
          child: InkWell(
            child: Container(
              height: mediaQuery.size.height * 0.04,
              constraints:
                  BoxConstraints(minWidth: mediaQuery.size.width * 0.17),
              decoration: BoxDecoration(
                  color: name == selected ? Colors.white : Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                    child: Text(
                  name,
                  style: TextStyle(
                      color:
                          name == selected ? Color(0xFF123939) : Colors.white),
                )),
              ),
            ),
          ));
    }

    return Scaffold(
      body: Stack(
        children: [
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
                  stops: [0.1, 0.1, 0.15, 0.25],
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
                            'Do Good List',
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
                    'Explore the needy.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: mediaQuery.size.height * 0.025,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Help them',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: mediaQuery.size.height * 0.015,
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
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    'Recent Donations',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: mediaQuery.size.height * 0.02),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: [
                      FilterButton(mediaQuery, 'All', filterSelected),
                      FilterButton(mediaQuery, 'Study', filterSelected),
                      FilterButton(mediaQuery, 'Loan', filterSelected),
                      FilterButton(mediaQuery, 'Helping', filterSelected),
                    ],
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: mediaQuery.size.height * 0.35),
              width: mediaQuery.size.width * 0.85,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                  ListCard(mediaQuery),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
