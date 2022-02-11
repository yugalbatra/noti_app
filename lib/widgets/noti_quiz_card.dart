import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatelessWidget {
  String heading, subheading, date;
  QuizCard(
      {Key? key,
      required this.heading,
      required this.subheading,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Color(0xfff1f6ef),
            borderRadius: BorderRadius.all(Radius.circular(60))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.assignment,
                      size: 30,
                      color: Color(0xff9fc882),
                    ),
                    decoration: const BoxDecoration(
                        color: Color(0xffdeebd9),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      subheading,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(date,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600))),
            ),
          ],
        ),
      ),
    );
  }
}
