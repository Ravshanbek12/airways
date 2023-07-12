import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selected=-2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(

            padding: const EdgeInsets.all(8.0),
            child: ZoomTapAnimation(
              onTap: () {
                selected=-1;
                widget.onCategorySelected.call("");
                setState(() {
                });
              },
              child: Container(
                width: 30,
                height: 20,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: selected==-1?Colors.yellow:Colors.green
                ),
                child: Center(
                  child: Text(
                    "All",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          ...List.generate(widget.categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),

              child: ZoomTapAnimation(
                onTap: () {
                  selected=index;
                  widget.onCategorySelected.call(widget.categories[index]);
                  setState(() {

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:  selected==index?Colors.yellow:Colors.green
                  ),
                  child: Text(
                    widget.categories[index],
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
