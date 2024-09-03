import 'package:flutter/material.dart';

class TextSizeBottomSheet extends StatefulWidget {
  final Function(double) onSizeSelected;

  const TextSizeBottomSheet({super.key, required this.onSizeSelected});

  @override
  _TextSizeBottomSheetState createState() => _TextSizeBottomSheetState();
}

class _TextSizeBottomSheetState extends State<TextSizeBottomSheet> {
  double _currentSize = 16.0; // Initial text size

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Slider(
            value: _currentSize,
            min: 10.0,
            max: 40.0,
            divisions: 30,
            label: '${_currentSize.round()}',
            onChanged: (value) {
              setState(() {
                _currentSize = value;
              });
            },
            onChangeEnd: (value) {
              widget.onSizeSelected(value);
            },
          ),
          SizedBox(height: 20),
          Text(
            ' Text Size',
            style: TextStyle(fontSize: _currentSize),
          ),
        ],
      ),
    );
  }
}
