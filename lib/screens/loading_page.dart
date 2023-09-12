import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_generator/custom%20widgets/background_image.dart';
import 'package:gpa_generator/screens/show_result.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.gpa});
  final double? gpa;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowResult(
              gpa: widget.gpa,
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: const Text("GPA Generator"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
            child: BackGroundImage(
                size: size,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      radius: 25,
                      color: Colors.black,
                    ),
                    Text("Generating..",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ))));
  }
}
