import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/features/advertisement/presentation/widget/advertisement_detailed_list_item_widget.dart';
import 'package:flutter/material.dart';

class AdvertisementDetailedPage extends StatefulWidget {
  final AdvertisementListViewModel vm;
  const AdvertisementDetailedPage({Key? key, required this.vm})
      : super(key: key);

  @override
  State<AdvertisementDetailedPage> createState() =>
      _AdvertisementDetailedPageState();
}

class _AdvertisementDetailedPageState extends State<AdvertisementDetailedPage>
    with SingleTickerProviderStateMixin {
  AdvertisementListViewModel get vm => widget.vm;

  Widget get _advertisementBuilder {
    vm.getAdvertisementPage(0);

    return SafeArea(
      child: vm.advList.observer((context, value) => ListView.separated(
            itemBuilder: (context, index) {
              if (index == 0) {
                return ListTile(
                  title: AdvertisementDetailedListItemWidget(
                    advertisementListItem: vm.advList()[index],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemCount: 1,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {
              // Действия при нажатии на иконку сердца
            },
          ),
        ],
      ),
      body: _advertisementBuilder,
    );
  }
}
