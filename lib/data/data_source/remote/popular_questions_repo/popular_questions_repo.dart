import 'package:dartz/dartz.dart';
import 'package:grad_proj/data/models/plants_model.dart';
import 'package:grad_proj/data/models/popular_questions_model.dart';

import '../../../../core/class/failure.dart';

abstract class PopularQuestionsRepo {
  Future<Either<Failure, List<Questions>>> getPopularQuestions();
  Future<Either<Failure, List<Questions>>> getAllPopularQuestions();
}
