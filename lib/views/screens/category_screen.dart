import 'package:flutter/material.dart';
import 'package:my_shayari_app/controllers/shayari_controllers.dart';
import 'package:my_shayari_app/models/category_model.dart';
import 'package:my_shayari_app/views/screens/shayari_list_screen.dart';
import 'package:my_shayari_app/views/screens/shayari_screen.dart';


import '../widgets/tiles/custom_tiles.dart';

class CategoryScreen extends StatelessWidget {
  // const CategoryScreen({super.key});
final ShayariControllers shayariController = ShayariControllers();//shayaricontrollers class
  @override
  Widget build(BuildContext context) {

    List categories = shayariController.fetchAllCategories();// shayaricontroller(object .)fetchallcategories(list)
    return  Scaffold(
      backgroundColor: Color(0xFFF6EACB),
      // backgroundColor: Color(oxffF6EACB),
       // backgroundColor: Color(0xF6EACB),

      appBar: AppBar(title: Text("Love shayari"),backgroundColor: Color(0xffD1E9F6),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemBuilder: (context, index) {

        return  CustomTile(

          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShayariListScreen(category: categories[index],

            ),
           ),);
          },
          assetPath: categories[index].assetPath, title: categories[index].name, );
        }, separatorBuilder: (context, index) => SizedBox(
          height: 15,
        ), itemCount: categories.length),
      ),
    );
  }
}
