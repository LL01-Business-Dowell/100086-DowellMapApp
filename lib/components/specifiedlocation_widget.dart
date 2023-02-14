import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'specifiedlocation_model.dart';
export 'specifiedlocation_model.dart';

class SpecifiedlocationWidget extends StatefulWidget {
  const SpecifiedlocationWidget({Key? key}) : super(key: key);

  @override
  _SpecifiedlocationWidgetState createState() =>
      _SpecifiedlocationWidgetState();
}

class _SpecifiedlocationWidgetState extends State<SpecifiedlocationWidget> {
  late SpecifiedlocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecifiedlocationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowPlacePicker(
              iOSGoogleMapsApiKey: 'AIzaSyB7PtpTGrFkqnywzF5HaF8Hv_E1a5rThtc',
              androidGoogleMapsApiKey:
                  'AIzaSyBTawRJ-NAZYEir5H8PsPOCJCtx9AuJf6Q',
              webGoogleMapsApiKey: 'AIzaSyD0CJ8u_oqdbNMIRa3y0ygjxXoEIlCHvew',
              onSelect: (place) async {
                setState(() => _model.placePickerValue = place);
              },
              defaultText: FFLocalizations.of(context).getText(
                'bwki9q32' /* Select Location */,
              ),
              icon: Icon(
                Icons.place,
                color: Colors.white,
                size: 16,
              ),
              buttonOptions: FFButtonOptions(
                width: 200,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
