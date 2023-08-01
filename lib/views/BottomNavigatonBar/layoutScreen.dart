import 'package:courses/constants.dart';
import 'package:courses/views/BottomNavigatonBar/screens/archiveScreen.dart';
import 'package:courses/views/BottomNavigatonBar/screens/homeScreen.dart';
import 'package:courses/views/BottomNavigatonBar/screens/tasksScreen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/CustomAppBar.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int currentIndex = 0;
  List<Widget> Screenview = [
    const homeScreen(),
    const tasksScreen(),
    const archiveScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: CustomAppBar(height: 90, title: 'Note App'),
      ),
      body: Screenview[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: KmainColor,
            elevation: 0,
            currentIndex: currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.home,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.document,
                  ),
                  label: 'tasks'),
              BottomNavigationBarItem(
                  icon: Icon(
                    IconlyLight.discovery,
                  ),
                  label: 'archive')
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KmainColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
