import '../../domain/entites/items/items_entity.dart';

class ItemsModel extends ItemsEntity {
  const ItemsModel({
    required super.id,
    required super.videoUrl,
    required super.mediaPath,
    required super.title,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) => ItemsModel(
        id: json['id'],
        title: json['title'],
        videoUrl: json['videoUrl'],
        mediaPath: json['mediaPath'],
      );
}
