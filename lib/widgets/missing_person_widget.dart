// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:face_recog_app/models/missing_person_model.dart';
import 'package:face_recog_app/provider/persons.dart';
import 'package:face_recog_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPersons extends StatelessWidget {
  final MissingPerson person;
  const ListPersons(this.person);

  @override
  Widget build(BuildContext context) {
    final avatar = person.avatarUrl == null || person.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(person.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(person.name),
      subtitle: Text(person.birthday),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PERSON_FORM,
                    arguments: person,
                  );
                },
                icon: Icon(Icons.edit),
                color: Colors.amber),
            IconButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Remove Missing Person'),
                            content: Text(
                                'Would you like to remove missing person?'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Cancel'.toUpperCase())),
                              TextButton(
                                  onPressed: () {
                                    Provider.of<PersonsProvider>(
                                      context,
                                      listen: false,
                                    ).remove(person);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'.toUpperCase()))
                            ],
                          ));
                }),
                icon: Icon(Icons.delete),
                color: Colors.red)
          ],
        ),
      ),
    );
  }
}
