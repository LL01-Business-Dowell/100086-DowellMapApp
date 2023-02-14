// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future<String?> ipAddress() async {
  String iPAddress = '';

  /// MODIFY CODE ONLY BELOW THIS LINE

  final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4, includeLinkLocal: true);

  try {
    // Try VPN connection first
    NetworkInterface vpnInterface =
        interfaces.firstWhere((element) => element.name == "tun0");
    iPAddress = vpnInterface.addresses.first.address;
    return vpnInterface.addresses.first.address;
  } on StateError {
    // Try wlan connection next
    try {
      NetworkInterface interface =
          interfaces.firstWhere((element) => element.name == "wlan0");
      iPAddress = interface.addresses.first.address;
      return interface.addresses.first.address;
    } catch (ex) {
      // Try any other connection next
      try {
        NetworkInterface interface = interfaces.firstWhere(
            (element) => !(element.name == "tun0" || element.name == "wlan0"));
        iPAddress = interface.addresses.first.address;
        return interface.addresses.first.address;
      } catch (ex) {
        return null;
      }
    }
    return iPAddress;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
