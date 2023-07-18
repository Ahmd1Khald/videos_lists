import 'package:flutter/material.dart';
import 'package:videos_lists/Features/Videos_lists/domain/repository/base_videos_repository.dart';

import 'Features/Videos_lists/data/data_sourceses/videos_local_data_source.dart';
import 'Features/Videos_lists/data/data_sourceses/videos_remote_data_source.dart';
import 'Features/Videos_lists/data/repository/videos_repository.dart';
import 'Features/Videos_lists/domain/usecase/get_list_items_usecase.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseVideosRemoteDataSource baseVideosRemoteDataSource =
        VideosRemoteDataSource();
    BaseVideosLocalDataSource baseVideosLocalDataSource =
        VideosLocalDataSource();
    BaseVideosRepository baseVideosRepository = VideosRepository(
      baseVideosRemoteDataSource: baseVideosRemoteDataSource,
      baseVideosLocalDataSource: baseVideosLocalDataSource,
    );

    final result = await GetListItemsUseCase(baseVideosRepository).execute(1);
    //print(result);
    result.fold((l) => print(l), (r) => print(r));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
