import 'package:flutter/material.dart';

import 'home_page.dart';
import 'missing_person.dart';
import 'missing_person_add.dart';

class MissingPersonComparePage extends StatefulWidget {
  MissingPersonComparePage({Key? key}) : super(key: key);

  @override
  State<MissingPersonComparePage> createState() =>
      _MissingPersonComparePageState();
}

class _MissingPersonComparePageState extends State<MissingPersonComparePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MissingPersonAddPage();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.face),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
