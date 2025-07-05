import '../expense_repository.dart';

abstract class ExpenseRepo {
   Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();

  Future<void> createExpense(Expense expense);

  Future<List<Expense>> getExpenses();
}
