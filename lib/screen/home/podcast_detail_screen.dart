import 'package:fit_clock/common/constants/colors.dart';
import 'package:fit_clock/common/constants/image.dart';
import 'package:fit_clock/screen/home/playlist_share_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/font_style.dart';

class PodcastDetailScreen extends StatefulWidget {
  const PodcastDetailScreen({super.key});

  @override
  State<PodcastDetailScreen> createState() => _PodcastDetailScreenState();
}

class _PodcastDetailScreenState extends State<PodcastDetailScreen> {
  @override
  bool _switchValue = true;
  int cnt=0;

  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight:250.h,
            backgroundColor: ColorConstants.appBarColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back_ios_new,color: ColorConstants.whiteColor,),
            ),
            actions: [
            InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onTap: (){
                  Get.to(PlaylistShareScreen());
                },
                child: const Icon(CupertinoIcons.square_arrow_up,color: ColorConstants.whiteColor,)),
              SizedBox(width: 20.w,)
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                ImageControl.podCast,
                fit: BoxFit.fill,
              ),
            ),


          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sleep With Me Bedtime Stories Podcast",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,color: ColorConstants.blackColor),),
                          SizedBox(height: 10.w,),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16.r,
                                backgroundImage: AssetImage(ImageControl.profile),

                              ),
                              SizedBox(width: 10.w,),
                              Text("by AniX",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),

                            ],
                          ),
                          SizedBox(height: 10.w,),
                          Text("Train your mind for a happier, healthier life by learning the fundamentals of mediation and mindfullness."
                           " Train your mind for a happier, healthier life by learning the fundamentals of mediation and mindfullness.",style: AppStyles.greyColor10Text.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500),

                          ),
                          SizedBox(height: 10.w,),
                          Divider(color: Colors.grey.shade300,),
                          SizedBox(height: 10.w,),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Downloads Meditation",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                  Text("100 MB",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                ],
                              ),
                              const Spacer(),
                              CupertinoSwitch(
                                value: _switchValue,
                                activeColor: Colors.teal,
                                onChanged: (value) {
                                  setState(() {
                                    _switchValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.w,),
                          Divider(color: Colors.grey.shade300,),
                          SizedBox(height: 15.w,),
                          CustomButton(
                            onTap: () {  },
                            text: "Play Now",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: ColorConstants.skyColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4 Sessions",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 18.sp,),),
                          SizedBox(height: 10.h,),
                          ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder:(context,index){
                                cnt=cnt+1;
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(cnt.toString(),style: AppStyles.headingText,),
                                          SizedBox(width: index==0?18.w:15.w,),
                                          Container(
                                            height:60,
                                            width: 60,
                                            decoration: BoxDecoration(

                                                borderRadius: BorderRadius.circular(10.r),
                                                image:const  DecorationImage(
                                                    image: AssetImage(ImageControl.podCast),
                                                    fit: BoxFit.fill
                                                )
                                            ),
                                          ),
                                          SizedBox(width: 15.w,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Living Beyond Fear",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                              Text("15 minutes.Free",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                            ],
                                          ),

                                        ],
                                      ),
                                      SizedBox(height:index==4?0.h :5.h,),
                                      Divider(color:index==4?ColorConstants.whiteColor: Colors.grey.shade300,),

                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: double.maxFinite,
                      color: ColorConstants.skyColor,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                              Text("28 Reviews",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 18.sp,),),

                              RatingBar.builder(
                                initialRating: 3.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.sp,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                                itemBuilder: (context, _) =>const Icon(
                                  Icons.star,
                                  color: ColorConstants.themeColor,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder:(context,index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 16.r,
                                            backgroundImage:(index%3==0)? const AssetImage(ImageControl.profile): const AssetImage(ImageControl.poster),
                                          ),
                                          SizedBox(width: 10.h,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Anil",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 14.sp),),
                                              Text("1 month ago",style: AppStyles.greyColor10Text.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w500),),
                                            ],
                                          ),
                                          const  Spacer(),
                                          CustomButton(
                                            onTap: (){ },
                                            buttonHeight: 20.h,
                                            buttonWidth: 50.w,
                                            borderRadius:BorderRadius.circular(20.r),
                                            text: "3.5",
                                            color:ColorConstants.themeColor.withOpacity(0.4),
                                            style:AppStyles.blackColor14TextBold.copyWith(fontSize: 14.sp,color: ColorConstants.themeColor) ,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5.h,),
                                      Padding(
                                        padding: EdgeInsets.only(left: 44.w),
                                        child: Text("Train your mind for a happier, healthier life by learning the fundamentals of mediation and mindfullness."
                                            " Train your mind for a happier, healthier life by learning the fundamentals of mediation and mindfullness.",style: AppStyles.greyColor10Text.copyWith(fontSize: 10.sp,fontWeight: FontWeight.w500),

                                        ),
                                      ),
                                      SizedBox(height:index==4?0.h :5.h,),
                                      Divider(color:index==4?ColorConstants.whiteColor: Colors.grey.shade300,),

                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
