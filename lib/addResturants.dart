

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/resturants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

class addRes extends StatefulWidget {


  @override
  _addResState createState() => _addResState();
}

class _addResState extends State<addRes> {
  final _formkey = GlobalKey<FormState>();
  var Resturant;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar (
        title: Text("Add Resturants",style: TextStyle(fontSize: 16,color: Colors.deepPurple),),
      ),
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formkey,

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/af.jpg"),
                    fit: BoxFit.cover
                  ),

                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 90,
                width:90,
                color: Colors.grey,
              ),
              Column(
                children: <Widget>[



                     RaisedButton(

                      color: Colors.deepPurple,
                      textColor: Colors.black,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      onPressed: (){
                        showchoiceDialog(context);
                      },
                      child: Text("Select Image",style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white

                      )),
                    ),


                ],
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                onSaved: (input)=> databaseService().getTitle(input),
                cursorColor: Colors.blue,
                style: TextStyle(color: Colors.black),


                decoration: InputDecoration(


                    labelText: "Resturant Name",
                    labelStyle: new TextStyle(color: Colors.deepPurple),


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
                onSaved: (input)=> databaseService().getAddress(input),
                cursorColor: Colors.blue,
                style: TextStyle(color: Colors.black),


                decoration: InputDecoration(


                    labelText: "Address",
                    labelStyle: new TextStyle(color: Colors.deepPurple),


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
                onSaved: (input)=> databaseService().getCatagories(input),
                cursorColor: Colors.blue,
                style: TextStyle(color: Colors.black),


                decoration: InputDecoration(


                    labelText: "Catagories",
                    labelStyle: new TextStyle(color: Colors.deepPurple),


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
                onSaved: (input)=> databaseService().getDescription(input),
                cursorColor: Colors.blue,
                style: TextStyle(color: Colors.black),


                decoration: InputDecoration(


                    labelText: "Description",
                    labelStyle: new TextStyle(color: Colors.deepPurple),


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
                onSaved: (input)=> databaseService().getContact(input),
                cursorColor: Colors.blue,
                style: TextStyle(color: Colors.black),


                decoration: InputDecoration(


                    labelText: "Contact",
                    labelStyle: new TextStyle(color: Colors.deepPurple),


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
              Container(

                margin: EdgeInsets.only(top: 30.0),
                width: 202.0,
                height: 45.0,
                child: FlatButton(

                  color: Colors.deepPurple,

                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                  onPressed: add,
                  child:Text("Submit",style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white

                  )),
                ),

              ),



            ],
          ),
        ),

      ),
    );
  }

  File _imageFile;

  File get imageFile => _imageFile;

  set imageFile(File imageFile) {
    _imageFile = imageFile;
  }
  _openGallary(BuildContext context) async{


    imageFile= await (ImagePicker.pickImage(source: ImageSource.gallery));
    Navigator.of(context).pop();

  }

  _openCamera(BuildContext context) async{


    imageFile= await (ImagePicker.pickImage(source: ImageSource.camera));
    Navigator.of(context).pop();

  }
  _decideImageview() {

  }
  Future<void> showchoiceDialog (BuildContext context){
  return showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text("CHOOSE"),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text("Gallary"),
                onTap: (){
                  _openGallary(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  });
  }
  Future <void> add() async {
    final formstate = _formkey.currentState;


      formstate.save();

      print("dcsdbdbh");


    }
  }


class databaseService{
  final CollectionReference resCollection= Firestore.instance.collection('res');
  databaseService();
  Future getTitle(String title ) async{
    return await resCollection.document().setData({
      'title': title,

    });
  }
  Future getCatagories(String catagories ) async{
    return await resCollection.document().setData({
      'catagories': catagories,

    });
  }
  Future getAddress(String address ) async{
    return await resCollection.document().setData({
      'address': address,

    });
  }
  Future getDescription(String description ) async{
    return await resCollection.document().setData({
      'description': description,

    });
  }
  Future getContact(String contact ) async{
    return await resCollection.document().setData({
      'contact': contact,

    });
  }
}