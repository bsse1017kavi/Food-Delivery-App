import 'package:flutter/material.dart';
import 'package:flutterfooddelivery/src/pages/signin_page.dart';
import 'package:flutterfooddelivery/src/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _toggleVisibility = true;
  bool _toggleConfirmVisibility = true;

  Widget _buildEmailTextField()
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFBDC2CB),
        ),
      ),
    );
  }

  Widget _buildUsernameTextField()
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Username",
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

  Widget _buildConfirmPasswordTextField()
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFBDC2CB),
        ),
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              _toggleConfirmVisibility = !_toggleConfirmVisibility;
            });
          },
          icon: _toggleConfirmVisibility ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleConfirmVisibility,
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
              "Sign Up",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 50.0,),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    _buildUsernameTextField(),
                    SizedBox(height: 20.0,),
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                    SizedBox(height: 20.0,),
                    _buildConfirmPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Button(btnText: "Sign Up",),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Color(0xFFBDC2CB),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                  },
                  child: Text(
                    "Sign In",
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
