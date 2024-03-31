import 'package:dex_course/features/locality/domain/entity/locality.dart';

class AdvertisementListFilter {
  final List<Locality> availableLocalityList;

  final int page;
  final int limit;

  const AdvertisementListFilter({
    required this.availableLocalityList,
    required this.page,
    required this.limit,
  }) : assert(page >= 0 && limit > 0);
}
