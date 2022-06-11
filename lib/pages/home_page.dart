import 'package:face_recog_app/pages/missing_person_list.dart';
import 'package:face_recog_app/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import 'missing_person_add.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            top: 0,
            child: Image.asset('assets/images/img_logo.png'),
          )
        ],
      )),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 70, 160, 235),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  IconButton(
                    //Thinking on using another icon for missing person
                    icon: const Icon(Icons.person_search_outlined),
                    iconSize: 26,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MissingPersonList();
                          },
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.PERSON_FORM);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.face),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Perfil();
                          },
                        ),
                      );
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
