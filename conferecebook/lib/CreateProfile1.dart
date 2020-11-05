import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'db/Database.dart';
import 'db/UserModel.dart';
import './Login.dart';
import './CreateProfile2.dart';


class CreateProfile1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyProfileState();
  }
}

class MyProfileState extends State<CreateProfile1>{

  String _name;
  String _email;
  String _password;
  String _bio;
  String _city;
  String _academicBackground;
  String _currentJob;
  String _linkedInUrl;
  String _interests;
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> _profileKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Display Name'),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value){ //only called when form was saved
        _name = value;
      },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Email Address'),
      validator: (String value){
        if(value.isEmpty){
          return 'Email Address is Required';
        }

        if(!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)){
          return 'Please enter a valid email'; //when email is invalid
        }
        return null;
      },
      onSaved: (String value){ //only called when form was saved
        _email = value;
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        // ignore: missing_return
        if(value.isEmpty){
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value){ //only called when form was saved
        _password = value;
      },
    );
  }

  Widget _buildBio(){
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Bio'),
      maxLength: 250,
      onSaved: (String value){ //only called when form was saved
        _bio = value;
      },
    );
  }

  Widget _buildCity(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'City of Living'),

      onSaved: (String value){ //only called when form was saved
        _city = value;
      },
    );
  }

  Widget _buildAcademicBackground(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Academic Background'),

      onSaved: (String value){ //only called when form was saved
        _academicBackground = value;
      },
    );
  }

  Widget _buildCurrentJob(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Current Job'),

      onSaved: (String value){ //only called when form was saved
        _currentJob = value;
      },
    );
  }

  Widget _buildLinkedInUrl(){
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'LinkedIn Url'),
      keyboardType: TextInputType.url,
      onSaved: (String value){ //only called when form was saved
        _linkedInUrl = value;
      },
    );
  }

  Widget _buildInterests(){
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff1A2677))),
          labelText: 'Interests'),
      maxLength: 250,
      onSaved: (String value){ //only called when form was saved
        _interests = value;
      },
    );
  }

  Widget imageProfile(){
    return Center(

      child: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage:_imageFile==null?
              AssetImage('images/mark.jpeg') //default image
                  :FileImage(File(_imageFile.path)),
            ),
            Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder)=> bottomSheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: const Color(0xff1A2677),
                  size: 28.0,
                ),
              ),
            ),
          ]),
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontSize:20.0,
            ),
          ),
          SizedBox(
            height:20,
          ),
          Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: (){
                    takePhoto(ImageSource.camera);
                  },
                  label: Text('Camera'),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: (){
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text('Gallery'),
                ),
              ]
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async{
    final pickedFile = await _picker.getImage(
    source: source,
    );
    setState((){
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("Create Account"),backgroundColor: const Color(0xff1A2677)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _profileKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              SizedBox(height: 20),
              _buildEmail(),
              SizedBox(height: 20),
              _buildPassword(),
              SizedBox(height: 20),
              _buildCity(),
              SizedBox(height: 20),
              _buildAcademicBackground(),
              SizedBox(height: 20),
              _buildCurrentJob(),
              SizedBox(height: 20),
              _buildLinkedInUrl(),
              SizedBox(height: 20),
              _buildBio(),
              SizedBox(height: 20),
              _buildInterests(),
              SizedBox(height: 50),
              imageProfile(),
              SizedBox(height: 50),
              RaisedButton(
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                color: const Color(0xff1A2677),
                onPressed: () async {
                  if (!_profileKey.currentState.validate()) {
                    return; //when form is invalid
                  }

                  _profileKey.currentState.save(); //save the form - use latter

                  var newDBUser = User( //create User after form
                      email:_email,
                      password: _password,
                      displayName: _name,
                      cityOfLiving: _city,
                      academicBackground: _academicBackground,
                      currentJob: _currentJob,
                      linkedInURL: _linkedInUrl,
                      bio: _bio,
                      interests: _interests
                  );

                  //DATABASE WORKS!!

                  //init DB if necessary and insert user just created
                  DBProvider.db.insertUser(newDBUser);

                  //query for the user created, with PRIMARY KEY, and print
                  print(await DBProvider.db.getUser(newDBUser.email));

                  //EXPERIMENTS (all work):
                  //print(await DBProvider.db.getAllUsers());
                  //DBProvider.db.deleteAllUsers();
                  //print(await DBProvider.db.getLastUser());

                  // TO-DO: handle existing accounts; (insert INTERESTS(done))
                  // TO-DO: insert photo to class User
                  // TO-DO: with getUser method, evaluate login

                  Navigator.push( //upon pressed, takes user to next page
                    context,
                    MaterialPageRoute(builder: (context) => CreateProfile2()),
                  );
                },
              ),
            ],
          ),
            ),
      ),
    );
  }
}