import 'package:dartz/dartz.dart';

import 'package:arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:arch_bookly/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
