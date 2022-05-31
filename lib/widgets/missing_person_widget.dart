import 'package:face_recog_app/models/missing_person_model.dart';
import 'package:flutter/material.dart';

class ListPersons extends StatelessWidget {
  final MissingPerson person;
  const ListPersons(this.person);

  @override
  Widget build(BuildContext context) {
    final avatar = person.avatarUrl = null || person.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(person.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(person.name),
      subtitle: Text(person.birthday),
      trailing: Row(
        children: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
