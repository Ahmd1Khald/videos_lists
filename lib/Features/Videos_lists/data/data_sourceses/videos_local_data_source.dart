import 'package:hive/hive.dart';
import 'package:videos_lists/Core/utils/constance/variables.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics_entity.dart';

abstract class BaseVideosLocalDataSource {
  Future<List<TopicsEntity>> getTopicsList();
}

class VideosLocalDataSource extends BaseVideosLocalDataSource {
  @override
  Future<List<TopicsEntity>> getTopicsList() async {
    var box = Hive.box<TopicsEntity>(AppVariable.kTopicsBox);
    return box.values.toList();
  }
}
