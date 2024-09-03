import 'package:flutter/material.dart';
import 'package:my_shayari_app/models/category_model.dart';
import 'package:my_shayari_app/storage/shayari_storage.dart';
import 'package:my_shayari_app/views/screens/shayari_screen.dart';


import '../widgets/tiles/custom_tiles.dart';

class ShayariListScreen extends StatelessWidget {
  const ShayariListScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EACB),
      appBar: AppBar(
        backgroundColor: Color(0xffD1E9F6),
        title: Text(category.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return CustomTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShayariScreen(category: category,index: index,),));
                },
                  assetPath: category.assetPath,
                  title: category.shayaries[index],);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemCount: category.shayaries.length),///shayries ni length acoording..
      ),
    );
  }
}


///for first screen...
///2.listviwe.separeted = return customtile, data : path,title, (category class object )