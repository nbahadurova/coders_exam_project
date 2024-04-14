import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:exam_project/data/services/products_service.dart';
import 'package:exam_project/data/models/remote/products_model.dart';


part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  final List<ProductsModel> trash = [];
  final List<ProductsModel> deletedItemCount = [];
  void getProduct() async {
    try {
      emit(ProductsLoading());
      final result = await ProductsService().getProducts();
      emit(ProductsSuccess(response: result));
    } on SocketException catch (e) {
      emit(ProductsNetworkError(message: 'No internet'));
    } catch (e) {
      emit(ProductsFailure(message: 'Error occured'));
    }
  }
    void deleteProduct(int index) {
    if (state is ProductsSuccess) {
      try {
        final List<ProductsModel> updatedProducts =
            List.from((state as ProductsSuccess).response);
        final deletedProduct = updatedProducts.removeAt(index);
        trash.add(deletedProduct);
        emit(ProductsSuccess(response: updatedProducts));
      } catch (e) {
        emit(ProductsFailure(message: 'Error occurred while deleting product'));
      }
    }
  }
  @override
  Future<void> close() {
    return super.close();
  }
}
