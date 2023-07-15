import 'package:videos_lists/Features/Videos_lists/domain/entites/topics_entity.dart';

class TopicsModel extends TopicsEntity {
  const TopicsModel({
    required super.id,
    required super.itemCount,
    required super.mediaPath,
    required super.title,
  });

  factory TopicsModel.fromJson(Map<String, dynamic> json) => TopicsModel(
        id: json['id'],
        title: json['title'],
        itemCount: json['itemCount'],
        mediaPath: json['mediaPath'],
      );
}
