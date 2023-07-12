import 'package:airways/data/network/api_provider.dart';
import 'package:airways/data/network/repositories/caregory_repo.dart';
import 'package:airways/data/network/repositories/product_repo.dart';
import 'package:airways/data/network/repositories/user_repo.dart';
import 'package:airways/ui/tab_box/products/products_screen.dart';
import 'package:airways/ui/tab_box/users/users_screen.dart';
import 'package:flutter/material.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key, required this.apiProvider}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();

  final ApiProvider apiProvider;
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screen =[];
  int activePage=0;

  late ProductRepo productRepo;
  late UserRepo userRepo;
  late CategoryRepo categoryRepo;

  @override
  void initState() {
    productRepo = ProductRepo(apiProvider: widget.apiProvider);
    userRepo = UserRepo(apiProvider: widget.apiProvider);
    categoryRepo = CategoryRepo(apiProvider: widget.apiProvider);
    screen.add(ProductsScreen(
      productRepo: productRepo,
      categoryRepo: categoryRepo,
    ));
    screen.add(UsersScreen(
      userRepo: userRepo,
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(

        children: screen,
        index: activePage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        backgroundColor: Colors.pinkAccent,
        currentIndex: activePage,
        onTap: (index){
          setState(() {
            activePage=index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(

              Icons.shop,
              color: Colors.yellow,
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.yellow,
            ),
            label: "Users",
          ),
        ],
      ),
    );
  }
}
