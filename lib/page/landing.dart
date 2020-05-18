import 'package:fitness/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authorization.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<User>(context) != null ? HomePage() : AuthorizationPage();
  }
}