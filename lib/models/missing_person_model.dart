import 'package:flutter/material.dart';

class MissingPerson {
  MissingPerson({
    this.personId,
    this.personName,
    this.personBirthday,
    this.personBirthplace,
    this.personPlace,
    this.personDetails,
    this.personUserId,
    this.personImage,
  });

  int personId;
  String personName;
  String personBirthday;
  String personBirthplace;
  String personPlace;
  String personDetails;
  int personUserId;
  String personImage;

  factory MissingPerson.fromJson(Map<String, dynamic> json) => MissingPerson(
        personId: json["id"],
        personName: json["name"],
        personBirthday: json["birthday"],
        personBirthplace: json["birthplace"],
        personPlace: json["place_of_disappearance"],
        personDetails: json["disappearance_details"],
        personUserId: json["user_id"],
        personImage: json["person_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": personId,
        "name": personName,
        "birthday": personBirthday,
        "birthplace": personBirthplace,
        "place_of_disappearance": personPlace,
        "disappearance_details": personDetails,
        "user_id": personUserId,
        "personImage": personImage,
      };
}
// class MissingPerson {
//   final String id;
//   final String name;
//   final String birthday;
//   final String birthplace;
//   final String place;
//   final String details;
//   final String avatarUrl;

//   const MissingPerson({
//     this.id,
//     @required this.name,
//     @required this.birthday,
//     @required this.birthplace,
//     @required this.details,
//     @required this.place,
//     @required this.avatarUrl,
//   });
// }