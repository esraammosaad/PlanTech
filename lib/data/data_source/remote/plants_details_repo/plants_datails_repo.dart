import 'package:dartz/dartz.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import '../../../../core/class/failure.dart';

abstract class PlantsDetailsRepo {
  Future<Either<Failure, PlantsDetailsModel>> getPlantsDetails({required int id});
}
