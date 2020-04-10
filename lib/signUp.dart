import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/login.dart';
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  String _email, _password;

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/abj.jpeg"),
                  fit: BoxFit.cover

              )

          ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              Text("Sign up", style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.blue

              ), textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 300,
                  height: 300,

                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'please type an email';
                          }
                        },
                        onSaved: (input) => _email = input,
                        cursorColor: Colors.blue,

                        decoration: InputDecoration(
                            labelText: "Email",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(

                                )
                            )


                        ),

                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return 'your password needs to be atleast 6 characters ';
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: InputDecoration(
                            labelText: "Password",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue
                                )
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(

                                )
                            )
                        ),
                        obscureText: true,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20.0),
                        child: FlatButton(
                          color: Colors.blue,
                          textColor: Colors.black,
                          onPressed: signups,
                          child: Text("sign up"),
                        ),

                      ),
                      Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: FlatButton(
                            color: Colors.blue,
                            textColor: Colors.black,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => loginpage()));
                            },
                            child: Text("Back"),
                          )

                      )

                    ],
                  ),
                ),
              )

            ]
        ),
      ),
    ));
  }

  void signups()async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();

      FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password) ;


        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));



    }
  }
}