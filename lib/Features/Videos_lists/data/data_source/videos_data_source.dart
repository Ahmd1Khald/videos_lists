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
    final response = await DioHelper.getData(
      endPoint: ApiConstant.getTopicsListEndPoint,
      token: ApiConstant.token,
      query: {ApiConstant.pagination: '1'},
    );
    if (response.statusCode == 200) {
      //print(response.data);
      final jsonData = response.data as List<dynamic>;
      return jsonData.map((e) => TopicsModel.fromJson(e)).toList();
    } else {
      print('error +++++++++++++++++++');
      throw const ServerException(errorMessage: 'Error while get topics list');
    }
  }
}
