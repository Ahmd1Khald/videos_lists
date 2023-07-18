import 'package:videos_lists/Core/helpers/dio_helper.dart';
import 'package:videos_lists/Core/utils/constance/const_api.dart';
import 'package:videos_lists/Features/Videos_lists/data/model/topics_model.dart';
import 'package:videos_lists/Features/Videos_lists/domain/entites/topics/topics_entity.dart';

import '../../../../Core/error/exceptions.dart';
import '../../../../Core/utils/constance/variables.dart';
import '../../../../Core/utils/functions/functions.dart';

abstract class BaseVideosRemoteDataSource {
  Future<List<TopicsEntity>> getTopicsList();
}

class VideosRemoteDataSource extends BaseVideosRemoteDataSource {
  @override
  Future<List<TopicsEntity>> getTopicsList() async {
    final response = await DioHelper.getData(
      endPoint: ApiConstant.getTopicsListEndPoint,
      token: ApiConstant.token,
      query: {ApiConstant.pagination: '1'},
    );
    if (response.statusCode == 200) {
      //print(response.data);
      final jsonData = response.data as List<dynamic>;
      List<TopicsEntity> topics =
          jsonData.map((e) => TopicsModel.fromJson(e)).toList();

      await saveData(data: topics, boxName: kTopicsBox);

      return topics;
    } else {
      print('error +++++++++++++++++++');
      throw const ServerException(errorMessage: 'Error while get topics list');
    }
  }
}
