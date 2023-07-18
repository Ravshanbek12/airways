import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherSearchView extends SearchDelegate {
  WeatherSearchView({required this.suggestionList});

  final List<String> suggestionList;

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close)),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, query);
    },
  );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style:  TextStyle(
          fontSize: 64.sp,
        ),
      ),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
      //["Olmazor","Samarqand","Moscow"]
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          suggestions.length,
              (index) => GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r), color: Colors.white),
              padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Text(
                suggestions[index],
                style:  TextStyle(color:const Color(0xFF313341), fontSize: 20.sp),
              ),
            ),
            onTap: () {
              query = suggestions[index];
              // close(context, query);
            },
          ),
        ),
      ),
    );
  }
}