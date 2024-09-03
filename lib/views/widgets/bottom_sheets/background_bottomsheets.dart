// // import 'package:flutter/material.dart';
// //
// // class BackgroundBottomsheets extends StatelessWidget {
// //   const BackgroundBottomsheets({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 150,
// //       decoration: BoxDecoration(
// //           color: Colors.brown,
// //           borderRadius: BorderRadius.only(
// //             topLeft: Radius.circular(12),
// //             topRight: Radius.circular(12),
// //           )),padding: EdgeInsets.all(5),
// //       child: GridView.builder(
// //         itemCount: 40,
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 8,
// //           crossAxisSpacing: 10,
// //           mainAxisSpacing: 8,
// //
// //         ),
// //         itemBuilder: (context, index) => Container(
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(12),
// //             color: Colors.white30,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
//
// class BackgroundBottomsheets extends StatelessWidget {
//   final Function(Color) onColorSelected;
//
//   const BackgroundBottomsheets({super.key, required this.onColorSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Color> colors = [
//       Colors.red,
//       Colors.blue,
//       Colors.green,
//       Colors.yellow,
//       Colors.orange,
//       Colors.purple,
//       Colors.pink,
//       Colors.teal,
//       Colors.cyan,
//       Colors.indigo,
//       Colors.amber,
//       Colors.lime,
//       Colors.brown,
//       Colors.grey,
//       Colors.blueGrey,
//       Colors.deepOrange,
//       Colors.lightGreen,
//       Colors.lightBlue,
//       Colors.deepPurple,
//       Colors.black,
//     ];
//
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
//       child: GridView.builder(
//         itemCount: colors.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 8,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 8,
//         ),
//         itemBuilder: (context, index) => GestureDetector(
//           onTap: () {
//             onColorSelected(colors[index]);
//             Navigator.pop(context); // Close the bottom sheet after selection
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: colors[index],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class BackgroundBottomsheets extends StatelessWidget {
  final void Function(Color) onColorSelected;
///color argument and return void ,this is how this function work!
  const BackgroundBottomsheets({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red.shade200,
      Colors.blue.shade200,
      Colors.green.shade200,
      Colors.yellow.shade200,
      Colors.orange.shade200,
      Colors.purple.shade200,
      Colors.pink.shade200,
      Colors.teal.shade200,
      Colors.cyan.shade200,
      Colors.indigo.shade200,
      Colors.amber.shade200,
      Colors.lime.shade200,
    //  Colors.brown,
      Colors.grey,
      Colors.blueGrey,
      Colors.deepOrange,
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.deepPurple,
      Colors.black,
    ];

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(5),
      child: GridView.builder(
        itemCount: colors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            onColorSelected(colors[index]);
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colors[index],
            ),
          ),
        ),
      ),
    );
  }
}
