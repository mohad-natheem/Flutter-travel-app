import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images ={
    "hot_air_balloon.jpg":"Balloning",
    "hiking.jpg":"Hiking",
    "kayaking.jpg":"Kayaking",
    "snorkling.jpg":"Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder:(context,state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,top: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu,size: 30,color: Colors.black54,),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 30,),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TabBar(
                labelPadding: EdgeInsets.only(left:20,right: 20),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: _CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ]
                ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height:300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children:[
                ListView.builder(
                  itemCount: info.length, 
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return  GestureDetector(
                    onTap: (){
                      BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                    },
                    child: Container(
                      margin:EdgeInsets.only(right: 15,top: 10),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(image: NetworkImage(
                          "http://mark.bslmeiyu.com/uploads/"+info[index].img
                        ),
                        fit: BoxFit.cover
                        )
                      ),
                    ),
                  );
                },
                  
                ),
                Text("there"),
                Text("Bye")
              ] 
              ),
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(text: "Explore more",size: 22,),
                AppText(text: "See all",color: AppColors.textColor1,)
              ]
              ),
          ),
          SizedBox(height: 30,),
          Container(
            height: 120,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_,index){
                return Container(
                  margin: EdgeInsets.only(right: 40),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image:  DecorationImage(image: AssetImage('img/'+images.keys.elementAt(index)),
                          fit: BoxFit.cover,
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: AppText(text: images.values.elementAt(index),color:AppColors.textColor2)),
                    ],
                
                  ),
                );


            }),
          )
        ],
      );
      }else{
        return Container();
      }
        } ,
        )
    );
  }
}
class _CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  _CircleTabIndicator({required this.color,required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }

}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
  Paint _paint = Paint();
  _paint.color=color;
  _paint.isAntiAlias=true;
  final Offset _CircleOffset = Offset(configuration.size!.width/2-radius/2 , configuration.size!.height-radius/2);

    canvas.drawCircle(offset+_CircleOffset, radius, _paint);
  }

}