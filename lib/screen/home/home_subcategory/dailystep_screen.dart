import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:vertical_percent_indicator/vertical_percent_indicator.dart';

import '../../../common/constants/colors.dart';
import '../../../common/constants/font_style.dart';
import '../../../common/constants/image.dart';


class DailyStepScreen extends StatefulWidget {
  const DailyStepScreen({super.key});

  @override
  State<DailyStepScreen> createState() => _DailyStepScreenState();
}

class _DailyStepScreenState extends State<DailyStepScreen> {
  @override
  late ConfettiController _controllerTopCenter;
  final size = 200.0;
  final  TWO_PI = 3.14 * 2;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ColorConstants.whiteColor,
          appBar: PreferredSize(preferredSize: Size.fromHeight(45.h),
              child:AppBar(
                backgroundColor: ColorConstants.whiteColor,
                surfaceTintColor: Colors.transparent,
                leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                actions: [
                  InkWell(
                    overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                    onTap: (){
                       ShowDialog();
                      _controllerTopCenter.play();
                    },
                    child: CircleAvatar(
                      radius: 16.r,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(ImageControl.trophy,height: 25,width: 25,color: ColorConstants.themeColor,),

                    ),
                  ),
                  SizedBox(width: 20.w,)
                ],

              ) ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(TextSpan(text: "You have walked \n",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),
                    children: [
                      TextSpan(text: "7,235 steps ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.themeColor)),
                    const TextSpan(text: "today"),
                    ]

                )),
                SizedBox(height: 30.h,),
                TweenAnimationBuilder(
                  tween: Tween(begin: 0.0,end: 0.72),
                  duration: Duration(seconds: 2),
                  builder: (context,value,child){
                    int percentage = (value*100).ceil();
                    return Container(
                      width: size,
                      height: size,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect){
                              return SweepGradient(
                                  startAngle: 0.0,
                                  endAngle: TWO_PI,
                                  stops: [value,value],
                                  // 0.0 , 0.5 , 0.5 , 1.0
                                  center: Alignment.center,
                                  colors: [ColorConstants.themeColor,ColorConstants.greyColor]
                              ).createShader(rect);
                            },
                            child: Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: Image.asset("assets/image/radial_scale.png").image)
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: size-40,
                              height: size-40,
                              decoration:const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Center(
                                  child: Column(
                                   mainAxisAlignment :MainAxisAlignment.center,
                                   children: [
                                    Image.asset(ImageControl.shoes,height: 40,width: 40,),
                                    SizedBox(height: 5.h,),
                                    Text("$percentage%",
                                    style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                                    Text("of daily goals",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)

                                  ],
                              )),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h,),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1,300 cal",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                          Text("Cal Burned",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                        ],
                      ),
                      VerticalDivider(color: Colors.grey.shade400,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("10,000",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                          Text("Daily Goal",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15.h,),
                Container(
                  height: 10.h,
                  width: double.maxFinite,
                  color: ColorConstants.skyColor,
                ),
                SizedBox(height: 10.h,),
                Text("Statistic",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 20.sp),),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 170.h,
                  child: Chart(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    layers: [
                      ChartAxisLayer(
                        settings: ChartAxisSettings(
                          x: ChartAxisSettingsAxis(
                            frequency: 1.0,
                            max: 26.w,
                            min: 1.5,
                            textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 10.0,
                            ),
                          ),
                          y: ChartAxisSettingsAxis(
                            frequency: 100.0,
                            max: 300.0,
                            min: 0.0,
                            textStyle: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        labelX: (value) => value.toInt().toString(),
                        labelY: (value) => value.toInt().toString(),
                      ),
                      ChartBarLayer(
                        items: List.generate(
                          28,
                              (index) => ChartBarDataItem(
                            color: ColorConstants.orangeColor,
                            value: Random().nextInt(280) + 20,
                             x: index.toDouble() + 1,
                          ),
                        ),
                        settings: const ChartBarSettings(
                          thickness: 8.0,
                          radius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ]

                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(CupertinoIcons.light_max,size: 18.sp,color: Colors.grey,),
                  Text("6AM",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),),
                  Text("12PM",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),),
                  Text("6PM",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),),

                  Icon(Icons.dark_mode,size: 20.sp,color: Colors.grey,),


                ],
              ),
                SizedBox(height: 15.h,),

                Container(
                  height: 10.h,
                  width: double.maxFinite,
                  color: ColorConstants.skyColor,
                ),
                SizedBox(height: 10.h,),
                Text("Insight",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 20.sp),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 0.4,
                        footer: 'M',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color: const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,
                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 0.6,
                        footer: 'T',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color: const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,
                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 1,
                        footer: 'W',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color:const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,
                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 1,
                        footer: 'T',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color: const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,
                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 0.5,
                        footer: 'F',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color:ColorConstants.themeColor,fontSize: 12.sp,),
                        color: const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,
                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 0.4,
                        footer: 'S',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color:const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,

                        ],
                      ),
                      VerticalBarIndicator(
                        height: 30.h,
                        width: 8.w,
                        percent: 0.8,
                        footer: 'S',
                        animationDuration:const Duration(milliseconds: 300),
                        footerStyle:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),
                        color: const [
                          ColorConstants.themeColor,
                          ColorConstants.themeColor,

                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h,),
                Container(
                  height: 10.h,
                  width: double.maxFinite,
                  color: ColorConstants.skyColor,
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Text("😊",style: TextStyle(fontSize: 25.sp),),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Best Performance",style: AppStyles.blackColor14TextBold,),
                                  Text("Monday",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.365,),
                              Text("10",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 10.h,),
                Divider(color: Colors.grey.shade400,),
                SizedBox(height: 10.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Text("😔",style: TextStyle(fontSize: 25.sp),),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Worst Performance",style: AppStyles.blackColor14TextBold,),
                                  Text("Wednesday",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.34,),

                              Text("6",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h,)
              ],
            ),
          )
        ),

      ],
    );
  }
  ShowDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState){
        return Stack(
          children: [
            AlertDialog(
                 backgroundColor: ColorConstants.themeColor,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                content: Container(
                  height: 400.h,
                  child: Column(
                    children: [
                      SizedBox(height: 15.h,),
                      Text("Goal Achieved!",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.whiteColor),),
                      Text("Share with friend",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.whiteColor),),
                      SizedBox(height: 15.h,),
                      Card(
                        elevation: 10,
                        surfaceTintColor: ColorConstants.whiteColor,
                        color: ColorConstants.whiteColor,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage: AssetImage(ImageControl.profile),
                                ),
                                Text("Anix",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 20.sp),),
                                Image.asset(ImageControl.appIcon,height: 50,width: 50,),
                              ],
                            ),
                            Divider(color: Colors.grey.shade400,),
                            SizedBox(height: 10.h,),
                            TweenAnimationBuilder(
                              tween: Tween(begin: 0.0,end: 1.0),
                              duration: Duration(seconds: 2),
                              builder: (context,value,child){
                                int percentage = (value*100).ceil();
                                return Container(
                                  width: size,
                                  height: size,
                                  child: Stack(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (rect){
                                          return SweepGradient(
                                              startAngle: 0.0,
                                              endAngle: TWO_PI,
                                              stops: [value,value],
                                              // 0.0 , 0.5 , 0.5 , 1.0
                                              center: Alignment.center,
                                              colors: [ColorConstants.themeColor,ColorConstants.greyColor]
                                          ).createShader(rect);
                                        },
                                        child: Container(
                                          width: size,
                                          height: size,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(image: Image.asset("assets/image/radial_scale.png").image)
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: size-40,
                                          height: size-40,
                                          decoration:const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(
                                              child: Column(
                                                mainAxisAlignment :MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(ImageControl.shoes,height: 40,width: 40,),
                                                  SizedBox(height: 5.h,),
                                                  Text("$percentage%",
                                                    style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                                                  Text("of daily goals",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)

                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h,),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("1,300 cal",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                                      Text("Cal Burned",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                    ],
                                  ),
                                  VerticalDivider(color: Colors.grey.shade400,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("10,000",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 16.sp),),
                                      Text("Daily Goal",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h,),

                          ],
                        ),
                      )
                    ],
                  ),
                )

            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerTopCenter,
                blastDirection: pi/2,
                maxBlastForce: 5, // set a lower max blast force
                minBlastForce: 2,

                blastDirectionality: BlastDirectionality
                    .explosive,
                // createParticlePath: drawStar
              ),
            )
          ],
        );
      });
    },
    );
  }
}
