import 'package:hive/hive.dart';
import 'package:videos_lists/Core/utils/constance/variables.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics/topics_entity.dart';

import '../../domain/entites/items/items_entity.dart';

abstract class BaseVideosLocalDataSource {
  Future<List<TopicsEntity>> getTopicsList();
  Future<List<ItemsEntity>> getItemsList();
}

class VideosLocalDataSource extends BaseVideosLocalDataSource {
  @override
  Future<List<TopicsEntity>> getTopicsList() async {
    var box = Hive.box<TopicsEntity>(kTopicsBox);
    return box.values.toList();
  }

  @override
  Future<List<ItemsEntity>> getItemsList() async {
    var box = Hive.box<ItemsEntity>(kItemsBox);
    return box.values.toList();
  }
}
