import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videos_lists/Features/Videos_lists/domain/usecase/get_list_topics_usecase.dart';

import '../../../domain/entites/items/items_entity.dart';
import '../../../domain/entites/topics/topics_entity.dart';
import '../../../domain/usecase/get_list_items_usecase.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(this.getListTopicsUseCase, this.getListItemsUseCase)
      : super(VideoInitial());

  static VideoCubit get(context) => BlocProvider.of(context);

  int videoSelected = 0;

  void changeVideoSelected({required int index}) {
    videoSelected = index;
    emit(VideoChangeVideoSelected());
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

  List<ItemsEntity>? itemsData;
  final GetListItemsUseCase getListItemsUseCase;

  Future<void> fetchItemsList({required int id}) async {
    emit(VideoLoadingFetchItemsList());
    itemsData = [];
    var result = await getListItemsUseCase.execute(id);
    result.fold((failure) {
      emit(VideoErrorFetchItemsList(failure.message));
    }, (items) {
      itemsData = items;
      emit(VideoSuccessFetchItemsList(items));
    });
  }
}
