import 'package:flutter/material.dart';
import 'package:passapp_clone/screens/contact_us_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  static const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
      return const ContactUsWidgets();
  }
}

