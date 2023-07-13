import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF111015),
            title: SizedBox(
                height: 24,
                child: Text(
                  "Привет, Максим",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white),
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: (SvgPicture.asset("assets/svg/search.svg"))),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset(
                  "assets/images/img.png",
                  width: 36,
                  height: 36,
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xFF111015),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Color(0xFF111015),
                expandedHeight: 50,
                elevation: 1,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SvgPicture.asset("assets/svg/line.svg"),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Ваши любимые товары",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Посмотреть все",
                              style: TextStyle(
                                  color: Color(0xFFEDB216),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 130.0,
                  color: Color(0xFF111015),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          width: 282,
                          child: Card(
                            color: Color(0xFF22222A),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/burger.png",
                                  width: 87,
                                  height: 66,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Чикен Бургер",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SvgPicture.asset(
                                            "assets/svg/like.svg")
                                      ],
                                    ),
                                    Text(
                                      "Котлета куриная, свежие\nовощи, сыр чеддер, \nсоус для бургера",
                                      style: TextStyle(
                                          color: Color(0xFF6A6A6E),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₽160",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        SvgPicture.asset(
                                            "assets/svg/block.svg")
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xFF111015),
                  height: 50.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),

                        decoration: BoxDecoration(
                            color: Color(0xFF22222A),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        // width: 100.0,
                        child: Card(
                          color: Color(0xFF22222A),
                          child: Text(category[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.69,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF22222A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 6,),
                          Image.asset(images[index], width: 129, height: 99,)
                        ],
                      ),
                    );
                  },
                  childCount: 5,
                ),
              )


            ],
          )),
    );
  }
}

List<String> images = [
  "assets/images/burger.png",
  "assets/images/burger2.png",
  "assets/images/burger3.png",
  "assets/images/burger.png",
  "assets/images/hot_dog.png"
];
List<String> category = [
  "Бургеры",
  "Пицца",
  "Фрэнч Доги",
  "Снэки",
  "Напитки"
];
