import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepo expenseRepo;
  CreateCategoryBloc(this.expenseRepo) : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) async {
      emit(CreateCategoryLoading());

      try {
        await expenseRepo.createCategory((event as CreateCategory).category);
        emit(CreateCategorySuccess());
      } catch (e) {
        emit(CreateCategoryFailure());
      }
    });
  }
}
