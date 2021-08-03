import 'package:flutter/material.dart';
import 'package:flutterfooddelivery/src/pages/signup_page.dart';
import 'package:flutterfooddelivery/src/widgets/button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool _toggleVisibility = true;

  Widget _buildEmailTextField()
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFBDC2CB),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField()
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFBDC2CB),
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Button(btnText: "Sign In"),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Color(0xFFBDC2CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
