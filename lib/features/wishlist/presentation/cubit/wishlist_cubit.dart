import 'package:ecommerce/features/wishlist/domain/entities/wishlist_product_data.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/add_to_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/delete_from_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/get_wishlist.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class WishListCubit extends Cubit<WishlistStates>
{
  final AddToWishlist _addToWishlist;
  final GetWishlist _getWishlist;
  final DeleteFromWishlist _deleteFromWishlist;
  late List<WishlistProductDate> productsData=[];
  WishListCubit(this._addToWishlist,this._getWishlist,this._deleteFromWishlist):super(WishlistInitial());


  Future<void> addToWishlist(String productId)async
  {
    emit(AddToWishlistLoading());
    final result= await _addToWishlist(productId);
    result.fold(
            (failure) => emit(AddToWishlistError(failure.message)),
            (r) => emit(AddToWishlistSuccess())
    );
  }


  Future<void> getWishlist()async
  {
    emit(GetWishlistLoading());
    final result = await _getWishlist();
    result.fold(
            (failure) => emit(GetWishlistError(failure.message)),
            (wishlistResponse){
          productsData = wishlistResponse;
          emit(GetWishlistSuccess());
        }
    );

  }

  Future<void> deleteFromWishlist(String productId)async
  {
    emit(DeleteFromWishlistLoading());
    final result = await _deleteFromWishlist(productId);

    result.fold(
            (failure) {
          if (failure.message.contains('type \'String\'') || failure.message.contains('subtype')) {
            productsData.removeWhere((element) => element.id == productId);
            emit(DeleteFromWishlistSuccess());
            emit(GetWishlistSuccess());
          } else {
            emit(DeleteFromWishlistError(failure.message));
          }
        },(wishlistResponse) {
      productsData.removeWhere((element) => element.id == productId);
      emit(DeleteFromWishlistSuccess());
      emit(GetWishlistSuccess());
    }
    );
  }
}