import 'package:flutter/material.dart';
import 'package:noti_app/pages/splash_page.dart';
import 'package:noti_app/widgets/noti_assignment_card.dart';
import 'package:noti_app/widgets/noti_quiz_card.dart';
import '../assets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AssessmentsSection extends StatelessWidget {
  const AssessmentsSection({Key? key}) : super(key: key);

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
                  'Assessments',
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
              itemCount: assessmentsSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (assessmentsSnapshot.docs[index]['type'] == "ga") {
                  return AssignmentCard(
                      heading: assessmentsSnapshot.docs[index]['heading'],
                      subheading: assessmentsSnapshot.docs[index]['subheading'],
                      date: assessmentsSnapshot.docs[index]['date']);
                } else {
                  return QuizCard(
                      heading: assessmentsSnapshot.docs[index]['heading'],
                      subheading: assessmentsSnapshot.docs[index]['subheading'],
                      date: assessmentsSnapshot.docs[index]['date']);
                }
              }),
        ],
      ),
    );
  }
}
