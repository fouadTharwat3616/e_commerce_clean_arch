import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_cart.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartCubit extends Cubit<CartStates>{
  final GetCart _getCart;
  final AddToCard _addToCard;
  final UpdateCart _updateCart;
  final DeleteFromCart _deleteFromCart;
  late Cart cart;
  CartCubit(this._getCart,this._addToCard,this._updateCart,this._deleteFromCart):super(CartInitial());

  Future<void> addToCard(String productId) async{
    emit(AddToCartLoading());
    final result =await _addToCard(productId);
    result.fold(
            (failure) => emit(AddToCartError(failure.message)),
            (r) => emit(AddToCartSuccess()));
  }

  Future<void> getCard() async{
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold(
            (failure) => emit(GetCartError(failure.message)),
            (cartResponse){
              cart=cartResponse;
              emit(GetCartSuccess());
            }
    );
  }



  Future<void> updateCart(String productID,int count) async{
    emit(UpdateCartLoading());
   final result= await _updateCart(productID,count);
   result.fold(
           (failure) => emit(UpdateCartError(failure.message)),
           (cartResponse) {
             cart = cartResponse;
             emit(UpdateCartSuccess());
           }
   );
  }


  Future<void> deleteFromCart(String productId) async
  {
    emit(DeleteFromCartLoading());
    final result=await _deleteFromCart(productId);
    result.fold(
            (failure) => emit(DeleteFromCartError(failure.message)),
            (deleteResponse){
              cart = deleteResponse;
              emit(DeleteFromCartSuccess());
            }
    );

  }

}