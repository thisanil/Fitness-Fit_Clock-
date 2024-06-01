import 'package:fit_clock/common/constants/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/common_widget/common_button.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';

class PlaylistShareScreen extends StatelessWidget {
   PlaylistShareScreen({super.key});

  @override
  List<String>name=["Mindfullness of Breath","A Meditation Lullaby","The Twilight Zone","A Meditation Lullaby"];
  List<String>_time=["5 mins","10 mins","5 mins","7 mins"];
  List<int>value=[1,2,3,4];
  int cnt=0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Container(
         height:MediaQuery.of(context).size.height,
         width: double.maxFinite,
         decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageControl.musicBG),
              fit: BoxFit.fill
            )
         ),
          child: Column(
           children: [
             SizedBox(height: 28.h,),
             Row(
               mainAxisAlignment:MainAxisAlignment.start,
               children: [
                 IconButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   icon:const Icon(Icons.arrow_back_ios_new,color: ColorConstants.whiteColor,),
                 ),
               ],
             ),
             SizedBox(
              height:MediaQuery.of(context).size.height*0.05 ,
            ),
            Text("Share Your favourite",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp , foreground: Paint()..shader = LinearGradient(
              colors: <Color>[
                Colors.pinkAccent,
                Colors.deepPurpleAccent,
                Colors.pinkAccent,
                Colors.deepPurpleAccent,
                //add more color here.
              ],
            ).createShader(Rect.fromLTWH(20.0, 100.0, 500.0, 70.0))),),
            Text("Playlist!",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp,  foreground: Paint()..shader = LinearGradient(
              colors: <Color>[
                Colors.pinkAccent,
                Colors.deepPurpleAccent,
                Colors.pinkAccent,
                Colors.deepPurpleAccent,

                //add more color here.
              ],
            ).createShader(Rect.fromLTWH(150.0, 100.0, 500.0, 150.0))),),
            SizedBox(height: 10.h,),
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 20.w),
               child: Card(
                 elevation: 10,
                 surfaceTintColor: ColorConstants.whiteColor,
                 child: Padding(
                   padding:EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 5.h),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       CircleAvatar(
                         radius: 25.r,
                         backgroundColor: ColorConstants.themeColor,
                         child: Icon(Icons.play_arrow_rounded,color: ColorConstants.whiteColor,size: 30.sp,),
                       ),
                       SizedBox(height: 10.h,),
                       Text("Train Whistle At Night",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 18.sp),),

                       Text("Meditation  . Jospan Fink",style: AppStyles.greyColor10Text.copyWith(fontSize: 13.sp,fontWeight: FontWeight.w500),),
                       SizedBox(height: 10.h,),
                       RatingBar.builder(
                         initialRating: 4.5,
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
                       ),
                       SizedBox(height: 10.h,),
                       ListView.builder(
                           itemCount: 4,
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
                                       Text(value[index].toString(),style: AppStyles.headingText,),
                                       SizedBox(width: index==0?18.w:15.w,),
                                       Text(name[index],style: AppStyles.blackDarkColor20text.copyWith(fontSize: 13.sp),),
                                       Spacer(),
                                       Text(_time[index],style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                     ],
                                   ),
                                   SizedBox(height:index==3?0.h: 5.h,),
                                   Divider(color:index==3?ColorConstants.whiteColor: Colors.grey.shade300,)



                                 ],
                               ),
                             );
                           }),

                     ],
                   ),
                 ),
               ),
             ),
             SizedBox(height: 10.h,),
             Text("Use our hashtag #momotro on instagram ",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
             Text("and write",style: AppStyles.greyColor10Text.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
             const Spacer(),
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 10.w),
               child: CustomButton(
                 onTap: () {
                   Share.share("Fit Clock is Coming soon");
                 },
                 text: "Share Now",
               ),
             ),
             SizedBox(height: 20.h,),
          ],
        ),

        )
        ],
      ),
    );
  }
}
