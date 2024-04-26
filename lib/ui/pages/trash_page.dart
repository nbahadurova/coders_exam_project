import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project/cubits/home/products_cubit.dart';
import 'package:exam_project/ui/widgets/product_container.dart';
import 'package:exam_project/data/models/remote/products_model.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash page'),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (cubit.trash.isEmpty) {
            return const Center(
                child: Text(
              'Trash is empty',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ));
          } else if (state is ProductsSuccess) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: cubit.trash.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    final product = cubit.trash[index];
                    return ProductContainer(
                      product: product,
                      onPressed: () {
                        context
                            .read<ProductsCubit>()
                            .deleteProductFromTrash(product.id!);
                      },
                    );
                  },
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
