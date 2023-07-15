import 'package:dartz/dartz.dart';
import 'package:videos_lists/Core/error/exceptions.dart';
import 'package:videos_lists/Core/error/failure.dart';
import 'package:videos_lists/Features/Videos_lists/data/data_source/videos_data_source.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics_entity.dart';
import 'package:videos_lists/Features/Videos_lists/domain/repository/base_videos_repository.dart';

class VideosRepository extends BaseVideosRepository {
  final BaseVideosRemoteDataSource baseVideosRemoteDataSource;

  VideosRepository(this.baseVideosRemoteDataSource);

  @override
  Future<Either<Failure, List<TopicsEntity>>> getListTopics() async {
    try {
      var result = await baseVideosRemoteDataSource.getTopicsList();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}
