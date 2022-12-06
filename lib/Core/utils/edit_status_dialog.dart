import 'package:flutter/material.dart';
import 'package:roz/Core/utils/Global%20Widgets/login_formfield.dart';

Future<bool> editStatusDialog(
    BuildContext context, TextEditingController statusController) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
            actionsAlignment: MainAxisAlignment.center,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(32.0))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Edit Status",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ],
            ),
            titlePadding: const EdgeInsets.symmetric(horizontal: 30),
            content: LoginFormField(
                hint: "Type New Status", controller: statusController),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {},
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "CANCLE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ));
  return Future.value(true);
}
