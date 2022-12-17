import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/address/bloc/address_bloc.dart';
import 'package:furniture_ecommerce_app/features/address/widgets/address_add_fields.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressAddScreen extends HookWidget {
  final bool isEdit;

  const AddressAddScreen({Key? key, this.isEdit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressLabelController =
        useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    final TextEditingController postalCodeController =
        useTextEditingController();
    final TextEditingController countryController = useTextEditingController();
    final TextEditingController cityController = useTextEditingController();
    final TextEditingController regionController = useTextEditingController();

    return Scaffold(
      floatingActionButton: AddAddressFloatingButton(
        addressController: addressController,
        addressLabelController: addressLabelController,
        postalCodeController: postalCodeController,
        countryController: countryController,
        cityController: cityController,
        regionController: regionController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state.status == AddressStatus.addError &&
              state.errors != null &&
              state.errors?['non_field_errors'] != null) {
            Fluttertoast.showToast(
                backgroundColor: Colors.red[300],
                msg: state.errors!['non_field_errors'],
                gravity: ToastGravity.TOP);
          } else if (state.status == AddressStatus.addSuccess) {
            Fluttertoast.showToast(
                backgroundColor: bgBlack,
                msg: 'Address ${isEdit ? "edited" : "added"} succesfully!',
                gravity: ToastGravity.TOP);
            Navigator.pushNamed(context, '/addresses');
          }
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(60),
                TopBar(
                  bottomHeader: '${isEdit ? "Edit" : "Add"} shipping address',
                  leftIcon: const BackIconButton(),
                ),
                const Gap(25),
                AddressAddFields(
                    addressController: addressController,
                    addressLabelController: addressLabelController,
                    postalCodeController: postalCodeController,
                    countryController: countryController,
                    cityController: cityController,
                    regionController: regionController,
                    isEdit: isEdit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddAddressFloatingButton extends StatelessWidget {
  final TextEditingController addressLabelController;
  final TextEditingController addressController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController regionController;

  const AddAddressFloatingButton(
      {Key? key,
      required this.addressLabelController,
      required this.addressController,
      required this.postalCodeController,
      required this.countryController,
      required this.cityController,
      required this.regionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: bgBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                if (state.toEditAddress != null) {
                  final Map<String, dynamic> editAddressPayload = {
                    'label': addressLabelController.text,
                    'full_address': addressController.text,
                    'postal_code': postalCodeController.text,
                    'country': countryController.text,
                    'city': cityController.text,
                    'region': regionController.text
                  };
                  BlocProvider.of<AddressBloc>(context).add(EditAddressEvent(
                      editAddressPayload: editAddressPayload,
                      addressId: state.toEditAddress!.id));
                  return;
                }
                final Map<String, dynamic> addAddressPayload = {
                  'label': addressLabelController.text,
                  'full_address': addressController.text,
                  'postal_code': postalCodeController.text,
                  'country': countryController.text,
                  'city': cityController.text,
                  'region': regionController.text
                };
                BlocProvider.of<AddressBloc>(context)
                    .add(AddAddressEvent(addAddressPayload: addAddressPayload));
              },
              child: Text(
                'SAVE ADDRESS',
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white)),
              )),
        );
      },
    );
  }
}
