import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/features/locality/domain/entity/locality.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';

class AdvertisementAddPage extends StatefulWidget {
  const AdvertisementAddPage({super.key});

  @override
  State<AdvertisementAddPage> createState() => _AdvertisementAddPageState();
}

class _AdvertisementAddPageState extends State<AdvertisementAddPage> {
  LocalityList? dropdownValue = LocalityList.tiraspol;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: S.of(context).name,
                hintStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: ColorsCollection.onSurface,
                    ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorsCollection.onSurface,
                  ),
            ),
            DropdownButton<LocalityList>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down,
                  color: ColorsCollection.onSurfaceVariant),
              style: const TextStyle(color: ColorsCollection.onSurface),
              underline: Container(),
              dropdownColor: ColorsCollection.surfaceContainer,
              onChanged: (LocalityList? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: LocalityList.values
                  .map<DropdownMenuItem<LocalityList>>((LocalityList value) {
                return DropdownMenuItem<LocalityList>(
                  value: value,
                  child: Text(value.name(context)),
                );
              }).toList(),
            ),
            TextField(
              controller: _descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: S.of(context).description,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsCollection.onSurface,
                    ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurface,
                  ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        color: ColorsCollection.onSurface,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_outlined,
                        color: ColorsCollection.onSurface,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: ColorsCollection.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
