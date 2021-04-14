import 'package:flutter/material.dart';
import 'package:flutter_app/config/pallete.dart';
import 'package:flutter_icons/flutter_icons.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _obscurePassword;
  bool _autovalidate;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _autovalidate = false;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Palette.backgroundColor,
    body: Stack(
    children: [
    Positioned(
    top: 0,
    right: 0,
    left: 0,
    child: Container(
    height: 350,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/login.jpg'),
    fit: BoxFit.fill,
    ),
    ),
    child: Container(
    padding: EdgeInsets.only(top: 100, left: 20),
    color: Colors.purple.withOpacity(0.60),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    RichText(
    text: TextSpan(
    text: 'Welcome Back to',
    style: TextStyle(
    fontSize: 30,
    color: Colors.white,
    letterSpacing: 2,
    fontFamily: 'Nunito',
    ),
    children: [
    TextSpan(
    text: ' Tilo,',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 35,
    fontFamily: 'KiwiMaru'),
    ),
    ],
    ),
    ),
    Text(
    'Log in for best shopping',
    style: TextStyle(
    color: Colors.white,
    fontFamily: 'Nunito',
    fontSize: 20,
    letterSpacing: 2,
    //fontWeight: FontWeight.bold
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    Positioned(
    top: 230,
    child: Container(
    padding: EdgeInsets.all(20),
    height: 330,
    width: MediaQuery.of(context).size.width - 40,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.3),
    blurRadius: 15,
    spreadRadius: 5)
    ],
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Text(
    'LOGIN',
    style: TextStyle(
    fontFamily: 'Nunito',
    color: Colors.grey[600],
    fontWeight: FontWeight.bold,
    fontSize: 20,
    ),
    ),
    Container(
    margin: EdgeInsets.only(top: 20),
        child: _buildLoginForm(),
    ),
    ],
    ),
    ),
    ),
      ],
    ),
    );
  }
  Widget _buildLoginForm() {
    return Form(
      key: _key,
      autovalidate: _autovalidate,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                isDense: true,
              ),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: _validateEmail,
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: _obscurePassword,
              controller: _passwordController,
              validator: (val) => _validateRequired(val, 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: FloatingActionButton(
                  backgroundColor: Colors.purple,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  child: Text('LOGIN'),
                  onPressed: _validateFormAndLogin),
            ),
          ],
        ),
      ),
    );
  }

  String _validateRequired(String val, fieldName) {
    if (val == null || val == '') {
      return '$fieldName is required';
    }
    return null;
  }

  String _validateEmail(String value) {
    if (value == null || value == '') {
      return 'Email is required';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }

  void _validateFormAndLogin() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState.validate()) {
      print('Form is valid');
    } else {
      // show validation errors
      // setState forces our [State] to rebuild
      setState(() {
        _autovalidate = true;
      });
    }
  }
}

