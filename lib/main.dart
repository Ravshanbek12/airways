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
          appBar: AppBar(
            title: Text("AppBar"),
          ),
          body: FutureBuilder<UniversalData> (
            future:  ApiProvider.getMainWeatherDataByQuery(query: "Andijan"),
            builder: (BuildContext context,AsyncSnapshot<UniversalData>snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasData){
                if(snapshot.data!.error.isEmpty){
                  WeatherMainModel weatherMainModel = snapshot.data!.data as WeatherMainModel;
                  return Center(child: Text("${weatherMainModel.name}"),);
                }
              }
              return Center(child: Text(snapshot.error.toString()),);
            },
          )

          ),
        );

    });
  }
}
