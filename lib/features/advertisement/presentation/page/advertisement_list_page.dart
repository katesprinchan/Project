import 'package:dex_course/core/domain/container/app_container.dart';
import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/core/presentation/drawer.dart';
import 'package:dex_course/features/advertisement/presentation/page/advertisement_list_vm.dart';
import 'package:dex_course/features/advertisement/presentation/widget/advertisement_app_bar_widget.dart';
import 'package:dex_course/features/advertisement/presentation/widget/advertisement_list_item_widget.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
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
  final PageController _pageController = PageController();
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

  Widget get _allTabBuilder => SafeArea(
        child: vm.advList.observer((context, value) => ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: (context, index) => AdvertisementListItemWidget(
                  advertisementListItem: vm.advList()[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: vm.advList.length,
            )),
      );
  Widget get _navigation => NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: ColorsCollection.secondaryContainer,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.assignment,
                color: ColorsCollection.onPrimaryContainer),
            icon: const Icon(Icons.assignment_outlined,
                color: ColorsCollection.outline),
            label: S.of(context).advertisement,
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.favorite,
                color: ColorsCollection.onPrimaryContainer),
            icon: const Icon(Icons.favorite_border,
                color: ColorsCollection.outline),
            label: S.of(context).favorites,
          ),
          NavigationDestination(
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.account_circle_outlined,
                  color: ColorsCollection.outline),
            ),
            selectedIcon: const Badge(
              label: Text('3'),
              child: Icon(
                Icons.account_circle,
                color: ColorsCollection.onPrimaryContainer,
              ),
            ),
            label: S.of(context).profile,
          ),
        ],
      );
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
            S.of(context).DontMisstheOpportunity,
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
        title: CustomSearchBar(
          vm: AdvertisementListViewModel(
            advertisementRepository:
                AppContainer().repositoryScope.advertisementRepository,
            filterService: AppContainer().filterScope.filterService,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _tabBarBuilder,
          Expanded(child: _tabViewBuilder),
        ],
      ),
      bottomNavigationBar: _navigation,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsCollection.primaryContainer,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: ColorsCollection.onPrimaryContainer,
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
