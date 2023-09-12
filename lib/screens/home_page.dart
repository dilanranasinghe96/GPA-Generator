import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpa_generator/screens/loading_page.dart';

import '../custom widgets/background_image.dart';
import '../custom widgets/custom_button.dart';
import '../custom widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _credits = TextEditingController();
  final TextEditingController _grade = TextEditingController();

  double? grade;
  double sum = 0;
  double? gpa;
  double numOfCredits = 0;
  double? credits;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<bool> _exitApp() async {
    return false;
  }

  List<String> gradePoint = [
    'a+',
    'a',
    'a-',
    'b+',
    'b',
    'b-',
    'c',
    'c+',
    'c-',
    'd',
    'd+',
    'e',
    'A',
    'A+',
    'A-',
    'B',
    'B-',
    'B+',
    'C+',
    'C',
    'C-',
    'D',
    'D+',
    'E'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("GPA Generator"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: BackGroundImage(
            size: size,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 160,
                ),
                CustomTextField(
                  size: size,
                  controller: _grade,
                  label: 'Enter grade of a course',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  size: size,
                  controller: _credits,
                  label: 'Enter number of credits',
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                    size: size,
                    ontap: () {
                      if (_grade.text == 'a+' || _grade.text == 'A+') {
                        grade = 4;
                      } else if (_grade.text == 'a' || _grade.text == 'A') {
                        grade = 4;
                      } else if (_grade.text == 'a-' || _grade.text == 'A-') {
                        grade = 3.7;
                      } else if (_grade.text == 'b+' || _grade.text == 'B+') {
                        grade = 3.3;
                      } else if (_grade.text == 'b' || _grade.text == 'B') {
                        grade = 3;
                      } else if (_grade.text == 'b-' || _grade.text == 'B-') {
                        grade = 2.7;
                      } else if (_grade.text == 'c+' || _grade.text == 'C+') {
                        grade = 2.3;
                      } else if (_grade.text == 'c' || _grade.text == 'C') {
                        grade = 2;
                      } else if (_grade.text == 'c-' || _grade.text == 'C-') {
                        grade = 1.7;
                      } else if (_grade.text == 'd+' || _grade.text == 'D+') {
                        grade = 1.3;
                      } else if (_grade.text == 'd' || _grade.text == 'D') {
                        grade = 1;
                      } else if (_grade.text == 'e' || _grade.text == 'E') {
                        grade = 0;
                      } else {
                        grade = 0;
                        Fluttertoast.showToast(
                            msg: "Enter valid grade in your result",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                      if (int.parse(_credits.text) >= 0 &&
                          int.parse(_credits.text) < 4) {
                        sum = sum + (grade! * int.parse(_credits.text));
                        numOfCredits += int.parse(_credits.text);
                        print(sum);
                        _credits.clear();
                        _grade.clear();
                      } else {
                        credits = 0;
                        Fluttertoast.showToast(
                            msg: "Please enter valid number of credits",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    text: 'ADD',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    size: size,
                    ontap: () {
                      if (sum == 0 || numOfCredits == 0) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Inputs",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        gpa = double.parse(
                            (sum / numOfCredits).toStringAsFixed(3));
                        print(gpa);

                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoadingPage(
                                  gpa: gpa,
                                ),
                              ));
                        });
                      }
                    },
                    text: 'GENERATE',
                  )
                ]),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    size: size,
                    text: "CLEAR",
                    ontap: () {
                      sum = 0;
                      gpa = 0;
                      _credits.clear();
                      _grade.clear();
                    }),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   Future<bool> _onBackButtonPressed(BuildContext context) async {
//     bool exitApp = await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Are you sure?"),
//             actions: <Widget>[
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(false);
//                   },
//                   child: const Text("No")),
//               TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: const Text("Yes"))
//             ],
//           );
//         });
//     return exitApp ?? false;
//   }
}
