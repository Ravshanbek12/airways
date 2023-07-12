import 'package:airways/data/local/storagea_repository.dart';
import 'package:airways/data/network/api_provider.dart';
import 'package:airways/data/network/repositories/login_repo.dart';
import 'package:airways/ui/login/login_screen.dart';
import 'package:airways/ui/tab_box/products/descrition/describ_screen.dart';
import 'package:airways/ui/tab_box/products/widgets/category_selector.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/product/product_model.dart';
import '../../../data/network/repositories/caregory_repo.dart';
import '../../../data/network/repositories/product_repo.dart';

enum SampleItem {ascSort,descSort}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    Key? key,
    required this.productRepo,
    required this.categoryRepo,
  }) : super(key: key);

  final ProductRepo productRepo;
  final CategoryRepo categoryRepo;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String activeCategoryName = "";

  List<ProductModel> products = [];
  List<String> categories = [];

  bool isLoading = false;
  String sort ="asc";

  _updateProducts() async {
    setState(() {
      isLoading = true;
    });
    products =
        await widget.productRepo.getProductsByCategory(activeCategoryName,sort);
    setState(() {
      isLoading = false;
    });
  }

  _init() async {
    categories = await widget.categoryRepo.getAllCategories();
  }

  @override
  void initState() {
    _init();
    _updateProducts();
    super.initState();
  }
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Products screen"),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return ProductAddScreen(
                //           productRepo:widget.productRepo
                //       );
                //     },
                //   ),
                // );
              },
              icon: const Icon(Icons.add)),
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
               PopupMenuItem<SampleItem>(
                value: SampleItem.ascSort,
                child: Text('Sort ASC'),
                 onTap: ()async{
                  setState(() {
                    sort = "asc";
                    _updateProducts();

                  });
                 },
              ),
               PopupMenuItem<SampleItem>(
                value: SampleItem.descSort,
                child: Text('Sort DESC'),
                  onTap: ()async{
                  await ProductRepo(apiProvider:ApiProvider()).getSortedProducts("desc");
                  setState(() {
                    sort = "desc";
                    _updateProducts();
                  });
                  },
              ),

            ],

          ),
          IconButton(onPressed: (){
            StorageRepository.deleteString("token");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(loginRepo: LoginRepo(apiProvider: ApiProvider()))));
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          categories.isNotEmpty
              ? CategorySelector(
                  categories: categories,
                  onCategorySelected: (selectedCategory) {
                    activeCategoryName = selectedCategory;
                    _updateProducts();
                  },
                )
              : const Center(child: CircularProgressIndicator()),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DescribeScreen(productModel: products[index])));
                        },
                        child: Container(

                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Container(
                                  decoration: BoxDecoration(
                                      color:Colors.white,
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl: products[index].image,
                                        fit: BoxFit.scaleDown,
                                        width: double.infinity,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(height: 10,),
                                    // IconButton(onPressed: (){}, icon: Icon(Icons.next_plan_outlined,size: 10,))
                                  ],
                                ),
                                Text("\$${products[index].price}"),
                            SizedBox(height: 5,),
                            RatingBar.builder(
                              initialRating: products[index].rating.rate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                                SizedBox(height: 5,),
                                Text("${products[index].description}",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
          )
        ],
      ),
    );
  }
}
