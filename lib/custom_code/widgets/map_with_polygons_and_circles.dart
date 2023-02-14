// Automatic FlutterFlow imports
import 'package:flutter/gestures.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

//import 'package:do_well_maps/flutter_flow/flutter_flow_google_map.dart';
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapWithPolygonsAndCircles extends StatefulWidget {
  const MapWithPolygonsAndCircles({
    Key? key,
    this.width,
    this.height,
    this.origin,
    required this.radius1,
    required this.radius2,
    this.query,
    this.result,
    this.address,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? origin;
  final double radius1;
  final double radius2;
  final String? query;
  final List<LatLng>? result;
  final List<String>? address;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;

  @override
  _MapWithPolygonsAndCirclesState createState() =>
      _MapWithPolygonsAndCirclesState();
}

class _MapWithPolygonsAndCirclesState extends State<MapWithPolygonsAndCircles> {
  //late var ori;
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  late GoogleMapPolyline? googleMapPolyline;
  final Set<Marker> markers = new Set();
  late var placepicked;
  var _cameraBearing=180.0;

  String get googleMapsApiKey {
    if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }
  }

  final List<latlng.Polyline> polyline = [];
  List<latlng.LatLng>? routeCoords = [];

  //List<List<latlng.LatLng>> path = [];
  //List<List<Point<num>>> path = [];
  //final Set<latlng.Polyline> _mypoly = {};
  //final List<latlng.LatLng> polylineCoordinates = [];

  //final Set<latlng.Polyline> _mypoly = {};

  // Map<latlng.PolylineId, latlng.Polyline> polylines = {};
  // List<latlng.LatLng> polylineCoordinates = [];
  // PolylinePoints polylinePoints = PolylinePoints();
  // String key = "AIzaSyBTawRJ-NAZYEir5H8PsPOCJCtx9AuJf6Q";

  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  @override
  void initState() {
    debugPrint("ApiKey $googleMapsApiKey");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: GestureDetector(
            onVerticalDragStart: (start) {},
            child: GoogleMap(
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                tiltGesturesEnabled: true,
                rotateGesturesEnabled: true,
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  new Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer(),
                  ),
                ].toSet(),
                /*onTap: (latlng.LatLng latLng) {
                  markers.add(Marker(markerId: MarkerId('mark'), position: latLng));
                  setState(() {});
                },*/
                markers:
                    getmarkers(widget.result, widget.address, widget.origin!),
                polylines: Set.from(polyline),
                initialCameraPosition: CameraPosition(
                    target: getPlacePicker(), bearing: 180.0, tilt: 60.0),
                circles: Set.from([
                  Circle(
                      circleId: CircleId(generateRandomString(10)),
                      center: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      radius: widget.radius1,
                      strokeWidth: 2,
                      strokeColor: Color.fromARGB(255, 3, 124, 7),
                      fillColor: Colors.transparent),
                  Circle(
                      circleId: CircleId(generateRandomString(10)),
                      center: latlng.LatLng(
                          widget.origin!.latitude, widget.origin!.longitude),
                      radius: widget.radius2,
                      strokeWidth: 2,
                      strokeColor: Color.fromARGB(255, 3, 124, 7),
                      fillColor: Colors.transparent),
                ]),
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _controller = controller;
                    googleMapPolyline =
                        new GoogleMapPolyline(apiKey: googleMapsApiKey);

                    _controller?.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: latlng.LatLng(widget.origin!.latitude,
                                widget.origin!.longitude),
                            zoom: 16,
                            bearing: 180.0,
                            tilt: 60.0),
                      ),
                    );
                  });
                })));
  }

  getCameraPosition(la) {}

  Set<Marker> getmarkers(
      List<LatLng>? locationInfo, List<String>? Titl, LatLng origin) {
    debugPrint("Place picked $Titl.length");
    setState(() {
      if (locationInfo != null) {
        for (var i = 0; i < locationInfo.length; i++) {
          debugPrint("${locationInfo[i].latitude}");

          markers.add(Marker(
            markerId: MarkerId(generateRandomString(10)),
            position: latlng.LatLng(
                locationInfo[i].latitude, locationInfo[i].longitude),
            //position of marker
            infoWindow: InfoWindow(title: Titl!.elementAt(i)),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            onTap: () async {
              _computePath(
                  latlng.LatLng(
                      widget.origin!.latitude, widget.origin!.longitude),
                  latlng.LatLng(
                      locationInfo[i].latitude, locationInfo[i].longitude));
            },
          ));
        }
      }
    });

    debugPrint("Markers $markers");
    return markers;
  }

  _computePath(latlng.LatLng origin, latlng.LatLng destination) async {
    routeCoords = await googleMapPolyline?.getCoordinatesWithLocation(
        origin: origin, destination: destination, mode: RouteMode.driving);

    debugPrint("Result --- ${routeCoords}");

    CameraPosition nepPos =
        CameraPosition(target: origin, zoom: 16, bearing: 180.0, tilt: 60.0);

    _controller?.animateCamera(CameraUpdate.newCameraPosition(nepPos));

    setState(() {
      polyline.clear();
      if (routeCoords != null) {
        polyline.add(latlng.Polyline(
            polylineId: latlng.PolylineId('iter'),
            visible: true,
            points: routeCoords!,
            width: 4,
            color: Colors.blue,
            startCap: Cap.roundCap,
            endCap: Cap.buttCap));
      }
    });
  }

  // _addPolyLine() {
  //   latlng.PolylineId id = latlng.PolylineId(generateRandomString(10));
  //   latlng.Polyline polyline = latlng.Polyline(
  //       polylineId: id,
  //       color: Colors.red,
  //       points: polylineCoordinates,
  //       width: 4);
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  // _getPolyline(double _originLatitude, double _originLongitude,
  //     double _destLatitude, double _destLongitude) async {
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       key,
  //       PointLatLng(_originLatitude, _originLongitude),
  //       PointLatLng(_destLatitude, _destLongitude),
  //       travelMode: TravelMode.driving);

  //   polylineCoordinates.clear();

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
  //     });

  //     for (var point in polylineCoordinates) {
  //       debugPrint("Points $point");
  //     }
  //   }
  //   _addPolyLine();
  // }

  latlng.LatLng getPlacePicker() {
    setState(() {
      //markers.clear();
      placepicked =
          latlng.LatLng(widget.origin!.latitude, widget.origin!.longitude);
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: placepicked, zoom: 14)));

      markers.add(Marker(
        markerId: MarkerId(generateRandomString(10)),
        position: latlng.LatLng(widget.origin!.latitude,
            widget.origin!.longitude), //position of marker
        infoWindow: InfoWindow(
            //popup info
            title: "Starting Point"),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
    debugPrint("Place picked $placepicked");
    return placepicked;
  }
}

class DirectionQuery {
  List<GeocodedWaypoints>? geocodedWaypoints;
  List<Routes>? routes;
  String? status;

  DirectionQuery({this.geocodedWaypoints, this.routes, this.status});

  DirectionQuery.fromJson(Map<String, dynamic> json) {
    if (json['geocoded_waypoints'] != null) {
      geocodedWaypoints = <GeocodedWaypoints>[];
      json['geocoded_waypoints'].forEach((v) {
        geocodedWaypoints!.add(new GeocodedWaypoints.fromJson(v));
      });
    }
    if (json['routes'] != null) {
      routes = <Routes>[];
      json['routes'].forEach((v) {
        routes!.add(new Routes.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geocodedWaypoints != null) {
      data['geocoded_waypoints'] =
          this.geocodedWaypoints!.map((v) => v.toJson()).toList();
    }
    if (this.routes != null) {
      data['routes'] = this.routes!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class GeocodedWaypoints {
  String? geocoderStatus;
  String? placeId;
  List<String>? types;

  GeocodedWaypoints({this.geocoderStatus, this.placeId, this.types});

  GeocodedWaypoints.fromJson(Map<String, dynamic> json) {
    geocoderStatus = json['geocoder_status'];
    placeId = json['place_id'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geocoder_status'] = this.geocoderStatus;
    data['place_id'] = this.placeId;
    data['types'] = this.types;
    return data;
  }
}

class Routes {
  Bounds? bounds;
  String? copyrights;
  List<Legs>? legs;
  Polyline? overviewPolyline;
  String? summary;

  Routes({
    this.bounds,
    this.copyrights,
    this.legs,
    this.overviewPolyline,
    this.summary,
  });

  Routes.fromJson(Map<String, dynamic> json) {
    bounds =
        json['bounds'] != null ? new Bounds.fromJson(json['bounds']) : null;
    copyrights = json['copyrights'];
    if (json['legs'] != null) {
      legs = <Legs>[];
      json['legs'].forEach((v) {
        legs!.add(new Legs.fromJson(v));
      });
    }
    overviewPolyline = json['overview_polyline'] != null
        ? new Polyline.fromJson(json['overview_polyline'])
        : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bounds != null) {
      data['bounds'] = this.bounds!.toJson();
    }
    data['copyrights'] = this.copyrights;
    if (this.legs != null) {
      data['legs'] = this.legs!.map((v) => v.toJson()).toList();
    }
    if (this.overviewPolyline != null) {
      data['overview_polyline'] = this.overviewPolyline!.toJson();
    }
    data['summary'] = this.summary;

    return data;
  }
}

class Bounds {
  Northeast? northeast;
  Northeast? southwest;

  Bounds({this.northeast, this.southwest});

  Bounds.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new Northeast.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new Northeast.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast!.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest!.toJson();
    }
    return data;
  }
}

class Northeast {
  double? lat;
  double? lng;

  Northeast({this.lat, this.lng});

  Northeast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Legs {
  Distance? distance;
  Distance? duration;
  String? endAddress;
  Northeast? endLocation;
  String? startAddress;
  Northeast? startLocation;
  List<Steps>? steps;

  Legs({
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
  });

  Legs.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
    endAddress = json['end_address'];
    endLocation = json['end_location'] != null
        ? new Northeast.fromJson(json['end_location'])
        : null;
    startAddress = json['start_address'];
    startLocation = json['start_location'] != null
        ? new Northeast.fromJson(json['start_location'])
        : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(new Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    data['end_address'] = this.endAddress;
    if (this.endLocation != null) {
      data['end_location'] = this.endLocation!.toJson();
    }
    data['start_address'] = this.startAddress;
    if (this.startLocation != null) {
      data['start_location'] = this.startLocation!.toJson();
    }
    if (this.steps != null) {
      data['steps'] = this.steps!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Distance {
  String? text;
  int? value;

  Distance({this.text, this.value});

  Distance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}

class Steps {
  Distance? distance;
  Distance? duration;
  Northeast? endLocation;
  String? htmlInstructions;
  Polyline? polyline;
  Northeast? startLocation;
  String? travelMode;
  String? maneuver;

  Steps(
      {this.distance,
      this.duration,
      this.endLocation,
      this.htmlInstructions,
      this.polyline,
      this.startLocation,
      this.travelMode,
      this.maneuver});

  Steps.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new Distance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new Distance.fromJson(json['duration'])
        : null;
    endLocation = json['end_location'] != null
        ? new Northeast.fromJson(json['end_location'])
        : null;
    htmlInstructions = json['html_instructions'];
    polyline = json['polyline'] != null
        ? new Polyline.fromJson(json['polyline'])
        : null;
    startLocation = json['start_location'] != null
        ? new Northeast.fromJson(json['start_location'])
        : null;
    travelMode = json['travel_mode'];
    maneuver = json['maneuver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    if (this.endLocation != null) {
      data['end_location'] = this.endLocation!.toJson();
    }
    data['html_instructions'] = this.htmlInstructions;
    if (this.polyline != null) {
      data['polyline'] = this.polyline!.toJson();
    }
    if (this.startLocation != null) {
      data['start_location'] = this.startLocation!.toJson();
    }
    data['travel_mode'] = this.travelMode;
    data['maneuver'] = this.maneuver;
    return data;
  }
}

class Polyline {
  String? points;

  Polyline({this.points});

  Polyline.fromJson(Map<String, dynamic> json) {
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['points'] = this.points;
    return data;
  }
}
