import 'package:face_recog_app/api/rest_api.dart';
import 'package:face_recog_app/pages/home_page.dart';
import 'package:face_recog_app/provider/persons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../models/missing_person_model.dart';

class MissingPersonAdd extends StatefulWidget {
  const MissingPersonAdd({Key key}) : super(key: key);

  @override
  _MissingPersonAddState createState() => _MissingPersonAddState();
}

class _MissingPersonAddState extends State<MissingPersonAdd> {
  final _formPerson = GlobalKey<FormState>();
  final TextEditingController _controllerpersonName = TextEditingController();
  final TextEditingController _controllerpersonBirthday =
      TextEditingController();
  final TextEditingController _controllerpersonBirthplace =
      TextEditingController();
  final TextEditingController _controllerpersonPlace = TextEditingController();
  final TextEditingController _controllerpersonDetails =
      TextEditingController();
  final TextEditingController _controllerpersonUserId = TextEditingController();
  final TextEditingController _controllerpersonImage = TextEditingController();

  // final FocusNode _focusId = FocusNode();
  // final FocusNode _focusName = FocusNode();
  // final FocusNode _focusBirthday = FocusNode();
  // final FocusNode _focusBirthplace = FocusNode();
  // final FocusNode _focusDetails = FocusNode();
  // final FocusNode _focusPlace = FocusNode();
  // final FocusNode _focusAvatarUrl = FocusNode();

  // final Map<String, String> _formData = {};

  // void changeMissingPerson(MissingPerson person) {
  //   if (person != null) {
  //     _formData['id'] = person.id;
  //     _formData['name'] = person.name;
  //     _formData['birthday'] = person.birthday;
  //     _formData['birthplace'] = person.birthplace;
  //     _formData['details'] = person.details;
  //     _formData['place'] = person.place;
  //     _formData['avatarUrl'] = person.avatarUrl;

  //     _controllerName.text = person.name;
  //     _controllerBirthday.text = person.birthday;
  //     _controllerBirthplace.text = person.birthplace;
  //     _controllerDetails.text = person.details;
  //     _controllerPlace.text = person.place;
  //     _controllerAvatarUrl.text = person.avatarUrl;
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final MissingPerson person = ModalRoute.of(context).settings.arguments;

  //   changeMissingPerson(person);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missing Person'),
        actions: <Widget>[
          IconButton(onPressed: () {
            _controllerpersonName.text.isNotEmpty &&
                    _controllerpersonBirthday.text.isNotEmpty &&
                    _controllerpersonBirthplace.text.isNotEmpty &&
                    _controllerpersonPlace.text.isNotEmpty &&
                    _controllerpersonDetails.text.isNotEmpty &&
                    _controllerpersonImage.text.isNotEmpty
                ? doRegisterPerson(
                    _controllerpersonName.text,
                    _controllerpersonBirthday.text,
                    _controllerpersonBirthplace.text,
                    _controllerpersonPlace.text,
                    _controllerpersonDetails.text,
                    _controllerpersonImage.text)
                : Fluttertoast.showToast(
                    msg: "All fields are required",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
          })
        ],
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: _controllerName,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusBirthday),
                  onSaved: (value) => _formData['name'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birthday'),
                  controller: _controllerBirthday,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusBirthday,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusBirthplace),
                  onSaved: (value) => _formData['birthday'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Birthplace'),
                  controller: _controllerBirthplace,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusBirthplace,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusPlace),
                  onSaved: (value) => _formData['birthplace'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Place'),
                  controller: _controllerPlace,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusPlace,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusDetails),
                  onSaved: (value) => _formData['place'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Details'),
                  controller: _controllerDetails,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusDetails,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_focusAvatarUrl),
                  onSaved: (value) => _formData['details'] = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Photo URL'),
                  controller: _controllerAvatarUrl,
                  validator: (value) {
                    if (value == null) {
                      return 'Insert a name';
                    }
                    return null;
                  },
                  focusNode: _focusAvatarUrl,
                  onFieldSubmitted: (_) => addOrChange(),
                  onSaved: (value) => _formData['avatarUrl'] = value.trim(),
                )
              ],
            )),
      ),
    );
  }

  doRegisterPerson(
      String personName,
      String personBirthday,
      String personBirthplace,
      String personPlace,
      String personDetails,
      String personImage) async {
    var res = await personRegister(personName, personBirthday, personBirthplace,
        personPlace, personDetails, personImage);
    print(res.toString());

    if (res['success']) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Fluttertoast.showToast(msg: 'Try again', textColor: Colors.red);
    }
  }
  // void addOrChange() {
  //   final isValid = _form.currentState.validate();

  //   if (isValid) {
  //     _form.currentState.save();
  //     Provider.of<PersonsProvider>(
  //       context,
  //       listen: false,
  //     ).put(MissingPerson(
  //         id: _formData['id'],
  //         name: _formData['name'],
  //         birthday: _formData['birthday'],
  //         birthplace: _formData['birthplace'],
  //         details: _formData['details'],
  //         place: _formData['place'],
  //         avatarUrl: _formData['avatarUrl']));

  //     Navigator.of(context).pop();
  //   }
  // }
}
