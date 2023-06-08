import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';
import 'package:travel_app/misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images =["welcome_image1.jpg","welcome_image2.jpg","welcome_image3.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView.builder(
        scrollDirection:Axis.vertical ,
        itemCount: images.length,
        itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'img/'+images[index],
            ),
            fit: BoxFit.cover,
            )
          ),
          child: Container(
            margin: EdgeInsets.only(
              top: 100,
              left: 20,
              right: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: "Trips"),
                    AppText(text: "Mountains",size: 30,),
                    SizedBox(height: 10,),
                    Container(
                      width: 250,
                      child: AppText(text: "Mountain hikes give you an incredible sense of freedom along with endurance tests",color: Colors.grey,size: 16,),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                      child: Container(
                        width: 200,
                        child: Row(children: [ResponsiveButton()])),
                    )
                    
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8)
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}