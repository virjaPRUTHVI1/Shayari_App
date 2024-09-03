import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key,required this.assetPath, required this.title, this.onTap,} );

  final String assetPath;
  final String title;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      // categories[index]
    //  tileColor: const Color(0xFFDCA47C),
      tileColor:  Color(0xFFF1D3CE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
      leading: Image.asset(
        width: 40,
        height: 40,
        assetPath,

        // color: Colors.transparent,
        // style: TextStyle(fontSize: 24),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      title: Text(
        title,
        maxLines: 1,
        // style: Theme.of(context)
        //     .textTheme
        //     .titleMedium
        //     ?.copyWith(color: Color(0xFFFCF8F3)),
        // maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


