import 'package:fitness/widget/BottomWaveClipper.dart';
import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            SizedBox(height: MediaQuery.of(context).size.height / 9),
            (
                showLogin
                    ? _formColumn('LOGIN', 'Not registered yet? Register!')
                    : _formColumn('REGISTER', 'Already Registered? Login!')
            ),
            _bottomWave(),
          ],
        ));
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
      child: Container(
        child: Align(
          child: Text(
            'FITNESS',
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headline6.color),
          ),
        ),
      ),
    );
  }

  Column _formColumn(String buttonText, String hintText) {
    return Column(
      children: <Widget>[
        _form(buttonText, _buttonAction),
        Padding(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            child: Text(hintText, style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              setState(() {
                showLogin = !showLogin;
              });
            },
          ),
        ),
      ],
    );
  }

  void _buttonAction() {
    _email = _emailController.text;
    _password = _passwordController.text;

    _emailController.clear();
    _passwordController.clear();
  }

  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: _input(Icon(Icons.email), "Email", _emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(Icon(Icons.lock), "Password", _passwordController, true),
          ),
          //SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: _button(label, func),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input(Icon icon, String hint, TextEditingController editingController, bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: editingController,
        obscureText: obscure,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1)
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(String text, void func()) {
    return RaisedButton(
      splashColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Theme.of(context).primaryColor),
      ),
      onPressed: () {
        func();
      },
    );
  }

  Widget _bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 250,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

}