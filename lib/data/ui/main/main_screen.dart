import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:n8_default_project/data/model/weather_main_model.dart';
import 'package:n8_default_project/data/ui/main/widgets/describtion.dart';
import 'package:n8_default_project/data/ui/widgets/weather_search.dart';

import '../../model/unoversal_data.dart';
import '../../network/api_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key,})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  DateTime dt = DateTime.now();
  String searchText = "";

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
          onPressed: () async {
            searchText = await showSearch(
              context: context,
              delegate: WeatherSearchView(suggestionList: [
                "Tashkent",
                "Andijan",
                "Olmazor",
                "London",
                "Asaka",
                "Chust",
                "Fergana",
                "Samarkand",
                "Bukhara",
                "Moscow",]),
              query: searchText,
            );
          },
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
      body: searchText.isEmpty?FutureBuilder<UniversalData>(
        future:  ApiProvider.getMainWeatherDataByLatLong(lat: 46.6,long: 67.5),
        builder: (BuildContext context,AsyncSnapshot<UniversalData>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            if(snapshot.data!.error.isEmpty){
              WeatherMainModel weatherMainModel = snapshot.data!.data as WeatherMainModel;
              return Column(
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
                          "${weatherMainModel.name},\n${weatherMainModel.sysModel.country}",
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
                          "${DateFormat.MMMEd().format(dt)}",
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
                        Image.network(
                          "https://openweathermap.org/img/wn/${weatherMainModel.weatherModel[0].icon}@2x.png",
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
                                      "${(weatherMainModel.mainModel.temp - 274).toInt()}",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF303345)),
                                    ),
                                    Text(
                                      "${weatherMainModel.weatherModel[0].main}",
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
                  SizedBox(
                    height: 17.h,
                  ),
                  Describe(
                      icon: "assets/svg/rain_fall.svg",
                      name: "Clouds",
                      size: "${weatherMainModel.cloudsModel.all}km/h"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Describe(
                      icon: "assets/svg/wind.svg",
                      name: "Wind",
                      size: "${weatherMainModel.windModel.speed}km/h"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Describe(
                      icon: "assets/svg/humidity.svg",
                      name: "Humidity",
                      size: "${weatherMainModel.mainModel.humidity}%"),

                ],
              );
            }
          }
          return Center(child: Text(snapshot.error.toString()),);
        },
      ):FutureBuilder<UniversalData> (
        future:  ApiProvider.getMainWeatherDataByQuery(query: searchText),
        builder: (BuildContext context,AsyncSnapshot<UniversalData>snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            if(snapshot.data!.error.isEmpty){
              WeatherMainModel weatherMainModel = snapshot.data!.data as WeatherMainModel;
              return Column(
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
                          "${weatherMainModel.name},\n${weatherMainModel.sysModel.country}",
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
                          DateFormat.MMMEd().format(dt),
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
                        Image.network(
                          "https://openweathermap.org/img/wn/${weatherMainModel.weatherModel[0].icon}@2x.png",
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
                                      "${(weatherMainModel.mainModel.temp - 274).toInt()}",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF303345)),
                                    ),
                                    Text(
                                      "${weatherMainModel.weatherModel[0].main}",
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
                  SizedBox(
                    height: 17.h,
                  ),
                  Describe(
                      icon: "assets/svg/rain_fall.svg",
                      name: "Clouds",
                      size: "${weatherMainModel.cloudsModel.all}km/h"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Describe(
                      icon: "assets/svg/wind.svg",
                      name: "Wind",
                      size: "${weatherMainModel.windModel.speed}km/h"),
                  SizedBox(
                    height: 5.h,
                  ),
                  Describe(
                      icon: "assets/svg/humidity.svg",
                      name: "Humidity",
                      size: "${weatherMainModel.mainModel.humidity}%"),

                ],
              );
            }
          }
          return Center(child: Text(snapshot.error.toString()),);
        },
      ),
    );
  }
}

