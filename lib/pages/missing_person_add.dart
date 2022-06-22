// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:face_recog_app/api/rest_api.dart';
import 'package:face_recog_app/pages/home_page.dart';
import 'package:face_recog_app/provider/persons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/missing_person_model.dart';

class MissingPersonAdd extends StatefulWidget {
  const MissingPersonAdd({Key key}) : super(key: key);

  @override
  _MissingPersonAddState createState() => _MissingPersonAddState();
}

class _MissingPersonAddState extends State<MissingPersonAdd> {
  final _globalKey = GlobalKey<FormState>();

  final TextEditingController personName = TextEditingController();
  final TextEditingController personBirthday = TextEditingController();
  final TextEditingController personBirthplace = TextEditingController();
  final TextEditingController personPlace = TextEditingController();
  final TextEditingController personDetails = TextEditingController();
  final TextEditingController personUserId = TextEditingController();

  final FocusNode _focusBirthday = FocusNode();
  final FocusNode _focusBirthplace = FocusNode();
  final FocusNode _focusDetails = FocusNode();
  final FocusNode _focusPlace = FocusNode();

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          "Choose Photo",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            )
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Missing Person'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.save),
                onPressed: () {
                  personName.text.isNotEmpty &&
                          personBirthday.text.isNotEmpty &&
                          personBirthplace.text.isNotEmpty &&
                          personPlace.text.isNotEmpty &&
                          personDetails.text.isNotEmpty
                      ? doRegisterPerson(
                          personName.text,
                          personBirthday.text,
                          personBirthplace.text,
                          personPlace.text,
                          personDetails.text,
                          personImage as XFile)
                      : Fluttertoast.showToast(
                          msg: "All fields are required",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                })
          ],
        ),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _globalKey,
            child: ListView(
              children: <Widget>[
                Center(
                    child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80,
                      foregroundImage: personImage == null
                          ? AssetImage("assets/images/img_logo.png")
                          : FileImage(File(personImage as String)),
                      backgroundColor: Colors.transparent,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 1,
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 30.0,
                          )),
                    )
                  ],
                )),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: personName,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusBirthday),
                  // onSaved: (value) => _formData['name'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birthday'),
                  controller: personBirthday,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusBirthday,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusBirthplace),
                  // onSaved: (value) => _formData['birthday'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birthplace'),
                  controller: personBirthplace,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusBirthplace,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusPlace),
                  // onSaved: (value) => _formData['birthplace'] = value.trim(),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Place of Disappearance'),
                  controller: personPlace,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusPlace,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusDetails),
                  // onSaved: (value) => _formData['place'] = value.trim(),
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Disappearance Details'),
                  controller: personDetails,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusDetails,
                  // onSaved: (value) => _formData['details'] = value.trim(),
                ),
              ],
            ),
          ),
        ));
  }

  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await personImage.getImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }

  final personImage = ImagePicker();

  Future<File> takePhoto(ImageSource source) async {
    final XFile image = await personImage.pickImage(source: source);

    final File file = File(image.path);
    return file;
  }

  doRegisterPerson(
      String personName,
      String personBirthday,
      String personBirthplace,
      String personPlace,
      String personDetails,
      XFile personImage) async {
    var res = await personRegister(personName, personBirthday, personBirthplace,
        personPlace, personDetails, personImage);
    print(res.toString());

    if (true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Fluttertoast.showToast(msg: 'Try again', textColor: Colors.red);
    }
  }
}
