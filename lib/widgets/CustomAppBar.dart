import 'package:courses/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.height, required this.title});
  double height;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: KmainColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            )),
          ],
        ));
  }
}
