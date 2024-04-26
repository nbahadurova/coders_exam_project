import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project/utils/helpers/pager.dart';
import 'package:exam_project/ui/pages/trash_page.dart';
import 'package:exam_project/ui/widgets/delete_button.dart';
import 'package:exam_project/ui/widgets/custom_app_bar.dart';
import 'package:exam_project/cubits/home/products_cubit.dart';
import 'package:exam_project/ui/widgets/products_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: CustomAppBar(
            title: 'Home page',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: Pager.trash,
                    ),
                  ));
            },
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const ProductsGridView(),
            )
          ],
        ),
      ),
    );
  }
}
