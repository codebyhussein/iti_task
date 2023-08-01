import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 230, 232),
                  borderRadius: BorderRadius.circular(15)),
              height: 110,
              child: const Center(
                  child: Text(
                'this page is a homeScreen ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
            );
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
          itemCount: 10),
    );
  }
}
