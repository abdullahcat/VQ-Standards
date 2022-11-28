// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:vqstandards_beta/Services/auth.dart';
import 'package:vqstandards_beta/Services/dimensions.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  bool? resizeToAvoidBottomInset;
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                image: AssetImage('assets/getstarted/background.jpg'))),
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
                      "Register",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: (() async {
                        widget.toggleView();
                      }),
                      style: circular,
                      child: Text("Sign In"),
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
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
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
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Divider(height: 10),
                    ScaffoldMessenger(
                        child: Text(
                      error,
                    )),
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
            dynamic result =
                await _auth.registerWithEmailandPassword(email, password);
            if (result == null) {
              setState(() {
                error = 'Please Supply a Valid Email';
              });
            }
          }
        }),
        label: Text(
          "Register",
        ),
      ),

      //floatingActionButton: FloatingActionButton.extended(
      //  backgroundColor: Color.fromRGBO(255, 55, 95, 1),
      //  onPressed: () => _auth.signInAnon(),
      //  label: Text(
      //    "Skip For Now",
      //  ),
      //),
    );
  }
}
