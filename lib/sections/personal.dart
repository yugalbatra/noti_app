import 'package:flutter/material.dart';
import 'package:noti_app/pages/splash_page.dart';
import '../assets/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:restart_app/restart_app.dart';

late String newName;
late List newSubjects;

class PersonalSection extends StatelessWidget {
  const PersonalSection({Key? key}) : super(key: key);

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
                  'Your Profile',
                  style: GoogleFonts.poppins(
                    textStyle: kHead1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              content: EditPopUp(),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      newSubjects.add('ALL1');
                                      await currentUser.updateUser(
                                          name: newName, subjects: newSubjects);
                                      Restart.restartApp();
                                    },
                                    style: TextButton.styleFrom(
                                        primary: Colors.purple,
                                        backgroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0, vertical: 5),
                                      child: Text(
                                        'Save',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ))
                              ],
                            );
                          });
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.purple,
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                      ),
                    ))
              ],
            ),
          ),
          const ProfileCard(),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22.0),
      height: 400,
      width: 400,
      decoration: const BoxDecoration(
        color: kNotiPurple,
        borderRadius: BorderRadius.all(Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffb8c4f8),
            offset: Offset(5.0, 5.0),
            spreadRadius: 2.0,
          ), //BoxShadow/BoxShadow
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              currentUser.name,
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 28, color: Color(0xffb8c4f8))),
            ),
            const SizedBox(height: 20),
            Text(
              'Term',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              currentUser.term,
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 28, color: Color(0xffb8c4f8))),
            ),
            const SizedBox(height: 20),
            Text(
              'Subjects',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            Text(
              currentUser.subjects
                  .toString()
                  .substring(1, currentUser.subjects.toString().length - 7),
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 28, color: Color(0xffb8c4f8))),
            ),
          ],
        ),
      ),
    );
  }
}

class EditPopUp extends StatelessWidget {
  const EditPopUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (String value) {
                newName = value;
              },
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            const MultiSelector(),
          ],
        ),
      ),
    );
  }
}

class MultiSelector extends StatelessWidget {
  const MultiSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSelect(
        //--------customization selection modal-----------
        buttonBarColor: kNotiPurple,
        cancelButtonText: "Exit",
        checkBoxColor: Colors.black,
        titleText: "Select Subjects",
        selectedOptionsInfoText: "Selected custom text (tap to remove)",
        selectedOptionsBoxColor: Colors.white,
        autovalidateMode: AutovalidateMode.disabled,
        maxLength: 4, // optional
        //--------end customization selection modal------------
        validator: (dynamic value) {
          if (value == null) {
            return 'Please select one or more option(s)';
          }
          return null;
        },
        errorText: 'Please select one or more option(s)',
        dataSource: const [
          {"name": "Python", "code": "PYTH"},
          {"name": "DBMS", "code": "DBMS"},
          {"name": "App Dev 1", "code": "MAD1"},
          {"name": "App Dev 2", "code": "MAD2"},
          {"name": "PDSA", "code": "PDSA"},
          {"name": "Math 1", "code": "MAT1"},
          {"name": "Math 2", "code": "MAT2"},
          {"name": "Stats 1", "code": "STAT1"},
          {"name": "Stats 2", "code": "STAT2"},
          {"name": "English 1", "code": "ENG1"},
          {"name": "English 2", "code": "ENG2"},
          {"name": "Comp. Thinking", "code": "COT1"},
          {"name": "MLT", "code": "MLT1"},
          {"name": "System Commands", "code": "SCOM"},
        ],
        textField: 'name',
        valueField: 'code',
        filterable: true,
        required: true,
        onSaved: (value) {
          newSubjects = value;
          print('The saved values are $value');
        },
        change: (value) {
          print('The selected values are $value');
        });
  }
}
