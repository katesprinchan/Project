import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final AdvertisementListViewModel vm;
  const CustomSearchBar({
    super.key,
    required this.vm,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar>
    with SingleTickerProviderStateMixin {
  AdvertisementListViewModel get vm => widget.vm;
  void openDrawer() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: S.of(context).searchForAdvertisement,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.outline,
                    ),
                fillColor: ColorsCollection.surfaceContainerLow,
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                // prefixIcon: IconButton(
                //   icon: const Icon(Icons.menu),
                //   onPressed: openDrawer,
                // ),
                // prefixIconColor: ColorsCollection.outline,
              ),
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsCollection.surfaceContainerLow,
            ),
            child: AppBarActionButton(
              onTap: () => vm.onFilterTap(context),
              child: const Icon(Icons.filter_alt_outlined,
                  color: ColorsCollection.outline),
            ),
          ),
        ],
      ),
    );
  }
}
