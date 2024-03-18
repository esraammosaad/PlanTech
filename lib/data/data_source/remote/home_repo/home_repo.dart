import 'package:dartz/dartz.dart';
import 'package:grad_proj/data/models/product_model.dart';

import '../../../../core/class/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Datum>>> getPlants();
}
