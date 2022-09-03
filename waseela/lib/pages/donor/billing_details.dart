import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({Key? key}) : super(key: key);

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    // List<String> billingMethods = ['Credit/Debit Card', 'PayPal', 'Google Pay'];

    var CURRENT_STATE = 'Google Pay';

    Widget BillingMethodCard(mediaQuery, method_name, curr_state) {
      return Card(
        color: curr_state == method_name ? Colors.white : Colors.grey[100],
        margin: EdgeInsets.only(
            top: mediaQuery.size.height * 0.02,
            bottom: mediaQuery.size.height * 0.01,
            right: mediaQuery.size.width * 0.1,
            left: mediaQuery.size.width * 0.1),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {
            setState(() {
              CURRENT_STATE = method_name;
            });
            print(CURRENT_STATE);
          },
          child: Padding(
            padding: EdgeInsets.only(
                top: mediaQuery.size.height * 0.01,
                bottom: mediaQuery.size.height * 0.01),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('${method_name}',
                        style: TextStyle(
                            letterSpacing: 0.08,
                            fontSize: mediaQuery.size.width * 0.05,
                            fontWeight: FontWeight.w500)),
                  ),
                  curr_state == method_name
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.circle,
                            color: Colors.orange,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.circle_outlined),
                        )
                ]),
          ),
        ),
      );
    }

    bool isFinished = false;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          leading: Padding(
            padding: EdgeInsets.only(left: mediaQuery.size.width * 0.032),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              iconSize: mediaQuery.size.width * 0.08,
              onPressed: () {},
            ),
          ),
          title: Text(
            'Billing Detail',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: mediaQuery.size.width * 0.032),
              child: IconButton(
                icon: const Icon(Icons.payments_outlined),
                color: Colors.black,
                iconSize: mediaQuery.size.width * 0.08,
                onPressed: () {},
              ),
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Container(
                height: mediaQuery.size.height * 0.3,
                width: mediaQuery.size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.green),
              ),
            ),
            BillingMethodCard(mediaQuery, 'Credit/Debit Card', CURRENT_STATE),
            BillingMethodCard(mediaQuery, 'Google Pay', CURRENT_STATE),
            BillingMethodCard(mediaQuery, 'PayPal', CURRENT_STATE),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Container(
              width: mediaQuery.size.width * 0.8,
              child: SwipeableButtonView(
                  onFinish: () async {
                    print('doneeee');
                  },
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      isFinished = true;
                    });
                  },
                  activeColor: Colors.orange,
                  isFinished: isFinished,
                  buttonWidget: Container(
                    width: mediaQuery.size.width * 0.3,
                    child: Icon(
                      Icons.keyboard_double_arrow_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                  buttonColor: Colors.grey[800],
                  buttontextstyle: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: mediaQuery.size.height * 0.025),
                  buttonText: '\$100'),
            )
          ],
        ),
      ),
    );
  }
}
