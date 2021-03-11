import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/screeens/register_page.dart';
import 'package:storeapp/widgets/customButton.dart';
import 'package:storeapp/widgets/customInput.dart';

class LoginPage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<LoginPage> {

  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _logInFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if(_logInFeedback != null) {
      _alertDialogBuilder(_logInFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Welcome user\nLogin to your account",
                textAlign: TextAlign.center,
                style: Constants.boldHeading,
              ),
            ),
            Column(
              children: [
                CustomInput(
                  hintText: "Email",
                  onChange: (value) {
                    _loginEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,
                ),
                CustomInput(
                  hintText: "Password",
                  onChange: (value) {
                    _loginPassword = value;
                  },
                  focusNode: _passwordFocusNode,
                  isPasswordField: true,
                  onSubmitted: (value) {
                    _submitForm();
                  },
                ),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    _submitForm();
                  },
                  isLoading: _loginFormLoading,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: CustomButton(
                text: "Create New Account",
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                outlineBtn: true,
              ),
            )
          ],
        ),
      )),
    );
  }
}
