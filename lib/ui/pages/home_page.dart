import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:exam_project/ui/pages/trash_page.dart';
import 'package:exam_project/ui/widgets/products_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXAM'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrashPage(),
                    ));
              },
              icon: const Icon(Icons.delete))
        ],
      ),
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
