import 'package:airways/data/models/product/product_model.dart';
import 'package:airways/ui/widgets/global_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DescribeScreen extends StatefulWidget {
  const DescribeScreen({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  State<DescribeScreen> createState() => _DescribeScreenState();
}

class _DescribeScreenState extends State<DescribeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Describe Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(

          children: [
            SizedBox(child: Center(child: CachedNetworkImage(imageUrl: widget.productModel.image,width: double.infinity,height: 300,),)),
            SizedBox(height: 20,),
            SizedBox(child: Text("${widget.productModel.description}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
            SizedBox(height: 10,),
            widget.productModel.category=="men's clothing"||widget.productModel.category=="women's clothing"?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Color",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          shape: BoxShape.circle
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          shape: BoxShape.circle
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle
                      ),
                    ),
                  ],
                )
              ],
            ):Text("No Colors"),
            SizedBox(height: 10,),
            Expanded(child: GlobalButton(text: 'Add To Cart', onTap: () {},)),
          ],
        ),
      ),
    );
  }
}
