import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:motorent/data/datasources/firebase_car_data_source.dart';
import 'package:motorent/data/repositories/car_repository_impl.dart';
import 'package:motorent/domain/repositories/car_repository.dart';
import 'package:motorent/domain/usecases/get_cars.dart';
import 'package:motorent/presentation/bloc/car_bloc.dart';

final GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);

    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));

    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));

    getIt.registerLazySingleton<GetCars>(
        () => GetCars(getIt<CarRepository>()));

    getIt.registerFactory<CarBloc>(() => CarBloc(getCars: getIt<GetCars>()));

    print('Dependency Injection Initialized Successfully!');
  } catch (e, stackTrace) {
    print('Error in Dependency Injection: $e\n$stackTrace');
    rethrow;
  }
}
