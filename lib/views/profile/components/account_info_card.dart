// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:trade/config/app_color.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/models/account_info.dart';

class AccountInfoCard extends StatelessWidget {
  final AccountInfo accountInfo;
  const AccountInfoCard({
    Key? key,
    required this.accountInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColor.offWhiteColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _buildTradeInfoRow(
            context: context,
            key: 'Name',
            value: accountInfo.name,
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Address',
            value: accountInfo.address,
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'City',
            value: accountInfo.city,
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Balance',
            value: accountInfo.balance.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Current Trades Count',
            value: accountInfo.currentTradesCount.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Current Trades Volume',
            value: accountInfo.currentTradesVolume.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Equity',
            value: accountInfo.equity.toStringAsFixed(2),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Free Margin',
            value: accountInfo.freeMargin.toStringAsFixed(2),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Total Trades Count',
            value: accountInfo.totalTradesCount.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Total Trades Volume',
            value: accountInfo.totalTradesVolume.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Verification Level',
            value: accountInfo.verificationLevel.toString(),
          ),
          Gap(8.h),
        ],
      ),
    );
  }

  Widget _buildTradeInfoRow({
    required BuildContext context,
    required String key,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: AppTextStyle(context)
              .bodyTextSmall
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: AppTextStyle(context)
              .bodyText
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
