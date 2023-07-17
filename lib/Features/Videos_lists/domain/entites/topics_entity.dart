import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'topics_entity.g.dart';

@HiveType(typeId: 0)
class TopicsEntity extends Equatable {
  @HiveField(0)
  final int itemCount;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String mediaPath;

  const TopicsEntity({
    required this.id,
    required this.title,
    required this.itemCount,
    required this.mediaPath,
  });

  @override
  List<Object?> get props => [id, title, mediaPath, itemCount];
}
