import 'package:http/http.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam_project/ui/pages/home_page.dart';
import 'package:exam_project/ui/pages/trash_page.dart';
import 'package:exam_project/cubits/home/products_cubit.dart';
import 'package:exam_project/data/services/products_service.dart';


class Pager {
  Pager._();

  static Widget get home => BlocProvider(
        create: (context) => ProductsCubit(ProductsService())..getProduct(),
        child: const HomePage(),
      );
  static Widget get trash => const TrashPage();
}
