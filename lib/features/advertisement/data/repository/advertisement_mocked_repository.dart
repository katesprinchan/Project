import 'package:dex_course/core/domain/app_error/app_error.dart';
import 'package:dex_course/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:dex_course/features/advertisement/domain/repository/advertisement_repository.dart';
import 'package:dex_course/features/locality/domain/entity/locality.dart';

class AdvertisementMockedRepository implements AdvertisementRepository {
  final _mockedAdvertisementList = List<AdvertisementListItem>.generate(
    30,
    (index) {
      final localityCount = LocalityList.values.length;
      final locality = LocalityList.values[index % localityCount];

      return AdvertisementListItem(
        id: '$index',
        image: 'image/Media.png',
        title: 'Объявление $index',
        description: 'Описание объявления $index',
        creationDate: DateTime(2024, 1, index + 1),
        cost: index * 123,
        owner: 'Евгения Романова',
        registrationDate: 'на купи - и точка с декабря 2024',
        email: '$index@mail.ru',
        number: '+373 779 $index 35 73',
        locality: locality,
        isFavorite: false,
      );
    },
  );

  @override
  Future<UseCaseResult<List<AdvertisementListItem>>> getList(
      AdvertisementListFilter filter) async {
    try {
      final filteredList = _mockedAdvertisementList
          .where((element) {
            if (filter.availableLocalityList.isNotEmpty) {
              final localityResult =
                  filter.availableLocalityList.contains(element.locality);
              if (!localityResult) return false;
            }
            return true;
          })
          .skip(filter.page * filter.limit)
          .take(filter.limit)
          .toList();
      return UseCaseResult.good(filteredList);
    } catch (e) {
      return UseCaseResult.bad([SpecificError('getList error')]);
    }
  }

  @override
  Future<UseCaseResult<AdvertisementListItem>> add(
      AdvertisementCreationEntity advCreationEntity) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<UseCaseResult<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
