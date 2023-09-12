import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  BackGroundImage({super.key, required this.size, required this.child});

  final Size size;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          image: const DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage('lib/Assets/Images/graduation2.jpg'),
              opacity: 0.5,
              fit: BoxFit.cover),
        ),
        child: child);
  }
}
