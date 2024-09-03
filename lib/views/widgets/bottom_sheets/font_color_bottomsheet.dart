import 'package:flutter/material.dart';

class FontColorBottomsheets extends StatelessWidget {
  final void Function(Color) onColorSelected;
  ///color argument and return void ,this is how this function work!
  const FontColorBottomsheets({super.key, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.indigo,
      Colors.amber,
      Colors.lime,
     // Colors.brown,
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
            onColorSelected(colors[index]); // Invoke callback with selected color
            Navigator.pop(context); // Close the bottom sheet
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
