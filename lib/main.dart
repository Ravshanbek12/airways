import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:n8_default_project/data/model/unoversal_data.dart';
import 'package:n8_default_project/data/model/weather_main_model.dart';
import 'package:n8_default_project/data/network/api_provider.dart';
import 'package:n8_default_project/data/ui/main/main_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(218,471),
        builder: (context,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          body: MainScreen()

          ),
        );

    });
  }
}
