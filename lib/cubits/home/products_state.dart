part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsNetworkError extends ProductsState {
  ProductsNetworkError({required this.message});
  final String message;
}
final class ProductsFailure extends ProductsState {
  ProductsFailure({required this.message});
  final String message;
}

final class ProductsSuccess extends ProductsState {
  ProductsSuccess({required this.response});
  final List<ProductsModel> response;
}

final class ProductsNoProduct extends ProductsState {
  ProductsNoProduct({required this.message});
  final String message;
}
