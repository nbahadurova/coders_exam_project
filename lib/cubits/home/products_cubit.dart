import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:exam_project/data/services/products_service.dart';
import 'package:exam_project/data/models/remote/products_model.dart';


part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsService) : super(ProductsInitial());
  final ProductsService _productsService;
  final List<ProductsModel> trash = [];
  List<ProductsModel> products = [];
  void getProduct() async {
    try {
      emit(ProductsLoading());
      products = await _productsService.getProducts();
      // if (trash.isEmpty) {
      //   emit(ProductsNoProduct(message: 'trash is empty'));
        
      // }
      emit(ProductsSuccess(response: products));
    } on SocketException catch (e) {
      emit(ProductsNetworkError(message: 'No internet'));
    } catch (e) {
      emit(ProductsFailure(message: 'Error occured'));
    }
  }
  void deleteProduct(int id) {
    products.removeWhere((product) {
      if (product.id == id) {
        trash.add(product);
        return true;
      }
        return false;
      
    });
    emit(ProductsSuccess(response: products));
  } 
  void deleteProductFromTrash(int id) {
    trash.removeWhere((product) {
      if (product.id == id) {
        products.add(product);
        products.sort((a,b) => a.id!.compareTo(b.id!));
        return true;
      }
      return false;
    });
    emit(ProductsSuccess(response: trash));
    emit(ProductsSuccess(response: products));
  } 

  @override
  // ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }
}
