import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waseela/models/DonationCase.dart';
import 'package:intl/intl.dart';

class CaseDetail extends StatefulWidget {
  final DonationCase donationCase;
  const CaseDetail(this.donationCase, {super.key});

  @override
  State<CaseDetail> createState() => _CaseDetailState();
}

class _CaseDetailState extends State<CaseDetail> {
  // DonationCase donationCase = new DonationCase(amountRequired: amountRequired, amountCollected: amountCollected, address: address, title: title, description: description, closingDate: closingDate, category: category, startDate: startDate, accountId: accountId, showCase: showCase, showReceiverDetails: showReceiverDetails);
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.05,
          horizontal: mediaQuery.size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.donationCase.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mediaQuery.size.height * 0.04),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.04,
          ),
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Description: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.022),
                ),
                TextSpan(
                    text: widget.donationCase.description,
                    style: TextStyle(fontSize: mediaQuery.size.height * 0.022)),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Address: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.022),
                ),
                TextSpan(
                    text: widget.donationCase.address,
                    style: TextStyle(fontSize: mediaQuery.size.height * 0.022)),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          // donationCase.category=="Crowdfunding"?
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Target amount: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.022),
                ),
                TextSpan(
                    text:
                        "${widget.donationCase.amountRequired.toString()} rupees",
                    style: TextStyle(fontSize: mediaQuery.size.height * 0.022)),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Amount collected: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.022),
                ),
                TextSpan(
                    text:
                        "${widget.donationCase.amountCollected.toString()} rupees",
                    style: TextStyle(fontSize: mediaQuery.size.height * 0.022)),
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.03,
          ),
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Closing Date: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.022),
                ),
                TextSpan(
                    text: DateFormat.yMMMMd('en_US')
                        .add_jm()
                        .format(widget.donationCase.closingDate),
                    style: TextStyle(fontSize: mediaQuery.size.height * 0.022)),
              ],
            ),
          ),

          SizedBox(
            height: mediaQuery.size.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:mediaQuery.size.width*0.3),
            child: MaterialButton(
                onPressed: () {},
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                color: Colors.white,
                child: Text(
                  "Donate",
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: mediaQuery.size.height * 0.02,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ));
  }
}
