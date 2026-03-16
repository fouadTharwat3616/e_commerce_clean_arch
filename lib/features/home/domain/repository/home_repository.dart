import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/brand.dart';
import 'package:ecommerce/features/home/domain/entities/craegory.dart';

abstract class HomeRepository{
  Future<Either<Failure,List<Category>>> getCtegories();

  Future<Either<Failure,List<Brand>>> getBrands();
}