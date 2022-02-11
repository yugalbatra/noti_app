import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesCard extends StatelessWidget {
  String heading, subheading, date;
  ActivitiesCard(
      {required this.heading, required this.subheading, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      height: 70,
      decoration: const BoxDecoration(
          color: Color(0xffFFE7E7),
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
                    Icons.event_note_rounded,
                    size: 30,
                    color: Color(0xffFF9393),
                  ),
                  decoration: const BoxDecoration(
                      color: Color(0xffFFD5D5),
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
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    subheading,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
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
    );
  }
}
