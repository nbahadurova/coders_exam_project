import 'package:flutter/material.dart';
import 'package:exam_project/ui/widgets/delete_button.dart';

class CustomAppBar extends StatelessWidget {

  const CustomAppBar({ super.key, required this.title, required this.onPressed });
  final String title;
  final void Function() onPressed;
  
   @override
   Widget build(BuildContext context) {
       return AppBar(
        title: Text(title),
        actions: [
         IconButton(onPressed: onPressed, icon: const Icon(Icons.delete))
        ],
      );
  }
}