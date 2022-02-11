import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticeCard extends StatelessWidget {
  String notice;
  NoticeCard({Key? key, required this.notice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      height: 70,
      decoration: const BoxDecoration(
          color: Color(0xffffb400),
          borderRadius: BorderRadius.all(Radius.circular(60))),
      child: Row(
        children: [
          const SizedBox(width: 13),
          Container(
            height: 50,
            width: 50,
            child: const Icon(
              Icons.warning,
              size: 30,
              color: Color(0xffffb400),
            ),
            decoration: const BoxDecoration(
                color: Color(0xfff8f3c9),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                notice,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xfff8f3c9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
