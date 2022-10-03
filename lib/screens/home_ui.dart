import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lang_pref/handtool/modtools.dart';
import 'package:lang_pref/screens/setting.dart';
import '../getcontroller/get_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? lang = '';
  bool? isDark;

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nameApp'.tr,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "userProfile".tr,
              ),
            ),
            ListTile(
              title: Text(
                'settings'.tr,
              ),
              onTap: () {
                setState(() {
                  to(context, const Setting());
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                  onPressed: () {
                    controller.resetCounter();
                  },
                  icon: const Icon(Icons.restart_alt_outlined)),
            ),
            Text("azkar".tr),
            GetX<Controller>(
                builder: (_) => Text(
                      "clicks".tr + " : " + ' ${controller.count}',
                    )),
            SizedBox(
              width: 150,
              height: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.incrementCounter();
                },
                icon: const Icon(
                  Icons.add,
                ),
                label: Text("add".tr),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),

                      // side: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
