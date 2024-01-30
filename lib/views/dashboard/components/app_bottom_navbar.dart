import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade/config/app_color.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/config/theme.dart';
import 'package:trade/controllers/misc/misc_provider.dart';
import 'package:trade/views/dashboard/layouts/dashboard_view_layout.dart';

class AppBottomNavbar extends ConsumerWidget {
  const AppBottomNavbar({
    super.key,
    required this.bottomItem,
    required this.onSelect,
  });
  final List<BottomItem> bottomItem;
  final Function(int? index) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: AppColor.violetColor,
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          bottomItem.length,
          (index) {
            return GestureDetector(
              onTap: () {
                onSelect(index);
              },
              child: Container(
                color: Colors.transparent,
                child: _buildBottomItem(
                  bottomItem: bottomItem[index],
                  index: index,
                  context: context,
                  ref: ref,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomItem({
    required BottomItem bottomItem,
    required int index,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final int selectedIndex = ref.watch(activeTabIndex);

    final isSelected = index == selectedIndex;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColor.violet100,
            )
          : null,
      width: isSelected ? 100.w : 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: 42.h,
            width: 42.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(child: Icon(bottomItem.icon)),
          ),
          if (isSelected)
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Text(
                    bottomItem.name,
                    style: AppTextStyle(context).bodyTextSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? colors(context).primaryColor
                              : colors(context).bodyTextSmallColor,
                        ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
