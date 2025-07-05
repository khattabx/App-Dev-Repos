import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:motorent/data/models/car.dart';
import 'package:motorent/domain/usecases/get_cars.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoading());
      try {
        debugPrint('Fetching cars from Firestore...');
        final cars = await getCars.call();
        debugPrint('Fetched ${cars.length} cars');
        emit(CarsLoaded(cars));
      } catch (e, stackTrace) {
        debugPrint('Error in LoadCars: $e\n$stackTrace');
        emit(CarsError('Failed to load cars: ${e.toString()}'));
      }
    });
  }
}
