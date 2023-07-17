import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:n8_default_project/data/ui/main/widgets/describtion.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        toolbarHeight: 24.h,
        title: IconButton(
          icon: SvgPicture.asset(
            "assets/svg/search.svg",
            width: 24.w,
            height: 24.h,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/svg/action.svg",
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stockholm,\nSweden",
                  style: TextStyle(
                    color: Color(0xFF313341),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Tue, Jun 30",
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF9A938C),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/weather_condition.png",
                  width: 83.w,
                  height: 80.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 65.w,
                  height: 78.h,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 50.w),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          "assets/svg/selsy.svg",
                          width: 15.w,
                          height: 15.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 19.w,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "19",
                              style: TextStyle(
                                  fontSize: 37.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF303345)),
                            ),
                            Text(
                              "Rainy",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF303345)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 17.h,),
          Describe(icon: "assets/svg/rain_fall.svg", name: "RainFall", size: "3cm"),
          SizedBox(height: 5.h,),
          Describe(icon: "assets/svg/wind.svg", name: "Wind", size: "19km/h"),
          SizedBox(height: 5.h,),
          Describe(icon: "assets/svg/humidity.svg", name: "Humidity", size: "64%"),
        ],
      ),
    );
  }
}
