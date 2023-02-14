import '../backend/api_requests/api_calls.dart';
import '../components/searchbox_copy_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_language_selector.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // Model for searchboxCopy component.
  late SearchboxCopyModel searchboxCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    searchboxCopyModel = createModel(context, () => SearchboxCopyModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}
