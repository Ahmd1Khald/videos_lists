import 'package:flutter_bloc/flutter_bloc.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

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
}
