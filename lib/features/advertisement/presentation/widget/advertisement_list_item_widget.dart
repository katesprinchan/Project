import 'package:dex_course/features/advertisement/domain/entity/advertisement_list_item.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdvertisementListItemWidget extends StatefulWidget {
  final AdvertisementListItem advertisementListItem;

  const AdvertisementListItemWidget(
      {super.key, required this.advertisementListItem});

  @override
  State<AdvertisementListItemWidget> createState() =>
      _AdvertisementListItemWidgetState();
}

class _AdvertisementListItemWidgetState
    extends State<AdvertisementListItemWidget> {
  bool isFavorite = false;

  BoxDecoration _cardDecoration(BuildContext context) => BoxDecoration(
        color: ColorsCollection.surface,
        border: Border.all(
          color: ColorsCollection.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _cardDecoration(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // _previewBuilder(context),
          _contentBuilder(context),
        ],
      ),
    );
  }

  Widget _titleBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.advertisementListItem.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: isFavorite
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
            ),
            iconSize: 24,
          ),
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
            _titleBuilder(context),
            const SizedBox(height: 16),
            Text(
              '${widget.advertisementListItem.description} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              '${widget.advertisementListItem.cost} руб.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              widget.advertisementListItem.locality.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              DateFormat('yyyy-MM-dd')
                  .format(widget.advertisementListItem.creationDate),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
}
