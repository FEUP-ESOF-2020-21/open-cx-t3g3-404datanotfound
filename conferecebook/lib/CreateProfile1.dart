import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './Login.dart';
import 'package:adobe_xd/page_link.dart';
import './CreateProfile2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width / 412;
    screenHeight = _mediaQueryData.size.height / 870;
  }
}

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
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> _profileKey=GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Display Name'),
      validator: (String value){
        if(value.isEmpty){
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value){ //only called when form was saved
        _name=value;
      },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email Address'),
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
        _email=value;
      },
    );
  }

  Widget _buildPassword(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value){
        // ignore: missing_return
        if(value.isEmpty){
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String value){ //only called when form was saved
        _password=value;
      },
    );
  }

  Widget _buildBio(){
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(labelText: 'Bio'),
      maxLength: 250,
      onSaved: (String value){ //only called when form was saved
        _bio=value;
      },
    );
  }

  Widget _buildCity(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'City of Living'),

      onSaved: (String value){ //only called when form was saved
        _city=value;
      },
    );
  }

  Widget _buildAcademicBackground(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Academic Background'),

      onSaved: (String value){ //only called when form was saved
        _academicBackground=value;
      },
    );
  }

  Widget _buildCurrentJob(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Current Job'),

      onSaved: (String value){ //only called when form was saved
        _currentJob=value;
      },
    );
  }

  Widget _buildLinkedInUrl(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'LinkedIn Url'),
      keyboardType: TextInputType.url,
      onSaved: (String value){ //only called when form was saved
        _linkedInUrl=value;
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
              AssetImage('assets/mark.jpeg') //default image
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
                  color: Colors.deepPurpleAccent,
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
      appBar: AppBar(title:Text("Create Account"),backgroundColor: Colors.deepPurpleAccent),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _profileKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
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
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  if(!_profileKey.currentState.validate()){
                    return; //when form is invalid
                  }
                  _profileKey.currentState.save(); //save the form - use latter

                  //here is where we should put what we want to do with the data!
                  print(_name);

                },
              )
            ],
          ),),
      ),
    );
  }
}