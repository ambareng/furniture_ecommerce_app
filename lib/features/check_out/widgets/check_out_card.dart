import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_address_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_delivery_method_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_payment_card.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/bloc/delivery_methods_bloc.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/models/delivery_method.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

enum CheckOutCardType { address, payment, deliveryMethod }

class CheckOutCard extends StatelessWidget {
  final String title;
  final CheckOutCardType type;
  final String url;

  const CheckOutCard(
      {Key? key, required this.title, required this.type, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: lighterGray)),
            ),
            GestureDetector(
              onTap: () {
                if (type != CheckOutCardType.deliveryMethod) {
                  Navigator.pushNamed(context, url);
                  return;
                }
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Select delivery method",
                          style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  color: bgBlack,
                                  fontWeight: FontWeight.w600)),
                        ),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 235,
                          child: BlocBuilder<DeliveryMethodsBloc,
                              DeliveryMethodsState>(
                            builder: (context, state) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: state.deliveryMethods != null
                                          ? state.deliveryMethods!.length
                                          : 0,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                            title: Text(
                                              state.deliveryMethods != null
                                                  ? state
                                                      .deliveryMethods![index]
                                                      .name
                                                  : '',
                                              style: GoogleFonts.nunitoSans(
                                                  textStyle: const TextStyle(
                                                      fontSize: 14,
                                                      color: bgBlack,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            value: state.deliveryMethods != null
                                                ? state.deliveryMethods![index]
                                                : null,
                                            groupValue:
                                                state.selectedDeliveryMethod !=
                                                        null
                                                    ? state
                                                        .selectedDeliveryMethod!
                                                    : null,
                                            onChanged: (value) {
                                              BlocProvider.of<
                                                          DeliveryMethodsBloc>(
                                                      context)
                                                  .add(SelectDeliveryMethodEvent(
                                                      selectedDeliveryMethod:
                                                          value
                                                              as DeliveryMethod));
                                            });
                                      }),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Select delivery method',
                                          style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                        )),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    });
              },
              child: const Icon(
                Icons.edit_rounded,
                color: lightGray,
              ),
            )
          ],
        ),
        const Gap(10),
        if (type == CheckOutCardType.address) const CheckOutAddressCard(),
        if (type == CheckOutCardType.payment) const CheckOutPaymentCard(),
        if (type == CheckOutCardType.deliveryMethod)
          const CheckOutDeliveryMethodCard()
      ],
    );
  }
}
