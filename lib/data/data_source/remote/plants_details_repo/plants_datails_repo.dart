import 'package:dartz/dartz.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import '../../../../core/class/failure.dart';
import '../../../models/care_guide_model.dart';

abstract class PlantsDetailsRepo {
  Future<Either<Failure, PlantsDetailsModel>> getPlantsDetails({required int id});
  Future<Either<Failure, List<CareGuideData>?>> careGuide({required String url});
}
