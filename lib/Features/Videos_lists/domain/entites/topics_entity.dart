import 'package:equatable/equatable.dart';

class TopicsEntity extends Equatable {
  final int itemCount;
  final int id;
  final String title;
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
