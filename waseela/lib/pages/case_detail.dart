import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waseela/models/DonationCase.dart';

class CaseDetail extends StatefulWidget {
  final DonationCase donationCase;
  const CaseDetail(this.donationCase, {super.key});

  @override
  State<CaseDetail> createState() => _CaseDetailState();
}

class _CaseDetailState extends State<CaseDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
