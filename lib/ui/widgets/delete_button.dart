import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {

  const DeleteButton({ super.key, required this.onPressed });
  final void Function() onPressed;
   @override
   Widget build(BuildContext context) {
       return IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.delete));
  }
}