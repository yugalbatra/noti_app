import 'package:flutter/material.dart';
import 'package:noti_app/pages/splash_page.dart';
import 'package:noti_app/widgets/noti_activities_card.dart';
import 'package:noti_app/widgets/noti_assignment_card.dart';
import 'package:noti_app/widgets/noti_quiz_card.dart';
import 'package:noti_app/widgets/noti_term_card.dart';
import 'package:noti_app/widgets/noti_warning_card.dart';
import '../assets/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 10.0, left: 22.0, right: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${currentUser.name}!',
                      style: GoogleFonts.poppins(
                        textStyle: kHead1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Updates for today',
                      style: GoogleFonts.poppins(
                        textStyle: kHead2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
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
              itemCount: generalSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (generalSnapshot.docs[index]['type'] == "notice") {
                  return NoticeCard(
                      notice: generalSnapshot.docs[index]['notice']);
                } else {
                  return Container();
                }
              }),
          ListView.builder(
              itemCount: generalSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (generalSnapshot.docs[index]['type'] == "general") {
                  return GeneralCard(
                      heading: generalSnapshot.docs[index]['heading'],
                      subheading: generalSnapshot.docs[index]['subheading'],
                      date: generalSnapshot.docs[index]['date']);
                } else {
                  return Container();
                }
              }),
          ListView.builder(
              itemCount: assessmentsSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (int.parse(assessmentsSnapshot.docs[index]['date']
                        .substring(0, 2)) ==
                    date.day.toInt()) {
                  if (assessmentsSnapshot.docs[index]['type'] == "ga") {
                    return AssignmentCard(
                        heading: assessmentsSnapshot.docs[index]['heading'],
                        subheading: assessmentsSnapshot.docs[index]
                            ['subheading'],
                        date: assessmentsSnapshot.docs[index]['date']);
                  } else {
                    return QuizCard(
                        heading: assessmentsSnapshot.docs[index]['heading'],
                        subheading: assessmentsSnapshot.docs[index]
                            ['subheading'],
                        date: assessmentsSnapshot.docs[index]['date']);
                  }
                } else {
                  return Container();
                }
              }),
          ListView.builder(
              itemCount: activitiesSnapshot.docs.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (int.parse(activitiesSnapshot.docs[index]['date']
                        .substring(0, 2)) ==
                    date.day.toInt()) {
                  return ActivitiesCard(
                      heading: activitiesSnapshot.docs[index]['heading'],
                      subheading: activitiesSnapshot.docs[index]['subheading'],
                      date: activitiesSnapshot.docs[index]['date']);
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
