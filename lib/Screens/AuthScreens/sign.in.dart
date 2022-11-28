// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unused_field, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

final ButtonStyle authbuttons = TextButton.styleFrom(
  elevation: 0,
  foregroundColor: Color.fromARGB(255, 0, 0, 0),
  backgroundColor: Color.fromARGB(255, 216, 216, 216),
  minimumSize: Size(88, 60),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
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
          fit: BoxFit.cover,
          image: AssetImage('assets/getstarted/background.jpg'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height40,
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: (() async {
                        widget.toggleView();
                      }),
                      style: circular,
                      child: Text("Register"),
                    )
                  ],
                )),
            Divider(
              color: Colors.black,
              thickness: 1,
              endIndent: 30,
              indent: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 15,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Color.fromARGB(142, 216, 216, 216),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            suffixIcon: Icon(Icons.mail,
                                color: Color.fromARGB(255, 0, 0, 0))),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an Email' : null,
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
                          fillColor: Color.fromARGB(142, 216, 216, 216),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          suffixIcon: Icon(
                            Icons.key_rounded,
                            color: Color.fromARGB(255, 0, 0, 0),
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
                    Divider(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: authbuttons,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.apple,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Continue with Apple')
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: authbuttons,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Continue with Facebook')
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: authbuttons,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.g_mobiledata,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Continue with Google')
                              ],
                            )),
                      ],
                    ),
                    Divider(height: 10),
                    ScaffoldMessenger(
                        child: Text(
                      error,
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Color.fromRGBO(255, 55, 95, 1),
          onPressed: (() async {
            if (_formKey.currentState!.validate()) {
              setState(() {
                loading = true;
              });
              dynamic result =
                  await _auth.signInWithEmailandPassword(email, password);
              if (result == null) {
                setState(() {
                  loading = false;
                  error = 'Please Supply a Valid Email';
                });
              }
            }
          }),
          label: Text(
            "Sign In",
          )),
    );
  }
}
