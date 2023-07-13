import 'package:dartz/dartz.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics.dart';

import '../../../../Core/error/failure.dart';
import '../repository/base_videos_repository.dart';

class GetListTopics {
  BaseVideosRepository baseVideosRepository;

  GetListTopics(this.baseVideosRepository);

  Future<Either<Failure, List<Topics>>> execute() async {
    return await baseVideosRepository.getListTopics();
  }
}
