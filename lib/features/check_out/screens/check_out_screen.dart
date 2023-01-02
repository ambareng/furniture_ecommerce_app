import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_breakdown_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_card.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/bloc/delivery_methods_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:furniture_ecommerce_app/features/my_cart/bloc/my_cart_total_bloc.dart';
import 'package:fxendit/fxendit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(60),
              const TopBar(
                bottomHeader: 'Check out',
                leftIcon: BackIconButton(),
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Shipping Address',
                type: CheckOutCardType.address,
                url: '/addresses',
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Payment',
                type: CheckOutCardType.payment,
                url: '/payment_methods',
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Delivery method',
                type: CheckOutCardType.deliveryMethod,
                url: '/addresses',
              ),
              const Gap(25),
              const CheckOutBreakdownCard(),
              const Gap(25),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: BlocBuilder<DeliveryMethodsBloc, DeliveryMethodsState>(
                  builder: (context, deliveryMethodState) {
                    return BlocBuilder<MyCartTotalBloc, MyCartTotalState>(
                      builder: (context, myCartState) {
                        return BlocBuilder<CreditCardBloc, CreditCardState>(
                          builder: (context, creditCardState) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () async {
                                  String? xenditPublicKey =
                                      dotenv.env["XENDIT_PUBLIC_API_KEY"];
                                  if (xenditPublicKey != null) {
                                    Xendit xendit = Xendit(xenditPublicKey);
                                    final result =
                                        await xendit.createAuthentication(
                                            creditCardState.defaultCreditCard !=
                                                    null
                                                ? creditCardState
                                                    .defaultCreditCard!.token
                                                : '',
                                            amount: myCartState.total != null &&
                                                    deliveryMethodState
                                                            .selectedDeliveryMethod !=
                                                        null
                                                ? myCartState.total!.round() +
                                                    deliveryMethodState
                                                        .selectedDeliveryMethod!
                                                        .price
                                                        .round()
                                                : 0);
                                    if (result.isSuccess) {
                                      debugPrint(
                                          '========================================');
                                      debugPrint(
                                          'Authentication ID: ${result.authentication!.id}');
                                      debugPrint(
                                          '========================================');
                                    } else {
                                      Fluttertoast.showToast(
                                          msg:
                                              '${result.errorCode} - ${result.errorMessage}',
                                          gravity: ToastGravity.TOP,
                                          backgroundColor: Colors.red[300]);
                                    }
                                  }
                                },
                                child: Text(
                                  'SUBMIT ORDER',
                                  style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white)),
                                ));
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
