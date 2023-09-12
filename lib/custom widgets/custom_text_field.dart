import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.size,
      required this.label,
      required this.controller,
      this.keyBoardType});

  final Size size;
  String label;
  TextInputType? keyBoardType;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.75,
      child: TextField(
        keyboardType: keyBoardType,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
