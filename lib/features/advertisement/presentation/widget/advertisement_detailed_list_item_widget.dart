import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdvertisementDetailedListItemWidget extends StatefulWidget {
  final AdvertisementListItem advertisementListItem;

  const AdvertisementDetailedListItemWidget(
      {super.key, required this.advertisementListItem});

  @override
  State<AdvertisementDetailedListItemWidget> createState() =>
      _AdvertisementDetailedListItemWidgetState();
}

class _AdvertisementDetailedListItemWidgetState
    extends State<AdvertisementDetailedListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _imageBuilder,
          const SizedBox(height: 16),
          _contentBuilder(context)
        ],
      ),
    );
  }

  Widget get _imageBuilder => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 205,
            width: 330,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                widget.advertisementListItem.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 205,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                widget.advertisementListItem.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );

  Widget _titleBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('yyyy-MM-dd')
                .format(widget.advertisementListItem.creationDate),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorsCollection.outline),
          ),
          Text(
            widget.advertisementListItem.locality.name(context),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorsCollection.outline),
          ),
        ],
      );
  Widget _ownerBuilder(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.account_circle_outlined,
                  color: ColorsCollection.primary, size: 40),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.advertisementListItem.owner,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: ColorsCollection.onSurface),
                  ),
                  Text(
                    widget.advertisementListItem.registrationDate,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ColorsCollection.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.email_outlined,
                  color: ColorsCollection.onSurfaceVariant, size: 24),
              const SizedBox(width: 16),
              Text(
                widget.advertisementListItem.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ColorsCollection.onSurface),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.phone_outlined,
                  color: ColorsCollection.onSurfaceVariant, size: 24),
              const SizedBox(width: 16),
              Text(
                widget.advertisementListItem.number,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ColorsCollection.onSurface),
              ),
            ],
          )
        ],
      );

  Widget _contentBuilder(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(top: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            _titleBuilder(context),
            const SizedBox(height: 8),
            Text(
              widget.advertisementListItem.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ColorsCollection.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.advertisementListItem.cost} руб.',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ColorsCollection.onSurface),
            ),
            const SizedBox(height: 16),
            Text(
              'Описание',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorsCollection.outline),
            ),
            const SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorsCollection.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            _ownerBuilder(context)
          ],
        ),
      );
}
