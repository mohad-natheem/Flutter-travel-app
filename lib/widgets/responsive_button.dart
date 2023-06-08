import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isresponsive;
 ResponsiveButton({super.key,this.width=120,this.isresponsive=false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isresponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: isresponsive==true?MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isresponsive==true?Container(margin: EdgeInsets.only(left: 20), child: AppText(text: "Book Trip Now",color: Colors.white,)):Container(),
            Container(margin:isresponsive==true? EdgeInsets.only(right: 20):EdgeInsets.only(), child: Icon(Icons.keyboard_double_arrow_right,color: Colors.white,size: 30,))
          ],
        ),
      ),
    );
  }
}