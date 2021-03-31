import 'package:flutter/material.dart';

import '../helper.dart';

class AboutPage extends StatefulWidget {
  static const route = 'AboutPage';

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'about_us')),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(getTranslated(context, 'about')),
        ),
      ),
    );
  }
}