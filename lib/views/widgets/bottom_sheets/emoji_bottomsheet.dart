// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class FontstyleBottomsheets extends StatelessWidget {
// //   const FontstyleBottomsheets({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 150,
// //       decoration: BoxDecoration(
// //         color: Colors.brown,
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(12),
// //           topRight: Radius.circular(12),
// //         ),
// //       ),
// //       padding: EdgeInsets.all(5),
// //       child: Text(),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
//
// class FontStyleBottomSheet extends StatelessWidget {
//   final Function(TextStyle) onStyleSelected;
//
//   const FontStyleBottomSheet({super.key, required this.onStyleSelected});
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<TextStyle> styles = [
//       TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Colors.black),
//       TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, color: Colors.black),
//       TextStyle(fontSize: 20, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, color: Colors.black),
//       TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, color: Colors.black),
//
//     ];
//
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//       ),
//       padding: EdgeInsets.all(5),
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: styles.length,
//         itemBuilder: (context, index) {
//           final textStyle = styles[index];
//           return GestureDetector(
//             onTap: () {
//               onStyleSelected(textStyle);
//               Navigator.pop(context);
//             },
//             child: Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Center(
//                 child: Text(
//                   'Shayries!',
//                   style: textStyle,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class EmojiPickerBottomSheet extends StatelessWidget {
  final Function(String) onEmojiSelected;

  const EmojiPickerBottomSheet({super.key, required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {

    final List<String> emojis = [
      '😀', '😂', '😍', '😭', '😎', '😡', '🤔', '🎉', '🔥', '👍', '🙏', '✨'
    ];

    return Container(
      height: 150,
      decoration: BoxDecoration(
       // border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: emojis.length,
        itemBuilder: (context, index) {
          final emoji = emojis[index];
          return GestureDetector(
            onTap: () {
              onEmojiSelected(emoji);
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  emoji,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
