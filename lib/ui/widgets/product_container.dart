import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.onPressed,
  });
  final String image;
  final String title;
  final double price;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          children: [
            Stack(alignment: Alignment.topLeft, children: [
              Image.network(
                image,
                height: 100,
                width: 70,
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: onPressed,
              ),
            ]),
            Expanded(child: Text(title)),
            Text(price.toString()),
          ],
        ),
      ),
    );
  }
}
