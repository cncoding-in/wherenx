
import 'package:flutter/material.dart';

import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:location/location.dart' as Location;
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/BusinessController/MenuBusinessController.dart';
import '../../helper/Dimension.dart';
import '../../helper/constants.dart';

class NewLocation extends StatefulWidget {
  @override
  State<NewLocation> createState() => _NewLocationState();
}

class _NewLocationState extends State<NewLocation> {
  String googleApikey = "AIzaSyAuFYxq-RX0I1boI5HU5-olArirEi2Ez8k";
  String locationString = "Search Location";

  var getLatitude;
  var getLongitude;
  String markerId = '234';
  GoogleMapController? _controller;
  Location.Location currentLocation = Location.Location();
  Set<Marker> _markers={};
  late BitmapDescriptor mapMarker;
  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),'assets/images/ic_map_pin_me.png');
  }

  // void getLocation() async {
  //   var location = await currentLocation.getLocation();
  //   getLatitude = location.latitude?.toDouble();
  //   getLongitude = location.longitude?.toDouble();
  //   _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
  //     target: LatLng(location.latitude ?? 0.0,location.longitude?? 0.0),
  //     zoom: 17,
  //   )));
  //   setState(() {
  //     _markers.add(Marker(markerId: MarkerId('Home'),
  //         icon: mapMarker,
  //         position: LatLng(getLatitude, getLongitude)
  //     ));
  //   });
  // }

  void getLocation() async {
    var location = await currentLocation.getLocation();
    getLatitude = Get.find<MenuBusinessController>().latValue=="null"?location.latitude?.toDouble():double.parse(Get.find<MenuBusinessController>().latValue.toString());
    getLongitude = Get.find<MenuBusinessController>().lngValue=="null"?location.longitude?.toDouble():double.parse(Get.find<MenuBusinessController>().lngValue.toString());
    _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLng(getLatitude, getLongitude),
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: MarkerId('Home'),
          icon: mapMarker,
          position: LatLng(getLatitude, getLongitude)
      ));
    });
  }
  void myCurrentLocation() async {
    var location = await currentLocation.getLocation();
    getLatitude = location.latitude?.toDouble();
    getLongitude = location.longitude?.toDouble();
    _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLng(location.latitude ?? 0.0,location.longitude?? 0.0),
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: MarkerId('Home'),
          icon: mapMarker,
          position: LatLng(getLatitude, getLongitude)
      ));
    });
  }
  void showMarker(double lat,double Long){
    LatLng LatLong = LatLng(lat, lat);
    _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      target: LatLong,
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: MarkerId('Home'),
        icon: mapMarker,
        position: LatLong,
      ));
    });
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      setCustomMarker();
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {

    print(Dimensions.screenHeight);
    print(Dimensions.screenWidth);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.size200,
          width: Dimensions.size150,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [


            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top:Dimensions.size20),
                  height: Dimensions.screenHeight-Dimensions.size180,
                  padding: EdgeInsets.all(Dimensions.size10),
                  width: Dimensions.screenWidth,
                  child:GoogleMap(
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                    // mapType: MapType.hybrid,
                    mapType: MapType.normal,
                    initialCameraPosition:CameraPosition(
                      target: LatLng(48.8561, 2.2930),
                      zoom: 17,
                    ),
                    onMapCreated: (GoogleMapController controller){
                      _controller = controller;
                    },
                    markers: _markers,
                  ) ,

                ),
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.size50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          var place = await PlacesAutocomplete.show(
                              context: context,
                              apiKey: googleApikey,
                              mode: Mode.overlay,
                              types: [],
                              strictbounds: false,
                              // components: [Component(Component.country, 'us')],
                              //google_map_webservice package
                              onError: (err){
                                print(err);
                              }
                          );

                          if(place != null){
                            setState(() {
                              // location = place.description.toString();
                            });

                            //form google_maps_webservice package
                            final plist = GoogleMapsPlaces(apiKey:googleApikey,
                              apiHeaders: await GoogleApiHeaders().getHeaders(),
                              //from google_api_headers package
                            );
                            String placeid = place.placeId ?? "0";
                            final detail = await plist.getDetailsByPlaceId(placeid);
                            final geometry = detail.result.geometry!;
                            final lat = geometry.location.lat;
                            final lang = geometry.location.lng;
                            var newlatlang = LatLng(lat, lang);

                            //  _markers.add(Marker(markerId: MarkerId('Home'),
                            // icon: mapMarker,
                            // position: LatLng(lat, lang)));

                            _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
                              target: LatLng(lat,lang),
                              zoom: 17,
                            )));
                            setState(() {

                              getLatitude= lat;
                              getLongitude = lang;
                              _markers.add(Marker(markerId: MarkerId('Home'),
                                  icon: mapMarker,
                                  position: LatLng(lat, lang)
                              ));
                            });
                          }
                        },
                        child: Card(
                          child: Container(
                              width: Dimensions.screenWidth-100,
                              child: ListTile(
                                title:Text(locationString, style: TextStyle(fontSize: 18),),
                                trailing: Icon(Icons.search),
                                dense: true,
                              )
                          ),
                        ),
                      ),
                    ],

                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.size1),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                    child: Text('SAVE MY LOCATION'),onPressed: (){

                    saveLocation();

                  },
                  ),

                  SizedBox(
                    width: Dimensions.size20,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      myCurrentLocation();
                      // Fluttertoast.showToast(
                      //     msg: "Location is : "+getLongitude.toString()+ "," + getLongitude.toString(),  // message
                      //     toastLength: Toast.LENGTH_SHORT, // length
                      //     gravity: ToastGravity.SNACKBAR,    // location
                      //     timeInSecForIosWeb: 1               // duration
                      // );
                    },
                    child: Icon(Icons.my_location, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      primary: Colors.blue, // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  )

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Padding LocationSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            filled: true,fillColor: Colors.white,
            hintText: 'Enter Your Location',
            prefixIcon: Icon(Icons.search,size: 30,),
            contentPadding:
            const EdgeInsets.only(left:20,bottom: 5,right: 5),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),

            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            )
        ),
      ),
    );
  }

  Future<void> saveLocation() async {
    Get.find<MenuBusinessController>().getMenuLocationPostDetails(getLatitude,getLongitude);
  }
}

