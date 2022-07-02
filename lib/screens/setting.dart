import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getcontroller/get_controller.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<String> values = const ['kurdish', "arabic", "english"];
  final bool _isDark = false;
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //?first widget language dropdoawn

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "lang".tr,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 50,
                ),
                FutureBuilder<String>(
                    future: controller.initialCheckSettingLanguage(),
                    builder: (context, snapshot) {
                      return DropdownButton<String>(
                        value: snapshot.data ?? "kurdish",
                        icon: const Icon(Icons.arrow_downward),
                        iconDisabledColor: Colors.grey,
                        iconEnabledColor: Colors.grey,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            // dropdownValue = newValue!;

                            controller
                                .changeLanguage(newValue!.substring(0, 2));
                          });
                        },
                        items: values
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    }),
              ],
            ),
          ),

          //?second widget switch dark theme

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "isDark".tr,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 50,
              ),
              FutureBuilder<bool>(
                  future: controller.initialCheckSettingTheme(),
                  builder: (context, snapshot) {
                    return Switch(
                        activeColor: Colors.blue,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey,
                        value: snapshot.data ?? _isDark,
                        onChanged: (bool value) {
                          setState(() {
                            controller.changeTheme(value);
                          });
                        });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
