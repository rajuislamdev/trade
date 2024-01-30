import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade/controllers/misc/misc_provider.dart';
import 'package:trade/views/dashboard/components/app_bottom_navbar.dart';
import 'package:trade/views/profile/profile_view.dart';
import 'package:trade/views/trade/trade_view.dart';

class DashboardViewLayout extends ConsumerStatefulWidget {
  const DashboardViewLayout({super.key});

  @override
  ConsumerState<DashboardViewLayout> createState() =>
      _DashboardViewLayoutState();
}

class _DashboardViewLayoutState extends ConsumerState<DashboardViewLayout> {
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(bottomTabControllerProvider);

    return Scaffold(
      bottomNavigationBar: AppBottomNavbar(
          bottomItem: getBottomItems(context: context),
          onSelect: (index) {
            if (index != null) {
              pageController.jumpToPage(index);
            }
          }),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          ref.read(activeTabIndex.notifier).state = index;
        },
        children: const [TradeView(), ProfileView()],
      ),
    );
  }
}

List<BottomItem> getBottomItems({required BuildContext context}) {
  return [
    BottomItem(
      icon: Icons.list,
      name: 'Trade',
    ),
    BottomItem(
      icon: Icons.person,
      name: 'Profile',
    ),
  ];
}

class BottomItem {
  final IconData icon;
  final String name;
  BottomItem({
    required this.icon,
    required this.name,
  });
}
