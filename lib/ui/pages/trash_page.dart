import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project/cubits/home/products_cubit.dart';
import 'package:exam_project/ui/widgets/product_container.dart';
import 'package:exam_project/data/models/remote/products_model.dart';

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductsModel> trash =
                  context.read<ProductsCubit>().trash;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: 
                 GridView.builder(
                  itemCount: trash.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ProductContainer(
                      image: trash[index].image!,
                      title: trash[index].title!,
                      price: trash[index].price!,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
