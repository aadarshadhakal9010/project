

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/signUp.dart';


class loginpage extends StatefulWidget {
  loginpage({Key key}) :super(key:key);

  @override
  _loginpagestate createState() => new _loginpagestate();
}
class _loginpagestate extends State<loginpage> {
  String _email, _password;

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Form(
            key: _formkey,


            child: Container(


                decoration: BoxDecoration(

                    image: DecorationImage(
                        image: AssetImage("images/abf.jpg"),
                        fit: BoxFit.cover,



                    )
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text("Rate Restro", style: TextStyle(
                        fontSize: 51.0,
                        color: Colors.pinkAccent

                    ), textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: 300,
                        height: 300,
                        color: Colors.white12,

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
                              style: TextStyle(color: Colors.black),


                              decoration: InputDecoration(


                                  labelText: "Email",
                                  labelStyle: new TextStyle(color: Colors.pinkAccent),


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
                            SizedBox(height: 05.0,),
                            TextFormField(
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'your password needs to be atleast 6 characters ';
                                }
                              },
                              onSaved: (input) => _password = input,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: new TextStyle(color: Colors.pinkAccent),
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

                              margin: EdgeInsets.only(top: 30.0),
                              width: 202.0,
                              height: 45.0,
                              child: FlatButton(

                                color: Colors.pinkAccent,
                                textColor: Colors.black,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                                onPressed: login,
                                child: Text("Login",style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white

                                )),
                              ),

                            ),
                            Container(
                                margin: EdgeInsets.only(top: 50.0),
                                width: 150.0,
                                height: 45.0,
                                child: FlatButton(
                                  color: Colors.pinkAccent,
                                  textColor: Colors.black,
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => signup()));
                                  },
                                  child: Text("Sign up", style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white

                                  )),
                                )

                            )
                          ],
                        ),

                      ),


                    ),

                  ],


                )

            )

        ));


    // ignore: dead_code

  }

  Future <void> login() async {
    final formstate = _formkey.currentState;

    if (formstate.validate()) {
      formstate.save();


        final FirebaseUser user= (await FirebaseAuth.instance
             .signInWithEmailAndPassword(email: _email, password: _password)).user;


        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));

    }
  }
}
