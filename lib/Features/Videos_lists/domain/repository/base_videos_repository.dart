import 'package:dartz/dartz.dart';

import '../../../../Core/error/failure.dart';
import '../entites/items/items_entity.dart';
import '../entites/topics/topics_entity.dart';

abstract class BaseVideosRepository {
  Future<Either<Failure, List<TopicsEntity>>> fetchListTopics();
  Future<Either<Failure, List<ItemsEntity>>> fetchListItems({required int id});
}
