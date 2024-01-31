import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade/config/app_color.dart';
import 'package:trade/config/app_text_style.dart';
import 'package:trade/controllers/trade_controller.dart';
import 'package:trade/models/trade.dart';
import 'package:trade/views/trade/components/trade_card.dart';

class TradeLayout extends StatelessWidget {
  const TradeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trade List'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.violetColor,
          actions: [
            Consumer(builder: (context, ref, _) {
              final asyncValue = ref.watch(tradeControllerProvider);

              return asyncValue.maybeWhen(
                  data: (trades) => Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: FutureBuilder(
                          future: compute(getTotalProfit, trades),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              double totalProfit = snapshot.data as double;
                              return Text(
                                "Prf:${totalProfit.toStringAsFixed(2)}",
                                style: AppTextStyle(context)
                                    .bodyTextSmall
                                    .copyWith(
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              );
                            } else {
                              return Text(
                                'Loading...',
                                style: AppTextStyle(context)
                                    .subTitle
                                    .copyWith(color: AppColor.whiteColor),
                              );
                            }
                          },
                        ),
                      ),
                  orElse: () => const SizedBox.shrink());
            })
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer(builder: (context, ref, _) {
          final asyncValue = ref.watch(tradeControllerProvider);
          return asyncValue.when(
            data: (tradeList) => RefreshIndicator(
              onRefresh: () async => ref.refresh(tradeControllerProvider),
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: tradeList.length,
                  itemBuilder: (context, index) {
                    final Trade trade = tradeList[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      child: TradeCard(trade: trade),
                    );
                  }),
            ),
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }),
      ),
    );
  }

  Future<double> getTotalProfit(List<Trade> trades) async {
    double totalProfit = 0;
    for (Trade trade in trades) {
      totalProfit += trade.profit;
    }
    return totalProfit;
  }
}
