// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:face_recog_app/data/missing_person_data.dart';
import 'package:face_recog_app/models/missing_person_model.dart';
import 'package:flutter/material.dart';

class PersonsProvider with ChangeNotifier {
  final Map<String, MissingPerson> _items = {...dataMissingPerson};

  List<MissingPerson> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  MissingPerson byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(MissingPerson person) {
    if (person == null) {
      return;
    }

    if (person.id != null &&
        person.id.trim().isNotEmpty &&
        _items.containsKey(person.id)) {
      _items.update(
          person.id,
          (_) => MissingPerson(
              id: person.id,
              name: person.name,
              birthday: person.birthday,
              birthplace: person.birthplace,
              details: person.details,
              place: person.place,
              avatarUrl: person.avatarUrl));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => MissingPerson(
              id: id,
              name: person.name,
              birthday: person.birthday,
              birthplace: person.birthplace,
              details: person.details,
              place: person.place,
              avatarUrl: person.avatarUrl));
    }

    notifyListeners();
  }

  void remove(MissingPerson person) {
    if (person != null && person.id != null) {
      _items.remove(person.id);
      notifyListeners();
    }
  }
}
