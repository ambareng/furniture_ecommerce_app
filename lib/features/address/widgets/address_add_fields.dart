import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/widgets/settings_input_error.dart';
import 'package:furniture_ecommerce_app/core/widgets/settings_input_field.dart';
import 'package:furniture_ecommerce_app/features/address/bloc/address_bloc.dart';
import 'package:gap/gap.dart';

class AddressAddFields extends StatefulHookWidget {
  final TextEditingController addressLabelController;
  final TextEditingController addressController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;
  final TextEditingController cityController;
  final TextEditingController regionController;
  final bool isEdit;

  const AddressAddFields(
      {Key? key,
      required this.addressLabelController,
      required this.addressController,
      required this.postalCodeController,
      required this.countryController,
      required this.cityController,
      required this.regionController,
      this.isEdit = false})
      : super(key: key);

  @override
  State<AddressAddFields> createState() => _AddressAddFieldsState();
}

class _AddressAddFieldsState extends State<AddressAddFields> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.status == AddressStatus.loaded &&
            state.toEditAddress != null) {
          widget.addressController.text = state.toEditAddress != null
              ? state.toEditAddress!.full_address
              : '';
          widget.addressLabelController.text =
              state.toEditAddress != null ? state.toEditAddress!.label : '';
          widget.postalCodeController.text = state.toEditAddress != null
              ? state.toEditAddress!.postal_code
              : '';
          widget.countryController.text =
              state.toEditAddress != null ? state.toEditAddress!.country : '';
          widget.cityController.text =
              state.toEditAddress != null ? state.toEditAddress!.city : '';
          widget.regionController.text =
              state.toEditAddress != null ? state.toEditAddress!.region : '';
        }
      },
      child: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsInputField(
                  controller: widget.addressLabelController,
                  label: 'Label',
                  placeholder: 'Ex: Home'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['label'] != null)
                SettingsInputError(
                  errorList: state.errors?['label'] as List,
                ),
              const Gap(25),
              SettingsInputField(
                  controller: widget.addressController,
                  label: 'Address',
                  placeholder: 'Ex: 25 Robert Latouche Street'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['full_address'] != null)
                SettingsInputError(
                  errorList: state.errors?['full_address'] as List,
                ),
              const Gap(25),
              SettingsInputField(
                  controller: widget.postalCodeController,
                  label: 'Zipcode (Postal Code)',
                  placeholder: 'Ex: 2906'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['postal_code'] != null)
                SettingsInputError(
                  errorList: state.errors?['postal_code'] as List,
                ),
              const Gap(25),
              SettingsInputField(
                  controller: widget.countryController,
                  label: 'Country',
                  placeholder: 'Ex: Philippines'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['country'] != null)
                SettingsInputError(
                  errorList: state.errors?['country'] as List,
                ),
              const Gap(25),
              SettingsInputField(
                  controller: widget.regionController,
                  label: 'Region',
                  placeholder: 'Ex: Ilocos Region'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['region'] != null)
                SettingsInputError(
                  errorList: state.errors?['region'] as List,
                ),
              const Gap(25),
              SettingsInputField(
                  controller: widget.cityController,
                  label: 'City',
                  placeholder: 'Ex: Batac City'),
              if (state.status == AddressStatus.addError &&
                  state.errors?['city'] != null)
                SettingsInputError(
                  errorList: state.errors?['city'] as List,
                ),
              const Gap(100),
            ],
          );
        },
      ),
    );
  }
}
