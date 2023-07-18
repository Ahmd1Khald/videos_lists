import 'package:dartz/dartz.dart';

import '../../../../Core/error/failure.dart';
import '../../../../Core/use_cases.dart';
import '../entites/topics/topics_entity.dart';
import '../repository/base_videos_repository.dart';

class GetListTopicsUseCase extends UseCase<List<TopicsEntity>, NoParam> {
  final BaseVideosRepository baseVideosRepository;

  GetListTopicsUseCase(this.baseVideosRepository);

  @override
  Future<Either<Failure, List<TopicsEntity>>> execute([NoParam? param]) async {
    return await baseVideosRepository.fetchListTopics();
  }
}
