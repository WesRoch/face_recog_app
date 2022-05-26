// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:face_recog_app/missing_list/missing_person_model.dart';

class MissingPersonDetalhes extends StatefulWidget {
  MissingPerson pessoa;

  MissingPersonDetalhes({Key? key, required this.pessoa}) : super(key: key);

  @override
  _MissingPersonDetalhesState createState() => _MissingPersonDetalhesState();
}

class _MissingPersonDetalhesState extends State<MissingPersonDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pessoa.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //Missing person photo
                children: [
                  SizedBox(
                    child: Icon(Icons.person),
                    width: 50,
                  ),
                  Container(width: 10),
                  Text(
                    widget.pessoa.name,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -1,
                        color: Colors.grey[800]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
