import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:exam_project/ui/widgets/product_image.dart';
import 'package:exam_project/data/models/remote/products_model.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.onPressed, 
    required this.product,
  });
  final ProductsModel product;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 10),
      child: 
          Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Column(
            children: [
              ProductImage(image: product.image!, onPressed: onPressed),
              Expanded(child: Text(product.title!)),
              Text(product.price.toString()),
            ],
          ),
        ));
        
     
  }
}
