import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_screen_model.dart';
export 'home_screen_model.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  late HomeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeScreenModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController1 = TextEditingController();
    _model.textController2 = TextEditingController();
    _model.textController3 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController1?.text = FFLocalizations.of(context).getText(
            'ag6cv6sw' /* 0 */,
          );
          _model.textController2?.text = FFLocalizations.of(context).getText(
            'pjene2vn' /* 200000 */,
          );
          _model.textController3?.text = FFLocalizations.of(context).getText(
            '2fexitic' /* school */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }
 
  @override
 void reset(){
    setState(() {
      _model.textController1.text = 'ag6cv6sw';
      _model.textController2.text = "pjene2vn";
      _model.textController3.text = '2fexitic';
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: LinkBageLoginCall.call(
        username: 'username',
        os: isAndroid.toString(),
        device: 'mobile',
        browser: 'Dowell Browser',
        location: currentUserLocationValue?.toString(),
        time: valueOrDefault<String>(
          dateTimeFormat(
            'Hm',
            getCurrentTimestamp,
            locale: FFLocalizations.of(context).languageCode,
          ),
          '00:00',
        ),
        connection: 'wifi',
        ip: '192.168.00.1',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final homeScreenLinkBageLoginResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'fdkg2jc3' /* DoWell Maps */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: custom_widgets.MapWithPolygonsAndCircles(
                        width: double.infinity,
                        height: double.infinity,
                        origin: FFAppState().currentLocation ==
                            'Current Location'
                            ? currentUserLocationValue
                            : _model.placePickerValue.latLng,
                        radius1: double.parse(_model.textController1.text),
                        radius2: double.parse(_model.textController2.text),
                        query: _model.textController3.text,
                        result: _model.result?.toList(),
                        address: _model.addr?.toList(),
                        iOSGoogleMapsApiKey:
                        'AIzaSyB7PtpTGrFkqnywzF5HaF8Hv_E1a5rThtc',
                        androidGoogleMapsApiKey:
                        'AIzaSyBTawRJ-NAZYEir5H8PsPOCJCtx9AuJf6Q',
                        webGoogleMapsApiKey:
                        'AIzaSyD0CJ8u_oqdbNMIRa3y0ygjxXoEIlCHvew',
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 16,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(-0.15, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (FFAppState().currentLocation ==
                                              'Specified Location')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.05, -1),
                                              child: FlutterFlowPlacePicker(
                                                iOSGoogleMapsApiKey:
                                                'AIzaSyB7PtpTGrFkqnywzF5HaF8Hv_E1a5rThtc',
                                                androidGoogleMapsApiKey:
                                                'AIzaSyBTawRJ-NAZYEir5H8PsPOCJCtx9AuJf6Q',
                                                webGoogleMapsApiKey:
                                                'AIzaSyD0CJ8u_oqdbNMIRa3y0ygjxXoEIlCHvew',
                                                onSelect: (place) async {
                                                  setState(() =>
                                                  _model.placePickerValue =
                                                      place);
                                                },
                                                defaultText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '0tx0bg15' /* Select Location */,
                                                ),
                                                icon: Icon(
                                                  Icons.place,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                                buttonOptions: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 56,
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    letterSpacing: 2,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 0,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(0),
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.75, -0.85),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 16, 16, 0),
                                              child:
                                              FlutterFlowDropDown<String>(
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '47tf81qn' /* Current Location */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8chf4p2w' /* Specified Location */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownValue = val);
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .currentLocation =
                                                    _model.dropDownValue!;
                                                  });
                                                },
                                                width: double.infinity,
                                                height: 44,
                                                textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .primaryText,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                ),
                                                hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4hk1nic8' /* Search with */,
                                                ),
                                                elevation: 2,
                                                borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                                borderWidth: 0,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 8, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yg2z9jwh' /* Hint: Default distance is from... */,
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .primaryText,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 8, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 0, 8, 0),
                                                    child: Container(
                                                      width: 100,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController1,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                        InputDecoration(
                                                          hintText:
                                                          FFLocalizations.of(
                                                              context)
                                                              .getText(
                                                            'p4f4svlh' /* From Distance (m) */,
                                                          ),
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText2,
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                        ),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1,
                                                        keyboardType:
                                                        TextInputType
                                                            .number,
                                                        validator: _model
                                                            .textController1Validator
                                                            .asValidator(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 0, 16, 0),
                                                    child: Container(
                                                      width: 100,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController2,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                        InputDecoration(
                                                          hintText:
                                                          FFLocalizations.of(
                                                              context)
                                                              .getText(
                                                            '8krhncx7' /* To Distance (m) */,
                                                          ),
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText2,
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                        ),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1,
                                                        keyboardType:
                                                        TextInputType
                                                            .number,
                                                        validator: _model
                                                            .textController2Validator
                                                            .asValidator(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 8, 8, 0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .lineColor,
                                                    borderRadius: 8,
                                                    borderWidth: 1,
                                                    buttonSize: 46,
                                                    fillColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .primaryColor,
                                                    icon: Icon(
                                                      Icons.search,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .primaryBtnText,
                                                      size: 16,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed: () async {
                                                      currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                          LatLng(0.0,
                                                              0.0));
                                                      var _shouldSetState =
                                                      false;
                                                      _model.nearbyPlaceResponse =
                                                      await NearbyPlaceCall
                                                          .call(
                                                        query: _model
                                                            .textController3
                                                            .text,
                                                        location: functions.latlngToString(FFAppState()
                                                            .currentLocation ==
                                                            'Current Location'
                                                            ? currentUserLocationValue!
                                                            : _model
                                                            .placePickerValue
                                                            .latLng),
                                                        radius: int.tryParse(
                                                            _model
                                                                .textController2
                                                                .text),
                                                      );
                                                      _shouldSetState = true;
                                                      if ((_model
                                                          .nearbyPlaceResponse
                                                          ?.succeeded ??
                                                          true)) {
                                                        _model.result =
                                                        await actions
                                                            .newCustomAction(
                                                          getJsonField(
                                                            (_model.nearbyPlaceResponse
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[:].geometry.location.lat''',
                                                          )!,
                                                          getJsonField(
                                                            (_model.nearbyPlaceResponse
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[:].geometry.location.lng''',
                                                          )!,
                                                          double.parse(_model
                                                              .textController1
                                                              .text),
                                                          double.parse(_model
                                                              .textController2
                                                              .text),
                                                          FFAppState().currentLocation ==
                                                              'Current Location'
                                                              ? currentUserLocationValue!
                                                              : _model
                                                              .placePickerValue
                                                              .latLng,
                                                        );
                                                        _shouldSetState = true;
                                                        if (_model.result
                                                            ?.length ==
                                                            0) {
                                                          ScaffoldMessenger.of(
                                                              context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Search not found',
                                                                style:
                                                                TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                  4000),
                                                              backgroundColor:
                                                              Color(
                                                                  0x00000000),
                                                            ),
                                                          );
                                                        }
                                                        _model.addr =
                                                        await actions
                                                            .newCustomAction3(
                                                          getJsonField(
                                                            (_model.nearbyPlaceResponse
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[:].name''',
                                                          ),
                                                          double.parse(_model
                                                              .textController1
                                                              .text),
                                                          FFAppState().currentLocation ==
                                                              'Current Location'
                                                              ? currentUserLocationValue!
                                                              : _model
                                                              .placePickerValue
                                                              .latLng,
                                                          double.parse(_model
                                                              .textController2
                                                              .text),
                                                          getJsonField(
                                                            (_model.nearbyPlaceResponse
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[:].geometry.location.lat''',
                                                          )!,
                                                          getJsonField(
                                                            (_model.nearbyPlaceResponse
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.results[:].geometry.location.lng''',
                                                          )!,
                                                        );
                                                        _shouldSetState = true;
                                                        _model.eventLogResponse =
                                                        await LogEventCall
                                                            .call(
                                                          platformcode: 'FB',
                                                          citycode: '101',
                                                          daycode: '0',
                                                          dbcode: 'pfm',
                                                          ipAddress:
                                                          '192.168.00.1',
                                                          loginId:
                                                          LinkBageLoginCall
                                                              .sessionID(
                                                            homeScreenLinkBageLoginResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          sessionId:
                                                          LinkBageLoginCall
                                                              .sessionID(
                                                            homeScreenLinkBageLoginResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          processcode: '1',
                                                          regionalTime:
                                                          getCurrentTimestamp
                                                              .toString(),
                                                          dowellTime:
                                                          getCurrentTimestamp
                                                              .toString(),
                                                          location:
                                                          currentUserLocationValue
                                                              ?.toString(),
                                                          objectcode: '1',
                                                          instancecode:
                                                          '100086',
                                                          context: 'afdafa',
                                                          documentId: '3004',
                                                          rules: 'some rules',
                                                          status: 'status',
                                                        );
                                                        _shouldSetState = true;
                                                        _model.doWellMap =
                                                        await DowellMapCall
                                                            .call(
                                                          reqId: (_model
                                                              .eventLogResponse
                                                              ?.jsonBody ??
                                                              '')
                                                              .toString(),
                                                          reqType:
                                                          'nearby_places',
                                                          mongoId: (_model
                                                              .eventLogResponse
                                                              ?.jsonBody ??
                                                              '')
                                                              .toString(),
                                                          eventId: 'qrid',
                                                          dataTimeDone:
                                                          getCurrentTimestamp
                                                              .toString(),
                                                          userName:
                                                          LinkBageLoginCall
                                                              .sessionID(
                                                            homeScreenLinkBageLoginResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          sessionId:
                                                          LinkBageLoginCall
                                                              .sessionID(
                                                            homeScreenLinkBageLoginResponse
                                                                .jsonBody,
                                                          ).toString(),
                                                          locationDone:
                                                          currentUserLocationValue
                                                              ?.toString(),
                                                          teamMemberID: '1153',
                                                        );
                                                        _shouldSetState = true;
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Nearby place search failed!',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                    context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                4000),
                                                            backgroundColor:
                                                            Color(
                                                                0x00000000),
                                                          ),
                                                        );
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .lineColor,
                                                    borderRadius: 8,
                                                    borderWidth: 1,
                                                    buttonSize: 46,
                                                    fillColor:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .secondaryColor,
                                                    icon: Icon(
                                                      Icons.refresh_outlined,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .primaryText,
                                                      size: 16,
                                                    ),
                                                    onPressed: () {
                                                      //print(
                                                          '//IconButton pressed ...');
                                                      
                                                     //Reset button call
                                                      reset()
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        8, 8, 8, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController3,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                        InputDecoration(
                                                          hintText:
                                                          FFLocalizations.of(
                                                              context)
                                                              .getText(
                                                            '4zq5e0x2' /* Search e.g park, school */,
                                                          ),
                                                          hintStyle:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText2,
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .lineColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          errorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                          focusedErrorBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .of(context)
                                                                  .alternate,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8),
                                                          ),
                                                        ),
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1,
                                                        validator: _model
                                                            .textController3Validator
                                                            .asValidator(
                                                            context),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
