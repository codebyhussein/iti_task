import 'package:flutter/material.dart';

class MessageItems extends StatelessWidget {
  const MessageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hussein Salah'),
            SizedBox(
              height: 5,
            ),
            Text('Write Now...'),
          ],
        ),
        SizedBox(
          width: 100,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                width: 10,
              ),
              Text('09:45 PM')
            ],
          ),
        )
      ],
    );
  }
}
