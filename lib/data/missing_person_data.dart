// ignore_for_file: unnecessary_const
import 'package:image_picker/image_picker.dart';

class AppDataPerson {
  static final AppDataPerson _appDataPerson = AppDataPerson._internal();

  String personId;
  String personName;
  String personBirthday;
  String personBirthplace;
  String personPlace;
  String personDetails;
  String personUserId;
  XFile personImage;
  dynamic message;

  factory AppDataPerson() {
    return _appDataPerson;
  }
  AppDataPerson._internal();
}

final appDataPerson = AppDataPerson();
