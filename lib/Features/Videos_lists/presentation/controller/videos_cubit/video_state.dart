part of 'video_cubit.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoChangeCategory extends VideoState {}

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
