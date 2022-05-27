// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:face_recog_app/pages/home_page.dart';
import 'package:face_recog_app/pages/missing_person.dart';
import 'package:flutter/material.dart';
import 'missing_person_compare.dart';

class MissingPersonAddPage extends StatefulWidget {
  MissingPersonAddPage({Key? key}) : super(key: key);

  @override
  _MissingPersonAddPageState createState() => _MissingPersonAddPageState();
}

class _MissingPersonAddPageState extends State<MissingPersonAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Missing Person')),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 70, 160, 235),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    //Missing Person photo/icon
                    icon: const Icon(Icons.person_search_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MissingPersonPage();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_add),
                    iconSize: 26,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.face),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MissingPersonComparePage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
