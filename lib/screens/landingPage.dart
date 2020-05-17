import 'package:fitness/model/user.dart';
import 'package:fitness/screens/AuthorizationPage.dart';
import 'package:fitness/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<User>(context) != null ? HomePage() : AuthorizationPage();
  }
}