import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/widgets/settings_input_field.dart';
import 'package:gap/gap.dart';

class AddressAddFields extends StatefulHookWidget {
  const AddressAddFields({Key? key}) : super(key: key);

  @override
  State<AddressAddFields> createState() => _AddressAddFieldsState();
}

class _AddressAddFieldsState extends State<AddressAddFields> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController addressLabelController =
        useTextEditingController();
    final TextEditingController addressController = useTextEditingController();
    final TextEditingController postalCodeController =
        useTextEditingController();

    String? countryValue = "";
    String? stateValue = "";
    String? cityValue = "";
    String? address = "";

    return Column(
      children: [
        SettingsInputField(
            controller: addressLabelController,
            label: 'Label',
            placeholder: 'Ex: Home'),
        const Gap(25),
        SettingsInputField(
            controller: addressController,
            label: 'Address',
            placeholder: 'Ex: 25 Robert Latouche Street'),
        const Gap(25),
        SettingsInputField(
            controller: postalCodeController,
            label: 'Zipcode (Postal Code)',
            placeholder: 'Ex: 2906'),
        CSCPicker(
          layout: Layout.vertical,
          onCountryChanged: (value) {
            setState(() {
              countryValue = value;
            });
          },
          onStateChanged: (value) {
            setState(() {
              stateValue = value;
            });
          },
          onCityChanged: (value) {
            setState(() {
              cityValue = value;
            });
          },
        ),
      ],
    );
  }
}
