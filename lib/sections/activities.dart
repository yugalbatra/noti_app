import 'package:flutter/material.dart';
import 'package:noti_app/pages/splash_page.dart';
import 'package:noti_app/widgets/noti_activities_card.dart';
import '../assets/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivitiesSection extends StatelessWidget {
  DateTime date;
  QuerySnapshot activitiesSnapshot;
  ActivitiesSection(
      {Key? key, required this.date, required this.activitiesSnapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Activities',
                  style: GoogleFonts.poppins(
                    textStyle: kHead1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateToday,
                  style: GoogleFonts.poppins(
                    textStyle: kHead3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: activitiesSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ActivitiesCard(
                    heading: activitiesSnapshot.docs[index]['heading'],
                    subheading: activitiesSnapshot.docs[index]['subheading'],
                    date: activitiesSnapshot.docs[index]['date']);
              }),
        ],
      ),
    );
  }
}
