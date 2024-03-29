import 'package:dex_course/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_item.dart';

abstract class AdvertisementRepository {
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      AdvertisementListFilter filter);

  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advertisementCreationEntity);

  Future<UseCaseResult<void>> delete(final String id);
}
