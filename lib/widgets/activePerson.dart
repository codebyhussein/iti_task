import 'package:flutter/material.dart';

class ActivePersonItem extends StatelessWidget {
  const ActivePersonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('assets/hussein1.jpg'),
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.green,
          ),
        ]),
        SizedBox(
          width: 60,
          child: Text(
            'Hussein Salah',
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
