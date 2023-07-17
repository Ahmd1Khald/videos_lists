import 'package:dartz/dartz.dart';

import '../../../../Core/error/failure.dart';
import '../entites/topics_entity.dart';

abstract class BaseVideosRepository {
  Future<Either<Failure, List<TopicsEntity>>> getListTopics();
}