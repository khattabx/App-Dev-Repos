import 'package:motorent/data/datasources/firebase_car_data_source.dart';
import 'package:motorent/data/models/car.dart';
import 'package:motorent/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() async {
    print('Fetching cars from Firestore...');
    return dataSource.getCars();
  }
}
