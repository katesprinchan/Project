import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/asset/image_collection.dart';
import 'package:dex_course/core/presentation/button/app_bar_action_button.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Widget _imageBuilder(BuildContext context) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ImageCollection.thumbnail),
          ),
          Positioned(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: ColorsCollection.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              ),
            ),
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
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text('Имя'),
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurfaceVariant,
                    ),
                hintText: 'Георгий',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsCollection.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: lastNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: const Text('Фамилия'),
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurfaceVariant,
                    ),
                hintText: 'Васильков',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsCollection.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: const Text('E-mail'),
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurfaceVariant,
                    ),
                hintText: 'g.vasilkov@yandex.ru',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsCollection.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                label: const Text('Номер'),
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurfaceVariant,
                    ),
                hintText: '+ 373 777 2 54 97',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorsCollection.outline,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
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
          S.of(context).editingProfile,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorsCollection.onSurface),
        ),
        actions: [
          AppBarActionButton(
            onTap: () {},
            child: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _imageBuilder(context),
          const SizedBox(height: 16),
          _contentBuilder(context)
        ],
      ),
    );
  }
}
