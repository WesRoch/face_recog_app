import 'package:face_recog_app/models/missing_person_model.dart';
import 'package:face_recog_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

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
                color: Colors.orange),
            IconButton(
                onPressed: (() {}), icon: Icon(Icons.delete), color: Colors.red)
          ],
        ),
      ),
    );
  }
}
