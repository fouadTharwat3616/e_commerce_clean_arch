import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/product/domain/use_cases/get_products.dart';
import 'package:ecommerce/features/product/presentation/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class ProductCubit extends Cubit<ProductStates>{
  final GetProducts _getProducts;
  ProductCubit(
      this._getProducts
      ):super(GetProductInitial());

  Future<void> getProducts() async{
    emit(GetProductLoading());
   final result = await _getProducts();
   result.fold(
           (failure) => emit(GetProductError(failure.message)),
           (products) => emit(GetProductSuccess(products))
   );
  }
}