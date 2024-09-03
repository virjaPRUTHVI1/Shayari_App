// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FontstyleBottomsheets extends StatelessWidget {
//   const FontstyleBottomsheets({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       decoration: BoxDecoration(
//         color: Colors.brown,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//       ),
//       padding: EdgeInsets.all(5),
//       child: Text(),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FontStyleBottomSheet extends StatelessWidget {
  final Function(TextStyle) onStyleSelected;

  const FontStyleBottomSheet({super.key, required this.onStyleSelected});

  @override
  Widget build(BuildContext context) {
    // Define a list of TextStyles
    final List<TextStyle> styles = [
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, color: Colors.black),
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, color: Colors.black),
      TextStyle(fontSize: 20, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic, color: Colors.black),
      TextStyle(fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, color: Colors.black),
      // Add more styles as needed
    ];

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(5),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: styles.length,
        itemBuilder: (context, index) {
          final textStyle = styles[index];
          return GestureDetector(
            onTap: () {
              onStyleSelected(textStyle); // Apply selected style
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Sample Text',
                  style: textStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
