import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton(this.title,{super.key,this.onTap});
final String title;
final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
            color: Color(0xFFF1D3CE), borderRadius: BorderRadius.circular(12)),
        alignment: Alignment.center,
        child: Text(title,style: TextStyle(fontSize: 10),),
      ),
    );
  }
}
