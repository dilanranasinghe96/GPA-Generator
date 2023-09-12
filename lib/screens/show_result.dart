import 'package:flutter/material.dart';
import 'package:gpa_generator/custom%20widgets/background_image.dart';
import 'package:gpa_generator/custom%20widgets/custom_button.dart';
import 'package:gpa_generator/screens/home_page.dart';

class ShowResult extends StatelessWidget {
  const ShowResult({
    super.key,
    required this.gpa,
  });

  final double? gpa;
  // Future<bool> _onWillPop() async {
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GPA Generator"),
          backgroundColor: Colors.blue,
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
        ),
        body: BackGroundImage(
          size: size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.75,
              ),
              Text(
                "Your GPA is $gpa",
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              CustomButton(
                  size: size,
                  text: "NEW",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
