import 'package:dex_course/features/locality/domain/entity/locality.dart';

class AdvertisementListItem {
  final String id;
  final String image;
  final String title;
  final String description;
  final DateTime creationDate;
  final double cost;
  final Locality locality;

  const AdvertisementListItem({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.cost,
    required this.locality,
  });
}

class AdvertisementCreationEntity {
  final String title;
  final String description;
  final double cost;
  final Locality locality;
  AdvertisementCreationEntity({
    required this.title,
    required this.description,
    required this.cost,
    required this.locality,
  });
}
