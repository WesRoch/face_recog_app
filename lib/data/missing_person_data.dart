// ignore_for_file: unnecessary_const
class AppDataPerson {
  static final AppDataPerson _appDataPerson = AppDataPerson._internal();

  String personId;
  String personName;
  String personBirthday;
  String personBirthplace;
  String personPlace;
  String personDetails;
  String personUserId;
  String personImage;
  dynamic message;

  factory AppDataPerson() {
    return _appDataPerson;
  }
  AppDataPerson._internal();
}

final appDataPerson = AppDataPerson();

// import 'package:face_recog_app/models/missing_person_model.dart';

// const dataMissingPerson = {
//   '1': const MissingPerson(
//       id: '1',
//       name: 'ronald',
//       birthday: '24/01/1996',
//       birthplace: 'birthplace',
//       details: 'details',
//       place: 'place',
//       avatarUrl:
//           'https://cdn.pixabay.com/photo/2017/06/09/23/22/avatar-2388584_960_720.png'),
//   '2': const MissingPerson(
//       id: '2',
//       name: 'duda',
//       birthday: '24/01/1996',
//       birthplace: 'birthplace',
//       details: 'details',
//       place: 'place',
//       avatarUrl: '')
// };
