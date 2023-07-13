import 'package:dartz/dartz.dart';

import '../../../../Core/error/failure.dart';
import '../entites/topics.dart';

abstract class BaseVideosRepository {
  Future<Either<Failure, List<Topics>>> getListTopics();
}
