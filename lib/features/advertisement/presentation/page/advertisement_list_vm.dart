import 'package:dex_course/core/domain/use_case_result/use_case_result.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_filter.dart';
import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:dex_course/features/advertisement/domain/repository/advertisement_repository.dart';
import 'package:dex_course/features/filter/domain/service/filter_service.dart';
import 'package:dex_course/features/filter/presentation/filter_modal_bs.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AdvertisementListViewModel {
  final AdvertisementRepository _advertisementRepository;
  final Rv<int> currentIndex = 0.rv;
  final advList = <AdvertisementListItem>[].rv;
  final FilterService _filterService;
  late TabController tabController;

  AdvertisementListViewModel({
    required AdvertisementRepository advertisementRepository,
    required FilterService filterService,
  })  : _advertisementRepository = advertisementRepository,
        _filterService = filterService;

  void init({
    required final TabController tabController,
  }) {
    this.tabController = tabController;
  }

  void dispose() {}

  void onFilterTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          FilterModalBottomSheet(filterService: _filterService),
      showDragHandle: true,
    );
  }

  void onTabTapped(int index) {
    currentIndex.value = index;
  }

  Future<void> getAdvertisementPage(final int page) async {
    final result = await _advertisementRepository.getList(
      AdvertisementListFilter(
        availableLocalityList: [],
        page: page,
        limit: 10,
      ),
    );

    switch (result) {
      case GoodUseCaseResult<List<AdvertisementListItem>>(:final data):
        advList.addAll(data);
        break;
      case BadUseCaseResult<List<AdvertisementListItem>>():
        // TODO отобразить ошибку
        print('Ошибка при загрузке списка объявлений');
        break;
    }
  }
}
