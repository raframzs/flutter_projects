import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/donationButtons/paypalButton.dart';
import 'package:university_blog/widgets/home/blog_appbar.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlogAppBar(),
      body: Center(
        child: PayPalButton(
          paypalButtonId: "JFE2MHUWKMLTL",
          donationText: 'Donar con Paypal',
          style: ElevatedButton.styleFrom(
            elevation: 20,
          ),
        ),
      ),
    );
  }
}
