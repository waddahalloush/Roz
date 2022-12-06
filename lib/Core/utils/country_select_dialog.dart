import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:roz/Bloc/cubit/app_cubit.dart';
import 'package:roz/Core/constants/app_strings.dart';

void openCountryPickerDialog(BuildContext context, AppCubit cubit) =>
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => CountryPickerDialog(
          titlePadding: const EdgeInsets.all(8.0),
          searchCursorColor: Colors.pinkAccent,
          contentPadding: const EdgeInsets.all(0),
          searchInputDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 5),
              hintText: AppStrings.searchMsgMatch(context),
              suffixIcon: const Icon(
                Icons.search,
                size: 20,
                color: Colors.pinkAccent,
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
          isSearchable: true,
          title: Text(AppStrings.selectCountry(context)),
          onValuePicked: (Country country) {
            cubit.changeCountryFlag(country.isoCode);
          },
          itemFilter: (c) => [
                'SY',
                'EG',
                'SA',
                'BR',
                'CA',
                'CN',
                'FR',
                'DE',
                'IQ',
                'IN',
                'IT',
                'JO',
                'KW',
                'LB',
                'LY',
                'MA',
                'NL',
                'OM',
                'PS',
                'QA',
                'RU',
                'SD',
                'TN',
                'AE',
                'YE',
                'GB'
              ].contains(c.isoCode),
          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('TR'),
            CountryPickerUtils.getCountryByIsoCode('US'),
          ],
          itemBuilder: (Country country) => Transform.scale(
              scale: 1.1,
              child: CheckboxListTile(
                dense: true,
                checkColor: Colors.white,
                activeColor: Colors.pink,
                visualDensity: VisualDensity.comfortable,
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                checkboxShape: const CircleBorder(),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.videocam,
                      size: 20,
                    ),
                    Text(
                      "234",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )
                  ],
                ),
                title: Transform.translate(
                  offset: const Offset(-15, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: CountryPickerUtils.getDefaultFlagImage(
                                  country))),
                      Text(
                        country.name,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                onChanged: (value) {
                  cubit.changeCountryFlag(country.isoCode);
                },
                value: cubit.selectedCountry.contains(country.isoCode),
              ))),
    );

//  Row(
//         children: <Widget>[
//           CountryPickerUtils.getDefaultFlagImage(country),
//           const SizedBox(
//             width: 8.0,
//           ),
//           Text("+${country.phoneCode}(${country.isoCode})"),
//         ],
//       ),