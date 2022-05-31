import 'package:face_recog_app/pages/missing_person_add.dart';
import 'package:face_recog_app/pages/welcome_screen.dart';
import 'package:face_recog_app/provider/persons.dart';
import 'package:face_recog_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:face_recog_app/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => PersonsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        // ignore: prefer_const_constructors
        routes: {
          AppRoutes.HOME: (_) => WelcomeScreen(),
          AppRoutes.PERSON_FORM: (_) => const MissingPersonAdd()
        },
      ),
    );
  }
}
