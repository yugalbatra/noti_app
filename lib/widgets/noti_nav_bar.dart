import 'package:flutter/material.dart';

class NotiNavBar extends StatelessWidget {
  const NotiNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.dashboard,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.assignment_rounded,
              color: Colors.grey,
              size: 40,
            ),
            Icon(
              Icons.event_rounded,
              color: Colors.grey,
              size: 40,
            ),
            Icon(
              Icons.person,
              color: Colors.grey,
              size: 40,
            ),
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(50))),
      ),
    );
  }
}
