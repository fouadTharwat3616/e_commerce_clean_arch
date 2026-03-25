// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:ecommerce/core/di/register_module.dart' as _i45;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i19;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i20;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i22;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i21;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i24;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i23;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i37;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart' as _i39;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i43;
import 'package:ecommerce/features/cart/data/data_source/remote/cart_api_remote_data_source.dart'
    as _i26;
import 'package:ecommerce/features/cart/data/data_source/remote/cart_remote_data_source.dart'
    as _i25;
import 'package:ecommerce/features/cart/data/repository/cart_repository_impl.dart'
    as _i28;
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart'
    as _i27;
import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i42;
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart'
    as _i29;
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart' as _i32;
import 'package:ecommerce/features/cart/domain/use_cases/update_cart.dart'
    as _i40;
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i44;
import 'package:ecommerce/features/home/data/data_source/remote/home_api_remote_data_source.dart'
    as _i5;
import 'package:ecommerce/features/home/data/data_source/remote/home_remote_data_source.dart'
    as _i4;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i7;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i6;
import 'package:ecommerce/features/home/domain/use_cases/get_brands.dart'
    as _i31;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i33;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i36;
import 'package:ecommerce/features/product/data/data_source/remote/product_api_remote_data_source.dart'
    as _i9;
import 'package:ecommerce/features/product/data/data_source/remote/product_remote_data_source.dart'
    as _i8;
import 'package:ecommerce/features/product/data/repository/product_repository_impl.dart'
    as _i11;
import 'package:ecommerce/features/product/domain/repository/product_repository.dart'
    as _i10;
import 'package:ecommerce/features/product/domain/use_cases/get_products.dart'
    as _i34;
import 'package:ecommerce/features/product/presentation/cubit/product_cubit.dart'
    as _i38;
import 'package:ecommerce/features/profile/presentation/cubit/profile_cubit.dart'
    as _i12;
import 'package:ecommerce/features/wishlist/data/data_source/remote/wishlist_api_remote_data_source.dart'
    as _i15;
import 'package:ecommerce/features/wishlist/data/data_source/remote/wishlist_remote_data_source.dart'
    as _i14;
import 'package:ecommerce/features/wishlist/data/repository/wishlist_repository_impl.dart'
    as _i17;
import 'package:ecommerce/features/wishlist/domain/repository/wishlist_repository.dart'
    as _i16;
import 'package:ecommerce/features/wishlist/domain/use_cases/add_to_wishlist.dart'
    as _i18;
import 'package:ecommerce/features/wishlist/domain/use_cases/delete_from_wishlist.dart'
    as _i30;
import 'package:ecommerce/features/wishlist/domain/use_cases/get_wishlist.dart'
    as _i35;
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart'
    as _i41;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.HomeRemoteDataSource>(
        () => _i5.HomeAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i6.HomeRepository>(
        () => _i7.HomeRepositoryImpl(gh<_i4.HomeRemoteDataSource>()));
    gh.singleton<_i8.ProductRemoteDataSource>(
        () => _i9.ProductAPIREmoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i10.ProductRepository>(
        () => _i11.ProductRepositoryImpl(gh<_i8.ProductRemoteDataSource>()));
    gh.singleton<_i12.ProfileCubit>(() => _i12.ProfileCubit());
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i14.WishListRemoteDataSource>(
        () => _i15.WishlistAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i16.WishlistRepository>(
        () => _i17.WishListRepositoryImpl(gh<_i14.WishListRemoteDataSource>()));
    gh.singleton<_i18.AddToWishlist>(
        () => _i18.AddToWishlist(gh<_i16.WishlistRepository>()));
    gh.singleton<_i19.AuthLocalDataSource>(
        () => _i20.AuthSharedPrefLocalDataSource(gh<_i13.SharedPreferences>()));
    gh.singleton<_i21.AuthRemoteDataSource>(
        () => _i22.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i23.AuthRepository>(() => _i24.AuthRepositoryImpl(
          gh<_i21.AuthRemoteDataSource>(),
          gh<_i19.AuthLocalDataSource>(),
        ));
    gh.singleton<_i25.CartRemoteDataSource>(
        () => _i26.CartAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i27.CartRepository>(
        () => _i28.CartRepositoryImpl(gh<_i25.CartRemoteDataSource>()));
    gh.singleton<_i29.DeleteFromCart>(
        () => _i29.DeleteFromCart(gh<_i27.CartRepository>()));
    gh.singleton<_i30.DeleteFromWishlist>(
        () => _i30.DeleteFromWishlist(gh<_i16.WishlistRepository>()));
    gh.singleton<_i31.GetBrands>(
        () => _i31.GetBrands(gh<_i6.HomeRepository>()));
    gh.singleton<_i32.GetCart>(() => _i32.GetCart(gh<_i27.CartRepository>()));
    gh.singleton<_i33.GetCategories>(
        () => _i33.GetCategories(gh<_i6.HomeRepository>()));
    gh.singleton<_i34.GetProducts>(
        () => _i34.GetProducts(gh<_i10.ProductRepository>()));
    gh.singleton<_i35.GetWishlist>(
        () => _i35.GetWishlist(gh<_i16.WishlistRepository>()));
    gh.factory<_i36.HomeCubit>(() => _i36.HomeCubit(
          gh<_i33.GetCategories>(),
          gh<_i31.GetBrands>(),
        ));
    gh.singleton<_i37.Login>(() => _i37.Login(gh<_i23.AuthRepository>()));
    gh.singleton<_i38.ProductCubit>(
        () => _i38.ProductCubit(gh<_i34.GetProducts>()));
    gh.singleton<_i39.Register>(() => _i39.Register(gh<_i23.AuthRepository>()));
    gh.singleton<_i40.UpdateCart>(
        () => _i40.UpdateCart(gh<_i27.CartRepository>()));
    gh.factory<_i41.WishListCubit>(() => _i41.WishListCubit(
          gh<_i18.AddToWishlist>(),
          gh<_i35.GetWishlist>(),
          gh<_i30.DeleteFromWishlist>(),
        ));
    gh.singleton<_i42.AddToCard>(
        () => _i42.AddToCard(gh<_i27.CartRepository>()));
    gh.singleton<_i43.AuthCubit>(() => _i43.AuthCubit(
          gh<_i39.Register>(),
          gh<_i37.Login>(),
        ));
    gh.factory<_i44.CartCubit>(() => _i44.CartCubit(
          gh<_i32.GetCart>(),
          gh<_i42.AddToCard>(),
          gh<_i40.UpdateCart>(),
          gh<_i29.DeleteFromCart>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i45.RegisterModule {}
