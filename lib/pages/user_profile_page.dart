// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:face_recog_app/pages/home_page.dart';
import 'package:face_recog_app/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/user_data.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PerfilUser(),
    );
  }
}

class PerfilUser extends StatefulWidget {
  PerfilUser();

  PerfilUserState createState() => PerfilUserState();
}

class PerfilUserState extends State {
  // For CircularProgressIndicator.
  bool visible = false;
  // Getting value from TextField widget.
  var message_global;
  final appData = AppData();

  PerfilUserState();

  @override
  Widget build(BuildContext context) {
    //print(message);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              }),
          elevation: 5,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 70, 160, 235),
          title: const Text(
            "Perfil de usuário",
            style:
                TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: APP_BAR_GRADIENT_COLOR))),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
              child: Container(
            decoration: BoxDecoration(),
            constraints: BoxConstraints.expand(
                height: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/img_logo.png',
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )),
                        ]),
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("imgs/4.png"), fit: BoxFit.cover)),
                    constraints: BoxConstraints.expand(
                      height:
                          Theme.of(context).textTheme.displaySmall.fontSize *
                                  1 +
                              100.0,
                    )),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Text(
                            "Nome: ",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 25),
                          child: Text(
                            "e-mail: ",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ]),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("imgs/4.png"), fit: BoxFit.cover)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => {
                          appData.userId = null,
                          appData.userName = null,
                          appData.userEmail = null,
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen())),
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[800], Colors.blue[800]],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 140.0, minHeight: 40.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Sair",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
