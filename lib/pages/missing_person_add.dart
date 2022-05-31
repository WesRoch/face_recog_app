// ignore_for_file: prefer_const_constructors

import 'package:face_recog_app/pages/missing_person_list.dart';
import 'package:face_recog_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'missing_person_add.dart';

class MissingPersonAdd extends StatelessWidget {
  const MissingPersonAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missing Person'),
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Birthday'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Birthplace'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Place'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Details'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Photo URL'),
            )
          ],
        )),
      ),
    );
  }
}
