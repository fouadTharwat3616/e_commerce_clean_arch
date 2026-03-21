abstract class WishlistStates{}

class WishlistInitial extends WishlistStates{}


class AddToWishlistLoading extends WishlistStates{}
class AddToWishlistError extends WishlistStates{
  String message;
  AddToWishlistError(this.message);
}
class AddToWishlistSuccess extends WishlistStates{}





class GetWishlistLoading extends WishlistStates{}
class GetWishlistSuccess extends WishlistStates{}
class GetWishlistError extends WishlistStates{
  String message;
  GetWishlistError(this.message);
}

class DeleteFromWishlistLoading extends WishlistStates{}
class DeleteFromWishlistSuccess extends WishlistStates{}
class DeleteFromWishlistError extends WishlistStates{
  String message;
  DeleteFromWishlistError(this.message);
}