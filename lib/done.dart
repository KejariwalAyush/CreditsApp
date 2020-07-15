import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewards_converter/MyHomePage.dart';
import 'package:rewards_converter/signin.dart';

class FinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credits App'),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Text(
                'Congratulation !!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lemonada(
                  // TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
                'Your Transection was sucessful \nYou will recive your money within 3-4 working days'),
            SizedBox(
              height: 30,
            ),
            Text(
                'Name: \t$name\nEmail: \t$email\nPhone/UPI id: $userData\nAmount: \t$userAmt\nPayment Mode: $paymentMode'),
          ],
        ),
      ),
    );
  }
}
