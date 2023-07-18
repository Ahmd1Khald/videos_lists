import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videos_lists/Features/Videos_lists/domain/usecase/get_list_topics_usecase.dart';

import '../../../domain/entites/topics/topics_entity.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.getListTopicsUseCase) : super(VideoInitial());

  static VideoCubit get(context) => BlocProvider.of(context);

  int categorySelected = 0;

  void changeCategory({required int index}) {
    categorySelected = index;

    emit(VideoChangeCategory());
  }

  String bookName = 'Book Name';

  void changeBookName({required String name}) {
    bookName = name;

    emit(VideoChangeBookName());
  }

  int numberSelected = 0;

  void changeNumberSelected({required int index}) {
    numberSelected = index;

    emit(VideoChangeNumberSelected());
  }

  List<TopicsEntity>? topicsData;
  final GetListTopicsUseCase getListTopicsUseCase;

  Future<void> fetchTopicsList() async {
    emit(VideoLoadingFetchTopicsList());
    var result = await getListTopicsUseCase.execute();
    result.fold((failure) {
      emit(VideoErrorFetchTopicsList(failure.message));
    }, (topics) {
      topicsData = topics;
      emit(VideoSuccessFetchTopicsList(topics));
    });
  }
}
