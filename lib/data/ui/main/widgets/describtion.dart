import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Describe extends StatelessWidget {
  const Describe({Key? key, required this.icon, required this.name, required this.size}) : super(key: key);
  final String icon;
  final String name;
  final String size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 183.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: Color(0xFFDCC1AD),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: 11.w,right: 11.w,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(icon,width: 36.h,height: 36.h,),
              ),
              SizedBox(width: 8.w,),
              Text(name,style: TextStyle(fontSize: 7.sp,fontWeight: FontWeight.w400,color: Color(0xFF303345)),)  ,
              Padding(
                padding:  EdgeInsets.only(left: 69.w),
                child: Text(size,style: TextStyle(fontSize: 7.sp,fontWeight: FontWeight.w400,color: Color(0xFF303345)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
