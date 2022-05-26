// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:face_recog_app/menu/home_page.dart';
import 'package:flutter/material.dart';
import 'missing_person_add.dart';
import 'missing_person_compare.dart';
import 'missing_person_controller.dart';
import 'missing_person_detalhes.dart';
import 'missing_person_model.dart';

class MissingPersonPage extends StatefulWidget {
  MissingPersonPage({Key? key}) : super(key: key);

  @override
  _MissingPersonPageState createState() => _MissingPersonPageState();
}

class _MissingPersonPageState extends State<MissingPersonPage> {
  mostrarDetalhes(MissingPerson pessoa) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MissingPersonDetalhes(pessoa: pessoa)));
  }

  @override
  Widget build(BuildContext context) {
    final lista = MissingPersonController().lista;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Missing Person'),
        backgroundColor: const Color.fromARGB(255, 70, 160, 235),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int pessoa) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              lista[pessoa].name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              lista[pessoa].id.toString(),
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.list),
            onTap: () => mostrarDetalhes(lista[pessoa]),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: lista.length,
      ),
      extendBody: true,
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
                    onPressed: () {},
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
