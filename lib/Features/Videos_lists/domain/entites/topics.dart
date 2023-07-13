import 'package:equatable/equatable.dart';

class Topics extends Equatable {
  final int itemCount;
  final int id;
  final String title;
  final String mediaPath;

  const Topics({
    required this.id,
    required this.title,
    required this.itemCount,
    required this.mediaPath,
  });

  @override
  List<Object?> get props => [id, title, mediaPath, itemCount];
}
