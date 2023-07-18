import 'package:dartz/dartz.dart';
import 'package:videos_lists/Core/error/exceptions.dart';
import 'package:videos_lists/Core/error/failure.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics/topics_entity.dart';
import 'package:videos_lists/Features/Videos_lists/domain/repository/base_videos_repository.dart';

import '../data_sourceses/videos_local_data_source.dart';
import '../data_sourceses/videos_remote_data_source.dart';

class VideosRepository extends BaseVideosRepository {
  final BaseVideosRemoteDataSource baseVideosRemoteDataSource;
  final BaseVideosLocalDataSource baseVideosLocalDataSource;

  VideosRepository({
    required this.baseVideosRemoteDataSource,
    required this.baseVideosLocalDataSource,
  });

  @override
  Future<Either<Failure, List<TopicsEntity>>> fetchListTopics() async {
    try {
      final localResult = await baseVideosLocalDataSource.getTopicsList();
      if (localResult.isNotEmpty) {
        return Right(localResult);
      }
      final result = await baseVideosRemoteDataSource.getTopicsList();
      //print(result);
      return Right(result);
    } on ServerException catch (failure) {
      print('failure  +++++++++++++++++++');
      print(failure);
      return Left(ServerFailure(failure.errorMessage));
    }
  }
}
