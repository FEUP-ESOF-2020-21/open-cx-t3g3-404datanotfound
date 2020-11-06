import 'dart:io';
import 'dart:async';

import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:material_tag_editor/tag_editor.dart';

import './Login.dart';


class CreateProfile1 extends StatefulWidget{
  CreateProfile1({Key key, this.auth}) : super(key: key);

  final FirebaseAuth auth;

  @override
  State<StatefulWidget> createState() =>
      MyProfileState();
}

class MyProfileState extends State<CreateProfile1>{
/*
  String lastValidatedEmail;
  String lastRejectedEmail;
  bool accepted = false;

// this will be called upon user interaction or re-initiation as commented below
  String validateEmail(String email) {
    if (email.isEmpty) {
      accepted = false;
      return 'Email is required';
    } else if(!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(email)){
      accepted = false;
      return 'Please enter a valid email'; //when email is invalid
    } else if (lastValidatedEmail == email) {
      accepted = true;
      return null;
    } else if (lastRejectedEmail == email) {
      accepted = false;
      return "There's already an account with this e-mail";
    } else {
      initiateAsyncEmailValidation(email);
      return "Validation in progress";
    }
  }

  Future<void> initiateAsyncEmailValidation(String email) async {
    var val;
    if (val != null) {
      lastRejectedEmail = email;
    } else {
      lastValidatedEmail = email;
    }
    _formKey.currentState.validate(); // this will re-initiate the validation
  }

  final _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;
  String _bio;
  String _city;
  String _academicBackground;
  String _currentJob;
  String _linkedInUrl;
  String _interests;

  List<String> values = [];// for tags

  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> _profileKey = GlobalKey<FormState>();*/

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  showAlertDialog1(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Existing account"),
      content: Text("The email address is already in use by another account"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialog2(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Invalid Password"),
      content: Text("Password should be at least 6 characters"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialog3(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Invalid E-mail"),
      content: Text("Please insert a valid email"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialog0(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Empty field"),
      content: Text("Please fill the e-mail and password fields"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  // ignore: missing_return
  Future<String> _register() async {
    // ignore: deprecated_member_use
    try {
      // ignore: deprecated_member_use
      final FirebaseUser user = (await widget.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
      ).user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
        return "";
      } else {
        setState(() {
          _success = true;
        });
        return "";
      }

  } catch (e) {
      print(e.toString());
    if (e.toString() == '[firebase_auth/weak-password] Password should be at least 6 characters') {
      return "Password";
    } else if (e.toString() == '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      return "Email";
    } else if (e.toString() == '[firebase_auth/invalid-email] The email address is badly formatted.') {
      return "Email format";
    } else {
      return "Other error";
    }
  }}

  Widget appIcon() {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
          children: <Widget>[
    Transform.translate(
      offset: Offset(SizeConfig.screenWidth * 164.0,
          SizeConfig.screenHeight * 134.0),
      child: Image.asset('images/icon.png',
        height: 90.0,
        width: 90.0,
      ),
    )]));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  FirebaseAuth auth;

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    auth = widget.auth;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Account"),
        backgroundColor: const Color(0xff1A2677),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.translate(
              offset: Offset(
                  SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 300.0),
              child: Container(
                width: 270.0,
                child: TextFormField(
                  controller: _passwordController,
                  onChanged: (String value) async {
                    this.password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: const Color(0xff1A2677)),
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.15,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 53.5, SizeConfig.screenHeight * 150.0),
              child: Container(
            width: 270.0,
            child: TextFormField(
                controller: _emailController,
                onChanged: (String value) async {
                  this.email = value;
                },
                obscureText: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: const Color(0xff1A2677)),
                  hintText: 'E-mail',
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: const Color(0xff1A2677),
                  letterSpacing: 0.15,
                  height: 1,
                ),
                textAlign: TextAlign.left,
              ),)),
            Transform.translate(
        offset: Offset(SizeConfig.screenWidth / 2, SizeConfig.screenHeight * 300.0),
        child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  if (_formKey.currentState.validate()) {
                    _register().then((value) {
                      if ((this.email == "") || (this.password == "")) {
                        showAlertDialog0(context);
                      } else if (value == "Email") {
                        showAlertDialog1(context);
                      } else if (value == "Password") {
                        showAlertDialog2(context);
                      } else if (value == "Email format") {
                        showAlertDialog3(context);
                      } else if (value == "Other error"){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyLogin(auth: auth)
                        ));
                      }
                    });
                    }
                  },
                child: SizedBox(
                width: 149.0,
                height: 57.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromSize(
                      bounds: Rect.fromLTWH(0.0, 0.0, 149.0, 57.0),
                      size: Size(149.0, 57.0),
                      pinLeft: true,
                      pinRight: true,
                      pinTop: true,
                      pinBottom: true,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: const Color(0xff1A2677),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff1A2677)),
                          ),
                          child: SizedBox(
                            width: 88.0,
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: const Color(0xffffffff),
                                letterSpacing: 1.6909999999999998,
                                height: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),),
            Container(
              alignment: Alignment.center,
              child: Text(_success == null
                  ? ''
                  : (_success
                  ? 'Successfully registered ' + _userEmail
                  : 'Registration failed')),
            ),
            Transform.translate(
              offset: Offset(SizeConfig.screenWidth * 135.0,
                  SizeConfig.screenHeight * 460.0),
              child: SizedBox(
                width: SizeConfig.screenWidth * 144.0,
                child: Text(
                  'ConferenceBook',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: const Color(0xff1A2677),
                    letterSpacing: 0.15,
                    height: SizeConfig.screenHeight * 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


/*
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

  Widget _buildEmail() {
    return Container(
      child: Form(key: _formKey,
          autovalidate: true,
          child: TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: const Color(0xff1A2677))),
                labelText: 'Email Address'),
            validator: validateEmail,
            onSaved: (String value){ //only called when form was saved
              _email = value;
            },
          )
      ),
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

  onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  }// helper method to _buildInterests

  Widget _buildInterests() {
    return TagEditor(
      length: values.length,
      delimeters: [',', ' '],
      hasAddButton: false,
      inputDecoration: const InputDecoration(
        //helperText: 'Add your Interests',
        hintText: 'Add your Interests',
        border: InputBorder.none,
      ),
      onTagChanged: (newValue) {
        setState(() {
          values.add(newValue);
        });
      },
      tagBuilder: (context, index) =>
          _Chip(
            index: index,
            label: values[index],
            onDeleted: onDelete,
          ),
    );
  }

  dbToString(){
    _interests = values[0];
    for(int i = 1; i < values.length; i++) {
      _interests += "," + values[i];
    }
  }// convert array of interests to string so save on DB

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
              SizedBox(height: 20),
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

                  if (accepted) {
                    _profileKey.currentState.save(); //save the form - use latter

                    dbToString();

                    Navigator.push( //upon pressed, takes user to next page
                      context,
                      MaterialPageRoute(builder: (context) => MyLogin()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}