import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkup_v2/screens/welcome/signUpPage.dart';
import '../tabBarScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GuestLoginPage extends StatefulWidget {
  GuestLoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GuestLoginPageState createState() => _GuestLoginPageState();
}

class _GuestLoginPageState extends State<GuestLoginPage> {
  @override
  void initState() {
    super.initState();
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  String email, password;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  Color njitRed = const Color(0xffCD0200);
  Color njitBlue = const Color(0xff010033);

  cantLoginAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login Failed"),
          content: Text("Email or password is incorrect.\nPlease try again."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        email = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: njitBlue,
        title: Text("Guest Login"),
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    height: 250.0,
                    child: Image.asset(
                      "assets/images/NJIT_Highlanders_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 35.0),
                Material(
                  elevation: 5.0,
                  color: njitRed,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          print('user successfully logged in: $email');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TabBarScreen(),
                            ),
                          );
                        }
                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        cantLoginAlertDialog(context);
                      }
                    },
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Material(
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                      setState(() {
                        showSpinner = false;
                      });
                    },
                    child: Text(
                      "Not Registered? Sign Up",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                        color: njitBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
