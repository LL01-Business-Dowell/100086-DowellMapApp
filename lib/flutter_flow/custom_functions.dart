import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

LatLng? newCustomFunction(
  double? lat,
  double? lng,
) {
  return LatLng(lat!, lng!);
}

String latlngToString(LatLng latlng) {
  double lat = latlng.latitude;
  double lng = latlng.longitude;
  //String lat = latlng.latitude as String;
  //String lng = latlng.longitude as String;
  return "$lat,$lng";
}

String? saveSessionID(String? qrid) {
  return qrid;
}
