import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/features/filter/domain/service/filter_event.dart';
import 'package:dex_course/features/filter/domain/service/filter_service.dart';
import 'package:dex_course/features/locality/domain/entity/locality.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

class FilterModalBottomSheet extends StatefulWidget {
  final FilterService filterService;

  const FilterModalBottomSheet({Key? key, required this.filterService})
      : super(key: key);

  @override
  State<FilterModalBottomSheet> createState() => _FilterModalBottomSheetState();
}

class _FilterModalBottomSheetState extends State<FilterModalBottomSheet> {
  late List<bool> isCheckedList;

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(LocalityList.values.length, false);
  }

  BoxDecoration get _modalDecoration => const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        color: ColorsCollection.surfaceContainerLow,
      );

  Widget _addingCityBuilder(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          S.of(context).city,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: LocalityList.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    final locality = LocalityList.values.elementAt(index);
                    return ListTile(
                      leading: Checkbox(
                        value: isCheckedList[index],
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedList[index] = value ?? false;
                          });
                        },
                      ),
                      title: Text(locality.name(context)),
                      onTap: () {
                        print('Selected city: ${locality.name(context)}');
                      },
                    );
                  },
                );
              },
            );
          },
          child: Text(
            S.of(context).addCity,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ColorsCollection.primary,
                ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _modalHeaderBuilder(context),
          const SizedBox(height: 16),
          _addingCityBuilder(context),
          const SizedBox(height: 24),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _modalHeaderBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).filter,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextButton(
            onPressed: () {
              List<LocalityList> selectedLocalities = [];
              for (int i = 0; i < isCheckedList.length; i++) {
                if (isCheckedList[i]) {
                  selectedLocalities.add(LocalityList.values[i]);
                }
              }
              widget.filterService.add(AddCityEvent(
                  selectedLocalities.map((e) => e.name(context)).toList()));

              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).apply,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorsCollection.primary,
                  ),
            ),
          ),
        ],
      );
}
