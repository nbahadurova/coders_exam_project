import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image, required this.onPressed});
  final String image;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.network(
            image,
            height: 100,
            width: 70,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 25,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
