part of 'video_cubit.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoChangeVideoSelected extends VideoState {}

class VideoChangeBookName extends VideoState {}

class VideoChangeNumberSelected extends VideoState {}

class VideoLoadingFetchTopicsList extends VideoState {}

class VideoSuccessFetchTopicsList extends VideoState {
  final List<TopicsEntity> topics;
  VideoSuccessFetchTopicsList(this.topics);
}

class VideoErrorFetchTopicsList extends VideoState {
  final String error;
  VideoErrorFetchTopicsList(this.error);
}

class VideoLoadingFetchItemsList extends VideoState {}

class VideoSuccessFetchItemsList extends VideoState {
  final List<ItemsEntity> items;
  VideoSuccessFetchItemsList(this.items);
}

class VideoErrorFetchItemsList extends VideoState {
  final String error;
  VideoErrorFetchItemsList(this.error);
}
