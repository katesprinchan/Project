import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/asset/image_collection.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/core/presentation/drawer.dart';
import 'package:dex_course/features/profile/presentation/page/profile_vm.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  final ProfileViewModel vm;
  const ProfilePage({super.key, required this.vm});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  ProfileViewModel get vm => widget.vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).profile,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorsCollection.onSurface),
        ),
        actions: [
          AppBarActionButton(
            onTap: () => {context.go(AppRouteList.editingProfilePage)},
            child: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      drawer: MainDrawer(onSettingsTap: () {
        widget.vm.onSettingsTap(context);
      }),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _titleBuilder(context),
          const SizedBox(height: 16),
          _contentBuilder(context)
        ],
      ),
    );
  }

  Widget _titleBuilder(BuildContext context) => Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(ImageCollection.thumbnail),
            ),
            const SizedBox(height: 8),
            Text(
              'Георгий Васильков',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ColorsCollection.onSurface),
            ),
          ],
        ),
      );

  Widget _contentBuilder(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ).copyWith(top: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'E-mail',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ColorsCollection.onSurfaceVariant),
            ),
            Text(
              'g.vasilkov@yandex.ru',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorsCollection.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              'Телефон',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ColorsCollection.onSurfaceVariant),
            ),
            Text(
              '+ 373 777 2 54 97',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ColorsCollection.onSurface),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
}
