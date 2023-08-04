import 'package:dartz/dartz.dart';

import '../../../../Core/error/failure.dart';
import '../../../../Core/services/use_cases.dart';
import '../entites/items/items_entity.dart';
import '../repository/base_videos_repository.dart';

class GetListItemsUseCase extends UseCase<List<ItemsEntity>, int> {
  final BaseVideosRepository baseVideosRepository;

  GetListItemsUseCase(this.baseVideosRepository);

  @override
  Future<Either<Failure, List<ItemsEntity>>> execute(int param) async {
    return await baseVideosRepository.fetchListItems(id: param);
  }
}
