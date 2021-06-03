import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class Payment extends StatefulWidget {
  final double amount;

  Payment({this.amount});
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm Phone Number'),
      content: Container(
        child: TextField(
          maxLength: 12,
          onChanged: (value) {
            this.phoneNumber = value;
          },
          decoration: InputDecoration(
            hintText: "254xxxxxxxxx",
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF0E2433), width: 3.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF0E2433), width: 2.0),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'CANCEL',
            style: TextStyle(color: Colors.red.shade400),
          ),
        ),
        TextButton(
            onPressed: () {
              print("before pay");
              pay(widget.amount, this.phoneNumber);
            },
            child: Text(
              'CONFIRM',
              style: TextStyle(color: Color(0XFF0E2433)),
            )),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  pay(double amount, String phone) async {
    try {
      Uri callback = Uri(
          scheme: "https",
          host: "mpesa-requestbin.herokuapp.com",
          path: "/149blrz1");

      print("try mpesa");
      //Run it
      var transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: amount,
              partyA: phone,
              partyB: "174379",
              //callBackURL: "http://mpesa-requestbin.herokuapp.com/149blrz1",
              callBackURL: callback,
              accountReference: "Laundry Services",
              phoneNumber: "$phone",
              baseUri: Uri(
                scheme: "https",
                host: "sandbox.safaricom.co.ke",
              ),
              transactionDesc: "Sample payment",
              passKey:
                  "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");
      print("tried");
      print(transactionInitialisation);
    } catch (e) {
      //you can implement your exception handling here.
      //Network unreachability is a sure exception.
      print(e.toString());
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
