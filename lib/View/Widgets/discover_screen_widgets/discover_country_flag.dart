import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

Widget countryFlagsWidget(String flag, int dimin) => Positioned(
      left: 16.0 * dimin,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: CountryPickerUtils.getDefaultFlagImage(
              CountryPickerUtils.getCountryByIsoCode(flag)),
        ),
      ),
    );
