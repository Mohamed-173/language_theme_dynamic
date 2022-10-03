//This page contains every available necessary tools for All app creating to TimeSaving (:

import 'package:flutter/material.dart';

// double getHeight(BuildContext context, double percentage) {
//   double h = MediaQuery.of(context).size.height;
//   return (h / 100) * percentage;
// }

// double getWidth(BuildContext context, double percentage) {
//   double h = MediaQuery.of(context).size.width;
//   return (h / 100) * percentage;
// }

void to(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

// void toOff(BuildContext context, Widget screen) {
//   Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder: (context) => screen),
//     (Route<dynamic> route) => false,
//   );
// }
