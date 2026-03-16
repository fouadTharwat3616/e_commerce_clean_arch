import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/craegory.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetCategories{
  final HomeRepository _homeRepository;
  GetCategories(this._homeRepository);

  Future<Either<Failure,List<Category>>> call() =>
      _homeRepository.getCtegories();
}