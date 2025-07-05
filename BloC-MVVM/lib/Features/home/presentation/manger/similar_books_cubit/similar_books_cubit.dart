import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilerBooks({required String categroy}) async {
    emit(SimilarBooksLoasind());
    var result = await homeRepo.fetchSimilarBooks(categroy: categroy);
    result.fold(
      (failure) {
        emit(SimilarBooksFailuer(failure.errMessage));
      },
      (books) => {
        emit(SimilarBooksSuccess(books)),
      },
    );
  }
}
