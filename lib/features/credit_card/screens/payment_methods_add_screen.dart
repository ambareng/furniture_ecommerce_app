import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/core/widgets/settings_input_error.dart';
import 'package:furniture_ecommerce_app/core/widgets/settings_input_field.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:fxendit/fxendit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsAddScreen extends StatefulHookWidget {
  const PaymentMethodsAddScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsAddScreen> createState() =>
      _PaymentMethodsAddScreenState();
}

class _PaymentMethodsAddScreenState extends State<PaymentMethodsAddScreen> {
  @override
  Widget build(BuildContext context) {
    final cardHolderNameController = useTextEditingController();
    final cardNumberController = useTextEditingController();
    final cvvController = useTextEditingController();
    final expiryDateController = useTextEditingController();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddNewCardFloatingButton(
        cardHolderNameController: cardHolderNameController,
        cardNumberController: cardNumberController,
        cvvController: cvvController,
        expiryDateController: expiryDateController,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(60),
              const TopBar(
                bottomHeader: 'Add payment method',
                leftIcon: BackIconButton(),
              ),
              const Gap(25),
              BlocBuilder<CreditCardBloc, CreditCardState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SettingsInputField(
                          controller: cardHolderNameController,
                          label: 'Card holder name',
                          placeholder: 'Ex. John Doe'),
                      if (state.errors != null &&
                          state.errors!.isNotEmpty &&
                          state.errors!.containsKey('holder_name'))
                        SettingsInputError(
                          errorList: state.errors?['holder_name'] as List,
                        ),
                      const Gap(25),
                      SettingsInputField(
                          controller: cardNumberController,
                          label: 'Card number',
                          placeholder: 'Ex. **** **** **** 1234'),
                      if (state.errors != null &&
                          state.errors!.isNotEmpty &&
                          state.errors!.containsKey('masked_number'))
                        SettingsInputError(
                          errorList: state.errors?['masked_number'] as List,
                        ),
                      const Gap(25),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SettingsInputField(
                                    controller: cvvController,
                                    label: 'CVV',
                                    placeholder: 'Ex. 123'),
                                if (state.errors != null &&
                                    state.errors!.isNotEmpty &&
                                    state.errors!.containsKey('cvv'))
                                  SettingsInputError(
                                    errorList: state.errors?['cvv'] as List,
                                  ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Column(
                              children: [
                                SettingsInputField(
                                    controller: expiryDateController,
                                    label: 'Expiration date',
                                    placeholder: 'Ex 03/22'),
                                if (state.errors != null &&
                                    state.errors!.isNotEmpty &&
                                    state.errors!.containsKey('expiry_date'))
                                  SettingsInputError(
                                    errorList:
                                        state.errors?['expiry_date'] as List,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddNewCardFloatingButton extends StatelessWidget {
  final TextEditingController cardHolderNameController;
  final TextEditingController cardNumberController;
  final TextEditingController cvvController;
  final TextEditingController expiryDateController;

  const AddNewCardFloatingButton({
    Key? key,
    required this.cardHolderNameController,
    required this.cardNumberController,
    required this.cvvController,
    required this.expiryDateController,
  }) : super(key: key);

  Future<TokenResult?> xenditTokenize(
      {required String number,
      required String cvv,
      required String expMonth,
      required String expYear}) async {
    String? xenditPublicKey = dotenv.env["XENDIT_PUBLIC_API_KEY"];

    if (xenditPublicKey != null) {
      Xendit xendit = Xendit(xenditPublicKey);

      XCard card = XCard(
        creditCardNumber: number,
        creditCardCVN: cvv,
        expirationMonth: expMonth,
        expirationYear: expYear,
      );

      TokenResult result = await xendit.createMultipleUseToken(card);

      if (result.isSuccess) {
        return result;
      }
    }
    return null;
  }

  void saveCreditCard(
      {required Map<String, dynamic> creditCardPayload,
      required BuildContext context}) {
    BlocProvider.of<CreditCardBloc>(context)
        .add(SaveCreditCardEvent(creditCardPayload: creditCardPayload));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditCardBloc, CreditCardState>(
      listener: (context, state) {
        if (state.status == CreditCardStatus.saveSuccess) {
          Fluttertoast.showToast(
              backgroundColor: bgBlack,
              msg: 'Credit card added succesfully!',
              gravity: ToastGravity.TOP);
          Navigator.popAndPushNamed(context, '/payment_methods');
        }
      },
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: bgBlack,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () async {
              final Map<String, dynamic> errors = {};
              if (cardHolderNameController.text.isEmpty) {
                errors['holder_name'] = ['Holder name must not be empty!'];
              }
              if (cardNumberController.text.isEmpty) {
                errors['masked_number'] = ['Number must not be empty!'];
              } else {
                final cleanedCardNumber =
                    CardValidator.cleanCardNumber(cardNumberController.text);
                if (!CardValidator.isCardNumberValid(cleanedCardNumber)) {
                  errors['masked_number'] = ['Invalid number!'];
                }
              }
              if (cvvController.text.isEmpty) {
                errors['cvv'] = ['CVV must not be empty!'];
              } else {
                final cleanedCVV = CardValidator.cleanCvn(cvvController.text);
                if (!CardValidator.isCvnValid(cleanedCVV)) {
                  errors['cvv'] = ['Invalid CVV!'];
                }
              }
              if (expiryDateController.text.isEmpty) {
                errors['expiry_date'] = ['Expiry date must not be empty!'];
              } else {
                List<String> expiryMonthYear =
                    expiryDateController.text.split('/');
                if (expiryMonthYear.length != 2) {
                  errors['expiry_date'] = ['Invalid expiry date!'];
                } else if (!CardValidator.isExpiryValid(
                    expiryMonthYear[0].replaceAll(RegExp(r'^0+(?=.)'), ''),
                    '20${expiryMonthYear[1]}')) {
                  errors['expiry_date'] = ['Invalid expiry date!'];
                }
              }
              if (errors.isNotEmpty) {
                BlocProvider.of<CreditCardBloc>(context)
                    .add(ErrorCreditCardEvent(errors: errors));
              } else {
                List<String> expiryMonthYear =
                    expiryDateController.text.split('/');
                final TokenResult? result = await xenditTokenize(
                    number: CardValidator.cleanCardNumber(
                        cardNumberController.text),
                    cvv: CardValidator.cleanCvn(cvvController.text),
                    expMonth: expiryMonthYear[0],
                    expYear: '20${expiryMonthYear[1]}');
                if (result != null) {
                  final Map<String, dynamic> creditCardPayload = {
                    "token": result.token?.id,
                    "masked_number": result.token?.maskedCardNumber,
                    "expiry_date":
                        '20${expiryMonthYear[1]}-${expiryMonthYear[0]}-01',
                    "cvv": CardValidator.cleanCvn(cvvController.text),
                    "holder_name": cardHolderNameController.text,
                    "brand": result.token?.cardInfo.brand
                  };
                  saveCreditCard(
                      creditCardPayload: creditCardPayload, context: context);
                }
              }
            },
            child: Text(
              'ADD NEW CARD',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
            )),
      ),
    );
  }
}
