import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppText extends StatelessWidget {
  double size;
  final Color color;
  final String text;
  AppText({super.key,required this.text,this.size=16,this.color=Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}