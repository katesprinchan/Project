import 'package:dex_course/features/locality/domain/entity/locality.dart';

class AdvertisementListItem {
  final String id;
  final String image;
  final String title;
  final String description;
  final DateTime creationDate;
  final double cost;
  final String owner;
  final String registrationDate;
  final String email;
  final String number;
  final Locality locality;
  bool isFavorite;

  AdvertisementListItem({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.cost,
    required this.owner,
    required this.registrationDate,
    required this.email,
    required this.number,
    required this.locality,
    required this.isFavorite,
  });
}

class AdvertisementCreationEntity {
  final String title;
  final String description;
  final double cost;
  final Locality locality;
  bool isFavorite;
  AdvertisementCreationEntity({
    required this.title,
    required this.description,
    required this.cost,
    required this.locality,
    required this.isFavorite,
  });
}
