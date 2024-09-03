import 'package:flutter/material.dart';
import 'package:my_shayari_app/models/category_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:my_shayari_app/views/screens/edit_screen.dart';

import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../controllers/shayari_controllers.dart';
//import '../../controllers/shayari_editing_pemission.dart';

class ShayariScreen extends StatefulWidget {
  const ShayariScreen({super.key, required this.category, required this.index});

  final Category category;
  final int index;

  @override
  State<ShayariScreen> createState() => _ShayariScreenState();
}

class _ShayariScreenState extends State<ShayariScreen> {
  int _currentIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    _currentIndex = widget.index;
    super.initState();
  }

  ///build ni pehla call thay....
  Widget build(BuildContext context) {
    final controller = ShayariControllers();
    return Scaffold(
      backgroundColor: Color(0xFFF6EACB),
      appBar: AppBar(
        backgroundColor: Color(0xffD1E9F6),
        title: Text(
          "Love shayari",
          style: TextStyle(),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: widget.category.shayaries.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              // color: Colors.black,
              color: Color(0xFFD0B8A8),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.category.shayaries[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),textAlign: TextAlign.center,),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFEECAD5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                FlutterClipboard.copy(widget.category.shayaries[_currentIndex])
                    .then((_) {
                  // Fluttertoast.showToast(
                  //     msg: "text copied!",
                  //     // toastLength: Toast.LENGTH_SHORT,
                  //     //  gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.red,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Text copied!"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                });
              },
              icon: Icon(
                Icons.file_copy,
                color: Colors.black,
              ),
            ),

            ///copy
            IconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),

            ///previousIcon
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                            category: widget.category, index: _currentIndex),
                      ));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                )),

            ///editIcon///////////////
            IconButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.black,
                )),

            ///nextpage//////////
            IconButton(
              onPressed: () {
                 Share.share(widget.category.shayaries[_currentIndex]);
              },
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ),
            )

            ///shareICone////////////
          ],
        ),
      ),
    );
  }
}


