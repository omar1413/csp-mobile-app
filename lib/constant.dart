import 'package:flutter/material.dart';

const Color kblue = Color(0xFF4756DF);
const Color kwhite = Color(0xFFFFFFFF);
const Color kblack = Color(0xFF000000);
const Color kbrown300 = Color(0xFF8D6E63);
const Color kbrown = Color(0xFF795548);
const Color kgrey = Color(0xFFC0C0C0);

const double kMidHeight = 60;

const double kNavBarHeight = 50;

const String kHost = "192.168.1.108:8099";
// const String kHost = "10.1.2.159:8098";
//const String kHost = "10.3.1.229:8098";
//const String kHost = "10.1.2.159:8099";
const String kPrefixHost = "/csp/portal";

Map<String, String> kHostHeader = {
  "Content-Type": "application/json; charset=UTF-8",
  "Accept": "*/*",
  "Accept-Encoding": "gzip, deflate, br",
  "Connection": "keep-alive",
};

const String kVehicleIdArgKey = "kVehicleIdArgKey";

const String kSubscriptionArgKey = "kSubscriptionArgKey";
