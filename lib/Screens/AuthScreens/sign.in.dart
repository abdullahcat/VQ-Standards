// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Services/auth.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

final ButtonStyle circular = TextButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Color.fromRGBO(255, 55, 95, 1),
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

bool? resizeToAvoidBottomInset;
bool loading = false;

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image3.JPG"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 25,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: Dimensions.height100),
              Image.asset(
                "assets/images/logo.png",
              ),
              SizedBox(height: 20),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromARGB(133, 189, 189, 189),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(255, 55, 95, 1),
                        ),
                      ),
                      prefixIcon: Icon(Icons.mail,
                          color: Color.fromRGBO(255, 55, 95, 1))),
                  validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Password",
                    filled: true,
                    fillColor: Color.fromARGB(133, 189, 189, 189),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 55, 95, 1),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.key_rounded,
                      color: Color.fromRGBO(255, 55, 95, 1),
                    )),
                validator: (val) => val!.length < 8
                    ? 'Password must be at least 8+ chars long.'
                    : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 10),
              ButtonBar(
                buttonPadding: EdgeInsets.all(10),
                alignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AuthService().signInWithGoogle();
                    },
                    child: Text("Sign In via Google"),
                  ),
                  ElevatedButton(
                    onPressed: (() async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailandPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'Please Supply a Valid Email';
                          });
                        }
                      }
                    }),
                    style: circular,
                    child: Text("Sign In"),
                  ),
                  SizedBox(
                    child: Text(
                      "Or",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() async {
                      widget.toggleView();
                    }),
                    style: circular,
                    child: Text("Register"),
                  )
                ],
              ),
              ScaffoldMessenger(
                  child: Text(
                error,
              ))
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(255, 55, 95, 1),
          onPressed: () => _auth.signInAnon(),
          label: Text(
            "Skip For Now",
          )),
    );
  }
}
