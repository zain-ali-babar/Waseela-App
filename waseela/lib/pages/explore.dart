import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waseela/models/DonationCase.dart';
import 'package:waseela/widgets/donationListCard.dart';

import '../models/DonationCase.dart';

class Explore extends StatefulWidget {
  final String phone;
  const Explore(this.phone, {super.key});
  // const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference donationCase =
      FirebaseFirestore.instance.collection('donationCase');
  List<DonationCase> donations = [];

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await donationCase.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // print(allData);
    for (var element in allData) {
      donations.add(DonationCase.fromJson(element as Map<String, dynamic>));
    }

    for (var element in donations) {
      element.printData();
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            decoration: const BoxDecoration(
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
          // FutureBuilder<DocumentSnapshot>(
          //   future: donationCase.doc(documentId).get(),
          //   builder:
          //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          //     if (snapshot.hasError) {
          //       return Text("Something went wrong");
          //     }

          //     if (snapshot.hasData && !snapshot.data!.exists) {
          //       return Text("Document does not exist");
          //     }

          //     if (snapshot.connectionState == ConnectionState.done) {
          //       Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          //       return Text("Full Name: ${data['full_name']} ${data['last_name']}");
          //     }

          //     return Text("loading");
          //   },
          // ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: mediaQuery.size.height * 0.35),
              width: mediaQuery.size.width * 0.85,
              // child: ListView.builder(
              //   itemCount: donations.length,
              //   itemBuilder: ((context, index) {
              //     return DonationListCard(donations[index]);
              //   }),
              // ),
              child: StreamBuilder<QuerySnapshot>(
                stream: donationCase.get().asStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      // print("^^^^^^DATA^^^^^^^");
                      // print(data);
                      return DonationListCard(DonationCase.fromJson(data));
                    }).toList(),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
