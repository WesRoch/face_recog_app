// // ignore_for_file: prefer_const_constructors

// import 'package:face_recog_app/data/missing_person_data.dart';
// import 'package:face_recog_app/models/missing_person_model.dart';
// import 'package:face_recog_app/pages/home_page.dart';
// import 'package:face_recog_app/provider/persons.dart';
// import 'package:face_recog_app/widgets/missing_person_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MissingPersonList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final PersonsProvider personsProvider = Provider.of(context);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Missing Person List')),
//       body: ListView.builder(
//         itemCount: personsProvider.count,
//         itemBuilder: (ctx, i) => ListPersons(personsProvider.byIndex(i)),
//       ),
//     );
//   }
// }
