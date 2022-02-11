import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../assets/constants.dart';

class NotiAppBar extends StatelessWidget {
  int notisToday;
  NotiAppBar({Key? key, required this.notisToday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 140,
          height: 55,
          decoration: const BoxDecoration(
              color: kBgRed,
              borderRadius: BorderRadius.all(Radius.circular(60))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                notisToday.toString(),
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 38, color: kBoldRed),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.notifications,
                size: 40,
                color: kBoldRed,
              )
            ],
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'noti',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 53),
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
