import 'package:get_it/get_it.dart';

import '../../Features/Videos_lists/data/data_sources/videos_local_data_source.dart';
import '../../Features/Videos_lists/data/data_sources/videos_remote_data_source.dart';
import '../../Features/Videos_lists/data/repository/videos_repository.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<VideosRepository>(
    VideosRepository(
      baseVideosRemoteDataSource: VideosRemoteDataSource(),
      baseVideosLocalDataSource: VideosLocalDataSource(),
    ),
  );
}
