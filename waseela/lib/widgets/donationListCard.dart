import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waseela/models/DonationCase.dart';

class DonationListCard extends StatefulWidget {
  final DonationCase donationCase;
  const DonationListCard(this.donationCase, {super.key});

  @override
  State<DonationListCard> createState() => _DonationListCardState();
}

class _DonationListCardState extends State<DonationListCard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    String category = "";
    if (widget.donationCase.category == "Monthly") {
      category = " /month";
    } else if (widget.donationCase.category == "Target") {
      category = " required";
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        // height: mediaQuery.size.height * 0.28,
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.all(mediaQuery.size.height * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.donationCase.title,
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: mediaQuery.size.height * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.01),
              child: Text(
                widget.donationCase.description,
                style: TextStyle(
                    color: Colors.indigo[900],
                    fontSize: mediaQuery.size.height * 0.015),
              ),
            ),
            Row(
              children: [
                Text(
                  "Rs. ${widget.donationCase.amountRequired.toString()}",
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: mediaQuery.size.height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: mediaQuery.size.height * 0.022,
                  ),
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.05,
                ),
                Expanded(
                    child: MaterialButton(
                        onPressed: () {},
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                        color:Colors.white,
                        child: Text(
                          "Donate",
                          style: TextStyle(
                              color: Colors.indigo[900],
                              fontSize: mediaQuery.size.height * 0.02,
                              fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
