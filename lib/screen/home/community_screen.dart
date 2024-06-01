import 'package:fit_clock/common/common_widget/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../../common/constants/image.dart';
import 'bottom_bar.dart';

class CommunityScreen extends StatelessWidget {
   CommunityScreen({super.key});

  @override
  List<String>name=["You","Amanda Shiva","Krishna"];
  List<String>km=["55.6 km","52.4 km","49.8 km"];
   var scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorConstants.skyColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(45.h),
          child: AppBar(
            backgroundColor:  ColorConstants.skyColor,
            surfaceTintColor: Colors.transparent,
            leading: InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Icon(CupertinoIcons.text_alignleft)),

          )
      ),
      drawer: Drawer(
        backgroundColor: ColorConstants.skyColor,
        child: Padding(
          padding:  EdgeInsets.only(left: 20.w),
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImageControl.Sp_Img),

              ),
              SizedBox(height: 50.h,),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 0,));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.home,),
                    SizedBox(width: 20.w,),
                    Text("Home",style: AppStyles.blackColor14TextBold)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),

              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 1,));
                },
                child: Row(
                  children: [
                    Icon(Icons.keyboard_voice),
                    SizedBox(width: 20.w,),
                    Text("Podcast",style: AppStyles.blackColor14TextBold,)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(CupertinoIcons.list_bullet,color: ColorConstants.themeColor,),
                  SizedBox(width: 20.w,),
                  Text("Community",style: AppStyles.blackColor14TextBold.copyWith(color: ColorConstants.themeColor),)
                ],
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              InkWell(
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.offAll(const BottomBar(index: 4,));
                },
                child: Row(
                  children: [
                    Icon(CupertinoIcons.person_fill),
                    SizedBox(width: 20.w,),
                    Text("Profile",style: AppStyles.blackColor14TextBold,)
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Divider(color: Colors.grey.shade400,),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 20.w,),
                  Text("Log Out",style: AppStyles.blackColor14TextBold,)
                ],
              ),

            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics:const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Community",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp),),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 50.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                       return Padding(
                         padding: EdgeInsets.only(right: 8.w),
                         child: Container(
                           padding:const EdgeInsets.all(1),
                           decoration: BoxDecoration(
                             border: Border.all(color:(index%2==0)? ColorConstants.themeColor:ColorConstants.skyColor,width:2),
                             shape: BoxShape.circle
                           ),
                              child: CircleAvatar(
                                radius: 25.r,
                                backgroundImage:(index%2==0)? const AssetImage(ImageControl.profile): const AssetImage(ImageControl.poster),
                              ),
                            ),
                       );
                        }),
                  )

                ],
              ),
            ),
            SizedBox(height: 20.h,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                padding: EdgeInsets.zero,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  if(index==1)
                    {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10.h),
                        color: ColorConstants.whiteColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 160.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image:const  DecorationImage(
                                      image: AssetImage(ImageControl.topRunning),
                                      fit: BoxFit.fill
                                  )
                              ),

                            ),
                            SizedBox(height: 10.h,),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                padding: EdgeInsets.zero,
                                physics:const NeverScrollableScrollPhysics(),
                                itemBuilder: (context,value){
                                  return Padding(
                                    padding:  EdgeInsets.symmetric(vertical: 1.h,horizontal: 10.w),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage:(value%2==0)? const AssetImage(ImageControl.profile): const AssetImage(ImageControl.poster),
                                            ),
                                            SizedBox(width: 10.h,),
                                            Text(name[value],style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                            const  Spacer(),
                                            Text(km[value],style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        Divider(color:(value==2)? ColorConstants.whiteColor:Colors.grey.shade300,)
                                      ],
                                    ),
                                  );
                                }),

                            Row(
                              children:[
                                SizedBox(width: 1.w,),
                                const Icon(CupertinoIcons.heart),
                                SizedBox(width: 20.w,),
                                InkWell(
                                  overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                                    onTap: showBottom,
                                    child: const Icon(CupertinoIcons.chat_bubble)),
                                SizedBox(width: 20.w,),
                                InkWell(
                                    overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                                    onTap: (){
                                      Share.share("Fit Clock is Coming soon");
                                    },
                                    child: const Icon(CupertinoIcons.paperplane)),
                                const  Spacer(),
                                const Icon(CupertinoIcons.bookmark)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 5.h),
                              child: Text("15,332 likes", style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),),
                            ),


                          ],
                        ),
                      );
                    }
                  else{
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10.h),
                      color: ColorConstants.whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20.r,
                                backgroundImage:(index%3==0)? const AssetImage(ImageControl.profile): const AssetImage(ImageControl.poster),
                              ),
                              SizedBox(width: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Anil",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                  Text("15 mins ago",style: AppStyles.greyColor10Text.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              const  Spacer(),
                              const Icon(CupertinoIcons.ellipsis_vertical)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Text.rich(TextSpan(text: " Living Beyond Fear ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),
                              children: [
                                TextSpan(text: "#life #love #community",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp,color: ColorConstants.themeColor))
                              ]
                          )),
                          SizedBox(height: 10.h,),
                          Container(
                            height: 160.h,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image:const  DecorationImage(
                                    image: AssetImage(ImageControl.podCast),
                                    fit: BoxFit.fill
                                )
                            ),

                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children:[
                              SizedBox(width: 1.w,),
                              const Icon(CupertinoIcons.heart),
                              SizedBox(width: 20.w,),
                              InkWell(
                                  overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                                  onTap: showBottom,
                                  child: const Icon(CupertinoIcons.chat_bubble)),
                              SizedBox(width: 20.w,),
                              InkWell(
                                  overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                                  onTap: (){
                                    Share.share("Fit Clock is Coming soon");
                                  },
                                  child: const Icon(CupertinoIcons.paperplane)),
                              const  Spacer(),
                              const Icon(CupertinoIcons.bookmark)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 5.h),
                            child: Text("332 likes", style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),),
                          ),

                        ],
                      ),
                    );
                  }
                }),
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10.h),
                color: ColorConstants.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: const AssetImage(ImageControl.poster),
                        ),
                        SizedBox(width: 10.h,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Anil",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                            Text("2 month ago",style: AppStyles.greyColor10Text.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        const  Spacer(),
                        const Icon(CupertinoIcons.ellipsis_vertical)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text.rich(TextSpan(text: " Do Bananas Cause Weight Gain and Help With Weight Loss ? ",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),
                        children: [
                          TextSpan(text: "#workout #gym #tranding",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp,color: ColorConstants.themeColor))
                        ]
                    )),
                    SizedBox(height: 10.h,),
                    Row(
                      children:[
                        SizedBox(width: 1.w,),
                        const Icon(CupertinoIcons.heart),
                        SizedBox(width: 20.w,),
                        InkWell(
                            overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                            onTap: showBottom,
                            child: const Icon(CupertinoIcons.chat_bubble)),
                        SizedBox(width: 20.w,),
                        InkWell(
                            overlayColor:const MaterialStatePropertyAll(Colors.transparent),
                            onTap: (){
                              Share.share("Fit Clock is Coming soon");
                            },
                            child: const Icon(CupertinoIcons.paperplane)),
                        const  Spacer(),
                        const Icon(CupertinoIcons.bookmark)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 5.h),
                      child: Text("1,002 likes", style: AppStyles.blackDarkColor20text.copyWith(fontSize: 12.sp),),
                    ),

                  ],
                ),
              ),
            SizedBox(height: 80.h,),
              ],
        ),
      ),
    );
  }
  showBottom(){
    Get.bottomSheet(
      SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Comment",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 22.sp),),
              SizedBox(height: 15.h,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const AssetImage(ImageControl.profile),
                  ),
                  SizedBox(width: 10.h,),
                  Text("Congrats, Keep up the good work!",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 15.sp),),
                  // Spacer(),

                ],
              ),
             const Spacer(),
              Divider(color: Colors.grey.shade300,),
              SizedBox(height: 5.h,),
              Row(
                children:[
                  SizedBox(width: 1.w,),
                  const Icon(Icons.camera,color: Colors.grey,),
                  SizedBox(width: 20.w,),
                  const Icon(Icons.emoji_emotions,color: Colors.grey,),
                  SizedBox(width: 20.w,),
                  const Icon(CupertinoIcons.chart_bar_alt_fill ,color: Colors.grey,),
                  const Spacer(),
                  CustomButton(onTap: (){

                  },
                    buttonHeight: 25.h,
                    buttonWidth: 70.w,
                    borderRadius:BorderRadius.circular(20.r),
                    text: "Post",
                    style:AppStyles.blackColor14TextBold.copyWith(fontSize: 14.sp,color: ColorConstants.whiteColor) ,
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
