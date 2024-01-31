import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:trade/components/confirmation_dialog.dart';
import 'package:trade/config/app_color.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/controllers/misc/misc_provider.dart';
import 'package:trade/controllers/profile_controller.dart';
import 'package:trade/routes.dart';
import 'package:trade/services/hive_service_provider.dart';
import 'package:trade/utils/context_less_navigation.dart';
import 'package:trade/utils/global_functions.dart';
import 'package:trade/views/profile/components/account_info_card.dart';

class ProfileLayout extends ConsumerWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.violetColor,
          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => ConfirmationDialog(
                  title: 'Are you sure want to logout?',
                  confirmButtonText: 'Confirm',
                  onPressed: () {
                    ref.read(hiveStoreService).logout().then((success) {
                      if (success) {
                        ref.refresh(activeTabIndex);
                        GlobalFunction.showCustomSnackbar(
                            message: 'Successfully logout!', isSuccess: true);
                        context.nav.pushNamedAndRemoveUntil(
                            Routes.login, (route) => false);
                      } else {
                        GlobalFunction.showCustomSnackbar(
                            message: 'Something went wrong!', isSuccess: false);
                      }
                    });
                  },
                ),
              ),
              icon: const Icon(
                Icons.logout,
                color: AppColor.whiteColor,
              ),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(10.h),
                Consumer(builder: (context, ref, _) {
                  final asyncValue = ref.watch(accountInfoControllerProvider);
                  return asyncValue.when(
                    data: (accountInfo) =>
                        AccountInfoCard(accountInfo: accountInfo),
                    error: (error, stracTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => Container(
                      decoration: BoxDecoration(
                        color: AppColor.offWhiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      height: 260.h,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }),
                Gap(20.h),
                Consumer(builder: (context, ref, _) {
                  final asyncValue =
                      ref.watch(lastFourNumberControllerProvider);
                  return asyncValue.when(
                    data: (data) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Last Four Number:'),
                        Gap(8.w),
                        Text(
                          data.toString(),
                          style: AppTextStyle(context).subTitle.copyWith(
                                color: AppColor.violetColor,
                              ),
                        ),
                      ],
                    ),
                    error: (error, stracTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => Container(
                      decoration: BoxDecoration(
                        color: AppColor.offWhiteColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      height: 260.h,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
