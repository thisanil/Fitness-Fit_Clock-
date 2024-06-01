import 'package:fit_clock/common/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/common_widget/common_button.dart';
import '../../../common/constants/font_style.dart';
import '../../../common/constants/image.dart';



class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  List<int>_timeZoneSelect=[];
  List<int>_foodSelect=[];
  List<String>_timeZone=[
    "Snack",
    "Lunch",
    "Breakfast",
    "Dinner",

  ];
  List<String>_food=[
    "Pasta",
    "Cereal",
    "Milk",
    "Eggs",
    "Apple",
    "Vegetables",

  ];
  Widget build(BuildContext context) {
    return Scaffold(
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
                 overlayColor: MaterialStatePropertyAll(Colors.transparent),
                 onTap: (){
                   _foodSelect.clear();
                   _timeZoneSelect.clear();
                   ShowDialog();
                 },
                 child: CircleAvatar(
                   radius: 16.r,
                  backgroundColor: ColorConstants.themeColor,
                  child: Icon(Icons.add,color: ColorConstants.whiteColor,),
                 
                 ),
               ),
               SizedBox(width: 20.w,)
             ],
           ) ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text.rich(TextSpan(text: "You have consumed \n",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),
               children: [
                  TextSpan(text: "500 cal ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.themeColor)),
                  TextSpan(text: "today"),
               ]

              )),
            ),
             SizedBox(height: 10.h,),
             CircularPercentIndicator(
              radius: 75.h,
              lineWidth: 10.0,
              percent: 0.75,
              animationDuration: 1000,
               center: CircularPercentIndicator(
                 radius: 65.h,
                 lineWidth: 10.0,
                 percent: 0.65,
                 animationDuration: 1100,
                 center:CircularPercentIndicator(
                   radius: 55.h,
                   lineWidth: 10.0,
                   percent: 0.45,
                   animation: true,
                   animationDuration: 1200,
                   center: Text.rich(TextSpan(text: '40 %\n',style: AppStyles.blackColor14TextBold,
                    children: [
                       TextSpan(text: 'of goals',style: AppStyles.blackColor14TextBold.copyWith(fontSize: 10.sp,color: Colors.grey),)
                    ]
                   ),),
                   progressColor: Colors.teal.shade400,
                   circularStrokeCap: CircularStrokeCap.round,
                 ) ,
                 animation: true,
                 progressColor: ColorConstants.themeColor,
                 circularStrokeCap: CircularStrokeCap.round,
               ),
              animation: true,
              progressColor: ColorConstants.orangeColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            SizedBox(height: 10.h,),
            Divider(color: Colors.grey.shade300,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color:ColorConstants.orangeColor,

                    ),
                  ),
                  Text("Carb",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey,),),
                  Text("100g",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey,),),
                  Text("32%",style: AppStyles.blackColor14TextBold,),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color:ColorConstants.themeColor,

                    ),
                  ),
                  Text("Protein",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey,)),
                  Text("90g",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey),),
                  Text("40%",style: AppStyles.blackColor14TextBold,),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade300,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color:Colors.teal.shade400,

                    ),
                  ),
                  Text("Fat",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey,),),
                  Text("100g",style: AppStyles.blackColor14TextBold.copyWith(color: Colors.grey,),),
                  Text("32%",style: AppStyles.blackColor14TextBold,),
                ],
              ),
            ),
          SizedBox(height: 10.h,),
          Container(
            height: 10.h,
            width: double.maxFinite,
            color: ColorConstants.skyColor,
          ),
          SizedBox(height: 10.h,),
          Text("Breakfast",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 20.sp),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
            child: Column(
              children: [
                Row(
                    children: [
                      Image.asset(ImageControl.coffee,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Coffee",style: AppStyles.blackColor14TextBold,),
                                  Text("1 piece 2 oz",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.577,),
                              Text("190",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                SizedBox(height: 10.h,),
                Divider(color: Colors.grey.shade400,),
                SizedBox(height: 10.h,),
                Row(
                    children: [
                      Image.asset(ImageControl.nutrition,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tuna Pizza",style: AppStyles.blackColor14TextBold,),
                                  Text("1 piece 2 oz",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.495,),
                              CircleAvatar(
                                radius: 5.r,
                                backgroundColor: ColorConstants.orangeColor,
                              ),
                              SizedBox(width: 10.w,),
                              Text("190",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(
              height: 10.h,
              width: double.maxFinite,
              color: ColorConstants.skyColor,
            ),
          SizedBox(height: 10.h,),
          Text("Lunch",style: AppStyles.blackColor14TextBold.copyWith(fontSize: 20.sp),),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(ImageControl.burger,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Big Mac Burger",style: AppStyles.blackColor14TextBold,),
                                  Text("1 piece 2 oz",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.4,),
                              CircleAvatar(
                                radius: 5.r,
                                backgroundColor: ColorConstants.orangeColor,
                              ),
                              SizedBox(width: 10.w,),
                              Text("190",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.grey.shade400,),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Image.asset(ImageControl.avocado,height: 20.h,width: 20.h,),
                      SizedBox(width: 15.w,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Avocado Smoothies",style: AppStyles.blackColor14TextBold,),
                                  Text("1 piece 2 oz",style:AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 12.sp),)
                                ],
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                              CircleAvatar(
                                radius: 5.r,
                                backgroundColor: Colors.teal.shade400,
                              ),
                              SizedBox(width: 10.w,),
                              Text("190",style: AppStyles.blackColor14TextBold,)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
  ShowDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState){
          return AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor:Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            content: SizedBox(
              height: 490.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h,),
                  Image.asset(ImageControl.lunch,height: 40.h,width: 40.w,color: ColorConstants.themeColor,),
                  SizedBox(height: 10.h,),
                  Text("Choose food",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,)),
                  Text.rich(TextSpan(text: "Select your meal and foods that you consume today",style: AppStyles.blackColor14Text.copyWith(color: Colors.black54,fontSize: 14.sp))),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    height: 45.h,
                    width: double.maxFinite,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _timeZone.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 0.h),
                            child: InkWell(
                              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                              onTap: (){
                                      if(_timeZoneSelect.contains(index))
                                        {
                                          _timeZoneSelect.remove(index);
                                        }
                                      else{
                                        _timeZoneSelect.add(index);
                                      }
                                      setState(() {

                                      });
                                },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 9.r,
                                    backgroundColor:_timeZoneSelect.contains(index)?ColorConstants.themeColor: Colors.grey.shade200,
                                    child: Icon(Icons.done,size: 13.sp,color: ColorConstants.whiteColor,),
                                  ),
                                  SizedBox(height: 5.h,),
                                  Text(_timeZone[index],style: AppStyles.blackColor14TextBold.copyWith(fontSize: 13.sp))
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                  Divider(color: Colors.grey.shade400,),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 220.h,
                    width: double.maxFinite,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                       scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _food.length,
                        itemBuilder: (context,index){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: InkWell(
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          onTap: (){
                            if(_foodSelect.contains(index))
                            {
                              _foodSelect.remove(index);
                            }
                            else{
                              _foodSelect.add(index);
                            }
                            setState(() {

                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_food[index],style: AppStyles.blackColor14TextBold),
                              CircleAvatar(
                                radius: 9.r,
                                backgroundColor:_foodSelect.contains(index)?ColorConstants.themeColor: Colors.grey.shade200,
                                child: Icon(Icons.done,size: 13.sp,color: ColorConstants.whiteColor,),
                              ),

                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h,),
                  CustomButton(onTap: (){
                    Navigator.pop(context);
                  }, text: "Add",),

                ],
              ),
            )

          );
        });
      },
    );

  }
}
