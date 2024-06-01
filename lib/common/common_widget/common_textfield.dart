import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/font_style.dart';



class CustomTextField extends StatelessWidget {
  double? height;
  TextInputType keyboardType;
  String? hintText;
  String? labelText;
  String? headingText;
  Color? fillColor;
  Color? colors;
  Color? color;
  bool? enable;
  Widget? prefix;
  Widget? suffix;
  Widget? prefixIcon;
  int? maxLines;
  int? maxLength;
  bool? obscureText;
  InputBorder? inputBorder;
  EdgeInsetsGeometry? contentPadding;
  void Function()? onTap;
  TextCapitalization?  textCapitalization;
  List<TextInputFormatter>?  inputFormatters;
  String? Function(String?)? validator;
  String? Function(String?)? onSubmit;
  TextEditingController ? controller = TextEditingController();
  void Function(String)? onSaved;
  void Function(String)? onChanged;
  CustomTextField({super.key,
    this.contentPadding,
    this.obscureText,
    this.textCapitalization,
    this.validator,
    this.prefix,
    this.suffix,
    this.enable ,
    this.onTap,
    this.inputFormatters,
    this.fillColor,
    this.inputBorder,
    this.controller,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.onSubmit,
    this.prefixIcon,
    this.colors,
    this.color,
    this.onSaved,
    this.headingText,
    this.onChanged,
    this.keyboardType= TextInputType.multiline, this.maxLength,this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: height,
        // ),
        headingText!=null?Padding(
          padding:  EdgeInsets.only(left: 3.w,bottom: 3.h,top: 10.h),
          child: Text( headingText??"",style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: ColorConstants.headingTextColor,
          )),
        ):SizedBox(),
        SizedBox(
          height:height ,
          child: TextFormField(
            // textInputAction: TextInputAction.done,
            inputFormatters: inputFormatters,
            maxLength: maxLength??100,
            onSaved: onSubmit??(val){},
            cursorColor: ColorConstants.themeColor,
            cursorWidth: 1,
            validator: validator??(val){},
            onChanged: onChanged,
            obscureText: obscureText??false,
            maxLines: maxLines,
            enabled: enable,
            keyboardType: keyboardType,
            controller: controller,
            textCapitalization: textCapitalization??TextCapitalization.sentences,
            //  onSaved: onSaved,
            style:  TextStyle(
                color:ColorConstants.blackColor,fontSize: 15.sp
            ),
            decoration: InputDecoration(
              counterText: "",
              // alignLabelWithHint: true,
              prefix: prefix,
              suffixIcon: suffix,
              prefixIcon: prefixIcon,
              fillColor: fillColor,
              filled: true,
              labelText: labelText,
              hintText: hintText,
              labelStyle: AppStyles.greyBlackColor12Text.copyWith(fontSize: 14.sp),
              hintStyle: GoogleFonts.dmSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: colors ?? ColorConstants.greyColor,
              ),
              errorStyle: const TextStyle(
                color: Colors.red,
              ),
              contentPadding: contentPadding?? EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(color:Colors.transparent),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(color: ColorConstants.greenLightColor.withOpacity(0.2)),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(color: ColorConstants.whiteColor.withOpacity(0.2)),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide:  BorderSide(color: ColorConstants.whiteColor.withOpacity(0.2)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}