// ignore_for_file: unnecessary_new, await_only_futures

import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:face_recog_app/pages/missing_person_add.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

Future userLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse('${Utils.baseUrl}/login-app'),
    headers: {
      "Content-type": "application/json",
      "charset": "UTF-8",
    },
    body: jsonEncode({
      "email": email,
      "password": password,
    }),
  );

  var decodedData = jsonDecode(response.body);
  return decodedData;
}

Future userRegister(String username, String email, String password) async {
  final response =
      await http.post(Uri.parse('${Utils.baseUrl}/sign-up-app'), headers: {
    "Accept": "Application/json"
  }, body: {
    'name': username,
    'email': email,
    'password': password,
  });

  var decodedData = jsonDecode(response.body);
  return decodedData;
}

// Future personRegister(
//     String personName,
//     String personBirthday,
//     String personBirthplace,
//     String personPlace,
//     String personDetails,
//     String personImage) async {
// final response =
//     await http.post(Uri.parse('${Utils.baseUrl}/user'), headers: {
//   "Accept": "Application/json"
// }, body: {
//   'name': personName,
//   'birthday': personBirthday,
//   'birthplace': personBirthplace,
//   'place_of_disappearance': personPlace,
//   'disappearance_details': personDetails,
//   'person_image': personImage
// });

// var decodedData = jsonDecode(response.body);
// return decodedData;
Future<http.StreamedResponse> personRegister(
  String personName,
  String personBirthday,
  String personBirthplace,
  String personPlace,
  String personDetails,
  XFile personImage,
) async {
  var uri = Uri.parse('${Utils.baseUrl}/add-missing-person-app');
  var request = http.MultipartRequest(
    'POST',
    uri,
  )
    ..fields['name'] = personName
    ..fields['birthday'] = personBirthday
    ..fields['birthplace'] = personBirthplace
    ..fields['place_of_disappearance'] = personPlace
    ..fields['disappearance_details'] = personDetails
    ..files.add(new http.MultipartFile.fromBytes(
        'pic', File(personImage.path).readAsBytesSync(),
        filename: "foto_wesley.jpeg", contentType: MediaType('image', 'jpeg')));
  request.headers.addAll({
    "Content-type": "multipart/form-data",
    "charset": "UTF-8",
  });
  var response = request.send();
  return response;
}

// Future<http.StreamedResponse> patchImage(String url, String filepath) async {
//   url = formater(url);
//   var request = http.MultipartRequest('PATCH', Uri.parse(url));
//   request.files.add(await http.MultipartFile.fromPath("img", filepath));
//   request.headers.addAll({
//     "Content-type": "application/json",
//     "charset": "UTF-8",
//   });
//   var response = request.send();
//   return response;
// }

// String formater(String url) {
//   String baseUrl = "http://10.0.2.2:5000";
//   return baseUrl + url;
// }
