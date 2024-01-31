// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:trade/config/app_color.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/models/trade.dart';

class TradeCard extends StatelessWidget {
  final Trade trade;
  const TradeCard({
    Key? key,
    required this.trade,
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
            key: 'Current Price',
            value: trade.currentPrice.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Comment',
            value: trade.comment.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'digits',
            value: trade.digit.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Open Price',
            value: trade.openPrice.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Profit',
            value: trade.profit.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'SL',
            value: trade.sl.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Swaps',
            value: trade.swaps.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Symbol',
            value: trade.symbol,
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'TP',
            value: trade.tp.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Ticket',
            value: trade.ticket.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Type',
            value: trade.type.toString(),
          ),
          Gap(8.h),
          _buildTradeInfoRow(
            context: context,
            key: 'Volume',
            value: trade.volume.toString(),
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
