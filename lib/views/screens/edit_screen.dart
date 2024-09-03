import 'package:flutter/material.dart';
import 'package:my_shayari_app/models/category_model.dart';
import 'package:my_shayari_app/views/widgets/bottom_sheets/background_bottomsheets.dart';
import 'package:my_shayari_app/views/widgets/bottom_sheets/emoji_bottomsheet.dart';
import 'package:my_shayari_app/views/widgets/bottom_sheets/fontStyle_bottomsheets.dart';
import 'package:my_shayari_app/views/widgets/bottom_sheets/font_color_bottomsheet.dart';
import 'package:my_shayari_app/views/widgets/bottom_sheets/textSize_bottomsheets.dart';
import 'package:my_shayari_app/views/widgets/buttons/edit_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

import '../../controllers/shayari_controllers.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.category, required this.index});

  final Category category;
  final int index;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Color selectedBackgroundColor = Color(0xFFE1D7C6);
  Color selectedFontColor = Colors.black;
  String emoji = '';
  TextStyle selectedTextStyle = TextStyle(
      fontSize: 10, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal);

  void updateBackgroundColor(Color color) {
    setState(() {
      selectedBackgroundColor = color;
    });
  }
  void handleEmojiSelected(String selectedEmoji) {
    setState(() {
      emoji = selectedEmoji; // Add selected emoji to text
    });
  }

  void updateFontStyle(TextStyle style) {
    setState(() {
      selectedTextStyle = style;
    });
  }

  void updateTextSize(double size) {
    setState(() {
      selectedTextStyle = selectedTextStyle.copyWith(fontSize: size);
    });
  }

  void updateFontColor(Color color) {
    setState(() {
      selectedFontColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ShayariControllers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD1E9F6),
        title: Text("write shayari on photos!",style: TextStyle(fontSize: 20),),
      ),
      backgroundColor: Color(0xFFEAE4DD),

      body: Column(
        children: [
          Expanded(
            child: WidgetsToImage(
              controller: controller.widgetsToImageController,
              child: Card(
                color: selectedBackgroundColor,
                child: Center(
                  child: Text(

                    '$emoji ${widget.category.shayaries[widget.index]} $emoji',
                    style: selectedTextStyle.copyWith(color: selectedFontColor),textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFEECAD5),
                //color: Color(0xFF5B99C2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EditButton(
                        "Background",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => BackgroundBottomsheets(
                              onColorSelected: updateBackgroundColor,
                            ),
                          );
                        },
                      ),
                      EditButton(
                        "Text Color",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => FontColorBottomsheets(
                              onColorSelected: updateFontColor,
                            ),
                          );
                        },
                      ),
                     // FloatingActionButton(onPressed:  controller.shareImage,
                     //   child: Icon(Icons.share), ),
                      // EditButton(
                      //   " share",
                      //   onTap: () {
                      //     Share.share(widget.category.shayaries[widget.index]);
                      //   },
                      // ),
                      EditButton(
                        " share",
                        onTap: () {
                          controller.shareImage();

                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EditButton(
                        "FontStyle",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => FontStyleBottomSheet(
                              onStyleSelected: updateFontStyle,
                            ),
                          );
                        },
                      ),
                      EditButton(
                       "Emoji",
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => EmojiPickerBottomSheet(
                            onEmojiSelected: handleEmojiSelected,
                          ),);
                        },
                      ),
                      EditButton(
                        " Text size",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => TextSizeBottomSheet(
                              onSizeSelected: updateTextSize,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///device Explorere
///sdcard....
///
