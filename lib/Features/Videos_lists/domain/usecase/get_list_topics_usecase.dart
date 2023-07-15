import 'package:dartz/dartz.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics_entity.dart';

import '../../../../Core/error/failure.dart';
import '../repository/base_videos_repository.dart';

class GetListTopicsUseCase {
  BaseVideosRepository baseVideosRepository;

  GetListTopicsUseCase(this.baseVideosRepository);

  Future<Either<Failure, List<TopicsEntity>>> execute() async {
    return await baseVideosRepository.getListTopics();
  }
}
