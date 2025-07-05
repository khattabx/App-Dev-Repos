import 'package:arch_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:arch_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:arch_bookly/core/errors/failure.dart';
import 'package:arch_bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}