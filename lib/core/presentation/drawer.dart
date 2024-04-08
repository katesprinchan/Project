import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/asset/image_collection.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  final Function() onSettingsTap;
  const MainDrawer({
    Key? key,
    required this.onSettingsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsCollection.surfaceContainerLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              ImageCollection.headline,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined,
                color: ColorsCollection.outline),
            title: Text(
              S.of(context).settings,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
            ),
            onTap: onSettingsTap,
          ),
          ListTile(
            leading:
                const Icon(Icons.info_outline, color: ColorsCollection.outline),
            title: Text(
              S.of(context).aboutApplication,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
            ),
            onTap: () {
              context.go(AppRouteList.aboutApplication);
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Divider(),
          ),
          ListTile(
            leading:
                const Icon(Icons.exit_to_app, color: ColorsCollection.outline),
            title: Text(
              S.of(context).goOut,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
