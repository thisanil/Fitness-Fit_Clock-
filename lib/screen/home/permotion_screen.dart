import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/font_style.dart';
import '../../common/constants/image.dart';

class PermotionScreen extends StatelessWidget {
   PermotionScreen({super.key});

  @override
  List<String>image=[ImageControl.topRunning,ImageControl.poster,ImageControl.podCast,ImageControl.topRunning,ImageControl.poster,ImageControl.podCast];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.skyColor,

      appBar: PreferredSize(preferredSize: Size.fromHeight(45.h),
          child: AppBar(
            backgroundColor:  ColorConstants.skyColor,
            surfaceTintColor: Colors.transparent,
            title: Text("Promotion",style: AppStyles.blackDarkColor20text.copyWith(fontSize: 25.sp)) ,


          )
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: image.length,
                padding: EdgeInsets.zero,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
               return Padding(
                 padding: EdgeInsets.only(bottom: 10.h),
                 child: Column(
                   children: [
                     Container(
                       height: 160.h,
                       width: double.maxFinite,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.r),
                           image: DecorationImage(
                               image: AssetImage(image[index]),
                               fit: BoxFit.fill
                           )
                       ),

                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Icon(Icons.info_outlined,size: 10.sp,color: ColorConstants.greyColor,),
                         SizedBox(width: 2.w,),
                         Text("Sponsored",style: AppStyles.greyColor10Text)
                       ],
                     )
                   ],
                 ),
               );
            }),
              SizedBox(height: 80.h,),
            ],
          ),
        ),
      ),
    );
  }
}
