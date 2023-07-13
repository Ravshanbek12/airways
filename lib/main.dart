import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414,896),
        builder: (context,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 53.h,
            elevation: 0,
            backgroundColor: Colors.white,
            systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.white),
          ),
          body: Column(
            children: [
              Center(
                  child: Image.asset(
                    "assets/images/pokemon_afisha.png",
                    width: 252.w,
                    height: 88.h,
                  )),
              SizedBox(
                height: 34.h,
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.w),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Buscar Pokémon",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: Color(0xFFE5E5E5),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: Color(0xFFE5E5E5),
                          )),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: Color(0xFFE5E5E5),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: Color(0xFFE5E5E5),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Expanded(
                child: GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.8),
                    children:
                    List.generate(image.length, (index) => SizedBox(
                      height:90 .h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 0,),
                              Container(
                                width:
                                177.w,
                                height:
                                115.h,
                                decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(20.r)),
                              ),
                            ],
                          ),
                          SizedBox(height: 0,),
                          Positioned(
                            child: Image.asset(
                              image[index],
                              width:
                              90.w,
                              height:
                              177.h,
                            ),
                          ),
                        ],
                      ),
                    ),)

                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

List<String> image = ['assets/images/img.png','assets/images/img_1.png','assets/images/img_2.png','assets/images/img_3.png','assets/images/img_4.png','assets/images/img_5.png','assets/images/img_6.png','assets/images/img_7.png',];
