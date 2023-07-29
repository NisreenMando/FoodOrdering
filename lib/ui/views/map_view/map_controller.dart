import 'dart:async';
import 'package:easy_shopping/core/data/models/api/country_model.dart';
import 'package:easy_shopping/core/services/base_controller.dart';
import 'package:easy_shopping/core/utils/map_util.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends BasController {
  MapController(this.currentLocation);

  late LocationData currentLocation;
  late LatLng selectedLocation;
  late CameraPosition initalCameraPosition;
  RxSet<Marker> markers = <Marker>{}.obs;
  //git add .
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  @override
  void onInit() {
    //تحديد موقع افتراضي اول ماتفتح الخريطة
    initalCameraPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.43296265331129,
          currentLocation.longitude ?? -122.08832357078792),
      zoom: 14.4746,
    );

    selectedLocation = LatLng(currentLocation.latitude ?? 37.43296265331129,
        currentLocation.longitude ?? -122.08832357078792);
    super.onInit();
  }

  void addMarker(
      {required String markerId,
      required LatLng position,
      String? imageUrl,
      String? imageName}) async {
    BitmapDescriptor markerImage = imageName != null
        ? await MapUtil.imageFromAsset(imageName: imageName)
        : await MapUtil.imageFromUrl(imageUrl: imageUrl ?? '');
    markers.add(Marker(
        markerId: MarkerId(markerId), position: position, icon: markerImage));
    //    add marker
    // markers.add(Marker(
    //     markerId: MarkerId(markerId), position: position, icon: markerImage));
    update();
  }

  void getStreetName() async {
    await locationService
        .getAddressInfo(LocationData.fromMap({
      "latitude": selectedLocation.latitude,
      "longitude": selectedLocation.longitude
    }))
        .then((value) {
      streetName.value = value?.street ?? 'No Street name';
    });
    update();
  }
}

// class MapController extends BasController {
//   MapController(this.currentLocation);

//   late LocationData currentLocation;
//   late LatLng selectedLocation;
//   //اذا بدنا نحدد موقع افتراضي علخريطة
//   late CameraPosition initalCameraPosition;
//   //obs=>اذا بدنا نعيد بناء الواجهة
//   RxSet<Marker> markers = <Marker>{}.obs;
//   RxString streetName = ''.obs;

//   //controller=>مارح ياخد قيم غير وقت تنبنى الواجهة الافتراضية للخريطة اول مرة
//   final Completer<GoogleMapController> controller =
//       Completer<GoogleMapController>();

//   @override
//   void onInit() {
//     //تحديد موقع افتراضي اول ماتفتح الخريطة
//     initalCameraPosition = CameraPosition(
//       target: LatLng(currentLocation.latitude ?? 37.43296265331129,
//           currentLocation.longitude ?? -122.08832357078792),
//       zoom: 14.4746,
//     );

//     selectedLocation = LatLng(currentLocation.latitude ?? 37.43296265331129,
//         currentLocation.longitude ?? -122.08832357078792);
//     super.onInit();
//   }
// ///Function add Marker////////////////////
//   void addMarker(
//       {required String markerId,
//       required LatLng position,
//       String? imageUrl,
//       String? imageName}) async {
//     BitmapDescriptor markerImage = imageName != null
//         ? await MapUtil.imageFromAsset(imageName: imageName)
//         : await MapUtil.imageFromUrl(imageUrl: imageUrl ?? '');

//     markers.add(Marker(
//         markerId: MarkerId(markerId), position: position, icon: markerImage));
//     update();
//   }
// ////////////////////////////////////////
//   void getStreetName() async {
//     await locationService
//         .getAddressInfo(LocationData.fromMap({
//       'latitude': selectedLocation.latitude,
//       'longitude': selectedLocation.longitude
//     }))
//         .then((value) {
//       streetName.value = value?.street ?? 'No Street name';
//     });

//     update();
//   }

//   List<CountryModel> country = [];
// }
