import 'package:flutter/material.dart';
import 'package:rewards_converter/done.dart';
import 'package:rewards_converter/firestore.dart';
import 'package:rewards_converter/signin.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String paymentMode = 'UPI';
String userData;
int userAmt;

class _MyHomePageState extends State<MyHomePage> {
  final amounts = [20, 50, 100, 200, 500, 1000, 5000, 10000];
  List<String> paymentList = ['Paytm', 'GooglePay', 'PayPal', 'UPI'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rewards Converter'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hi $name! \nConvert your Google Play Store Coupons or rewards to real Money',
                    overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Select Payment reciving method
                  Text('Select a method to recive Money'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: DropdownButton<String>(
                      value: paymentMode,
                      hint: Text('Select Payment Method'),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String data) {
                        setState(() {
                          paymentMode = data;
                        });
                      },
                      items: paymentList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Enter phone no or upi id or email
                  Text(paymentMode == 'UPI'
                      ? 'Enter UPI id'
                      : paymentMode == 'PayPal'
                          ? 'Enter Ph. no./ Email linked with Paypal'
                          : 'Enter Phone No. Linked with $paymentMode'),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    // textInputAction: TextInputAction.continueAction,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        userData = value;
                      });
                    },
                    enabled: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      icon: Icon(Icons.phone_android),
                      hintText: paymentMode == 'UPI'
                          ? 'UPI id'
                          : paymentMode == 'PayPal'
                              ? 'Email/Phone No.'
                              : 'Phone No.',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Select Reward Amount
                  Text('Choose amount from below options'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: amounts.length,
                        // itemExtent: 10.0,
                        // reverse: true, //makes the list appear in descending order
                        itemBuilder: (BuildContext context, int index) {
                          return RaisedButton(
                            onPressed: () {
                              setState(() {
                                userAmt = amounts[index];
                              });
                            },
                            color: userAmt != null && amounts[index] == userAmt
                                ? Colors.tealAccent
                                : Colors.white,
                            child: Text('Rs. ' + amounts[index].toString()),
                          );
                        }),
                  ),
                  Text(
                    'Scroll -> for more.',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 10),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    onPressed: () {
                      uploadingData(
                          name, userAmt, email, userData, paymentMode);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinalPage(),
                          ));
                    },
                    color: Colors.teal,
                    child: Text(
                      'Get Your Money!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
