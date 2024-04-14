import 'package:exam_project/utils/constants/endpoints.dart';
import 'package:exam_project/utils/network/dio/dio_client.dart';
import 'package:exam_project/data/models/remote/products_model.dart';


class ProductsService {
  Future<List<ProductsModel>> getProducts()async{
    const endpoint = Endpoints.url;
    final response = await dio.get(endpoint);
     final List data = response.data;
    if (response.statusCode == 200) {
      return data.map((e) => ProductsModel.fromJson(e)).toList();
    }
    throw Exception();
  }
}