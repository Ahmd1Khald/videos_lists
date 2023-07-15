import 'package:videos_lists/Core/helpers/dio_helper.dart';
import 'package:videos_lists/Core/utils/constance/const_api.dart';
import 'package:videos_lists/Features/Videos_lists/data/model/topics_model.dart';

import '../../../../Core/error/exceptions.dart';

abstract class BaseVideosRemoteDataSource {
  Future<List<TopicsModel>> getTopicsList();
}

class VideosRemoteDataSource extends BaseVideosRemoteDataSource {
  @override
  Future<List<TopicsModel>> getTopicsList() async {
    final response =
        await DioHelper.getData(endPoint: ApiConstant.getTopicsListEndPoint);
    if (response.statusCode == 200) {
      return List<TopicsModel>.from(
          (response.data as List).map((e) => TopicsModel.fromJson(e)));
    } else {
      throw const ServerException(errorMessage: 'Error while get topics list');
    }
  }
}
