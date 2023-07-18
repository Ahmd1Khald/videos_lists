import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'items_entity.g.dart';

@HiveType(typeId: 1)
class ItemsEntity extends Equatable {
  @HiveField(0)
  final String videoUrl;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String mediaPath;

  const ItemsEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.mediaPath,
  });

  @override
  List<Object?> get props => [id, title, mediaPath, videoUrl];
}
