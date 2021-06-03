import 'package:flutter/material.dart';
import 'package:laundry_concept/home.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey("AXXrQTfXjI7MkXYcdjf7c20XBiUuMiAK");
  MpesaFlutterPlugin.setConsumerSecret("bj1sL5MMhhBZRkEs");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
