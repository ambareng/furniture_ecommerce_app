import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CreditCardBloc>(context).add(GetAllCreditCardEvent());

    return BlocBuilder<CreditCardBloc, CreditCardState>(
      builder: (context, state) {
        if (state.status == CreditCardStatus.loading) {
          return const Center(
            child: SizedBox(
                width: 35,
                height: 35,
                child: CircularProgressIndicator(
                  color: bgBlack,
                  strokeWidth: 1.0,
                )),
          );
        }
        if (state.status == CreditCardStatus.loaded &&
            state.creditCards == null) {
          return const Center(
            child: Text(
              'No credit cards',
            ),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.creditCards!.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CreditCardWidget(
                      cardBgColor: bgBlack,
                      obscureCardNumber: false,
                      cardNumber: state.creditCards![index].masked_number,
                      expiryDate: DateFormat('MM/yy')
                          .format(state.creditCards![index].expiry_date),
                      cardHolderName: state.creditCards![index].holder_name,
                      cvvCode: state.creditCards![index].cvv,
                      showBackView: false,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                            cardType: CardType.visa,
                            cardImage: Image.asset(
                              'assets/images/credit_card_logos/visa.png',
                              width: 50,
                              height: 50,
                            )),
                        CustomCardTypeIcon(
                            cardType: CardType.mastercard,
                            cardImage: Image.asset(
                              'assets/images/credit_card_logos/mastercard.png',
                              width: 50,
                              height: 50,
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: state.creditCards![index].is_default,
                            activeColor: bgBlack,
                            onChanged: (bool? value) {
                              BlocProvider.of<CreditCardBloc>(context).add(
                                  ToggleCreditCardDefaultEvent(
                                      creditCardId:
                                          state.creditCards![index].id));
                            }),
                        Text(
                          'Use as default payment method',
                          style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: bgBlack)),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }
}
