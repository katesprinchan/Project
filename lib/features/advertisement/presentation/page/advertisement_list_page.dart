import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/drawer.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/features/advertisement/presentation/widget/advertisement_app_bar_widget.dart';
import 'package:dex_course/features/advertisement/presentation/widget/advertisement_list_item_widget.dart';
import 'package:dex_course/routing.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AdvertisementListPage extends StatefulWidget {
  final AdvertisementListViewModel vm;
  const AdvertisementListPage({super.key, required this.vm});

  @override
  State<AdvertisementListPage> createState() => _AdvertisementListPageState();
}

class _AdvertisementListPageState extends State<AdvertisementListPage>
    with SingleTickerProviderStateMixin {
  AdvertisementListViewModel get vm => widget.vm;
  int currentPageIndex = 0;

  @override
  void initState() {
    vm.getAdvertisementPage(0);
    vm.init(tabController: TabController(length: 2, vsync: this));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AdvertisementListPage oldWidget) {
    if (oldWidget.vm != widget.vm) {
      vm.init(tabController: oldWidget.vm.tabController);
    }
    super.didUpdateWidget(oldWidget);
  }

  Widget get _tabBarBuilder => TabBar(
        controller: vm.tabController,
        tabs: [
          Tab(
            text: S.of(context).all,
          ),
          Tab(
            text: S.of(context).my,
          ),
        ],
      );

  Widget get _tabViewBuilder => TabBarView(
        controller: vm.tabController,
        children: [
          _allTabBuilder,
          _myTabBuilder(context),
        ],
      );
  Widget get _allTabBuilder {
    vm.getAdvertisementPage(0);
    return SafeArea(
      child: vm.advList.observer((context, value) => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                context.go(
                  '/advListPage/advertisementDetailedPage',
                );
              },
              title: AdvertisementListItemWidget(
                  advertisementListItem: vm.advList()[index]),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: vm.advList.length,
          )),
    );
  }

  Widget _myTabBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 125),
          const Icon(Icons.add,
              color: ColorsCollection.outlineVariant, size: 90),
          const SizedBox(height: 40),
          Text(
            S.of(context).youDontHaveAnyAdvertisementYet,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorsCollection.onSurface,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).dontMisstheOpportunity,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorsCollection.onSurfaceVariant,
                ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomSearchBar(onFilterTap: () {
          vm.onFilterTap(context);
        }),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabBarBuilder,
          Expanded(child: _tabViewBuilder),
        ],
      ),
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
