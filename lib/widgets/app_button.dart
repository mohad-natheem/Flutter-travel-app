import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
String? text;
IconData? icon;
double size;
final Color color;
final Color backgroundColor;
final Color borderColor;
bool? isIcon;
AppButton({super.key,
required this.size,
this.text="Hi",
this.icon,
this.isIcon=false ,
required this.color,
required this.backgroundColor,
 required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor,
            width: 1.0
    
          )
    
        ),
        child: isIcon==false?Center(child:AppText(text: text!,color: color,) ):Center(child: Icon(icon)),
    );
  }
}