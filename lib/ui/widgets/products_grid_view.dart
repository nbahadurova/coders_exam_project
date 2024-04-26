import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project/cubits/home/products_cubit.dart';
import 'package:exam_project/ui/widgets/product_container.dart';
import 'package:exam_project/data/models/remote/products_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          final products = state.response;
          return GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductContainer(
                product: product,
                onPressed: () {
                  context.read<ProductsCubit>().deleteProduct(product.id!);
                  //  BlocProvider.of<ProductsCubit>(context).deleteProduct(index);
                },
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
