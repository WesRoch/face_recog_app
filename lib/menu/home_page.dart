import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt_outlined),
        backgroundColor: const Color.fromARGB(255, 70, 160, 235),
      ),
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
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
