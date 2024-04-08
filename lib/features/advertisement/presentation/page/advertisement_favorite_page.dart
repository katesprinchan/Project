import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/drawer.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_favorite_vm.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdvertisementFavoritePage extends StatefulWidget {
  final AdvertisementFavoriteViewModel vm;
  const AdvertisementFavoritePage({super.key, required this.vm});

  @override
  State<AdvertisementFavoritePage> createState() =>
      _AdvertisementFavoritePageState();
}

class _AdvertisementFavoritePageState extends State<AdvertisementFavoritePage>
    with SingleTickerProviderStateMixin {
  AdvertisementFavoriteViewModel get vm => widget.vm;
  Widget _myFavoriteAdvertisement(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.favorite,
                color: ColorsCollection.outlineVariant, size: 90),
            const SizedBox(height: 40),
            Text(
              textAlign: TextAlign.center,
              S.of(context).addAdvertisementsToFavorites,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorsCollection.onSurface,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              S.of(context).youCanComeBackToThemLater,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).favorite,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorsCollection.onSurface),
        ),
      ),
      body: _myFavoriteAdvertisement(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsCollection.primaryContainer,
        onPressed: () {
          context.go(AppRouteList.advertisementAddPage);
        },
        child: const Icon(
          Icons.add,
          color: ColorsCollection.onPrimaryContainer,
        ),
      ),
      drawer: MainDrawer(onSettingsTap: () {
        vm.onSettingsTap(context);
      }),
    );
  }
}
