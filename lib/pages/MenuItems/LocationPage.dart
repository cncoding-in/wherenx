import 'package:businesspartner/controllers/BusinessController/MenuBusinessController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:location/location.dart' as Location;
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter/material.dart';

import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/Dimension.dart';
import '../../helper/constants.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  // Location.Location currentLocation = Location.Location();
  String demo = "";
  String googleApikey = "AIzaSyAuFYxq-RX0I1boI5HU5-olArirEi2Ez8k";
  String locationString = "Search Location";
  var getLatitude;
  var getLongitude;
  String markerId = '234';
  GoogleMapController? _controller;
  Location.Location currentLocation = Location.Location();
  final Set<Marker> _markers={};
  late BitmapDescriptor mapMarker;



  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(),'assets/images/ic_map_pin_me.png');
  }

  void getLocation() async {
    var location = await currentLocation.getLocation();
    getLatitude = location.latitude?.toDouble();
    getLongitude = location.longitude?.toDouble();
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(location.latitude ?? 0.0,location.longitude?? 0.0),
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: const MarkerId('Home'),
          icon: mapMarker,
          position: LatLng(getLatitude, getLongitude)
      ));
    });
  }

  void setLocatioFromServer() async {

    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(),'assets/images/ic_map_pin_me.png');
    //var location = await currentLocation.getLocation();
    getLatitude = Get.find<MenuBusinessController>().latValue;
    getLongitude = Get.find<MenuBusinessController>().lngValue;
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(getLatitude, getLongitude),
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: const MarkerId('Home'),
          icon: mapMarker,
          position:  LatLng(double.parse(getLatitude), double.parse(getLongitude))
      ));
    });
  }
   showMarker(double lat,double Long) async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(),'assets/images/ic_map_pin_me.png');
    LatLng LatLong = LatLng(lat, Long);
    print(lat+Long);
    _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLong,
      zoom: 17,
    )));
    setState(() {
      _markers.add(Marker(markerId: const MarkerId('Home'),
        icon: mapMarker,
        position: LatLong,
      ));
    });
  }
  @override
  void initState(){
    super.initState();
    //

    setState(() {
     //
      getLocation();
     // setCustomMarker();
      //setLocatioFromServer();
     // getLocation();
     // showMarker(double.parse(getLatitude),double.parse(getLongitude));
      // Get.find<MenuBusinessController>().latValue=="null"?
      // getLocation() :
      //     setLocatioFromServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.size200,
          width: Dimensions.size150,),
      ),
      body: Center(
        child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top:Dimensions.size20),
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(Dimensions.size10),
                width: double.infinity,

                child:GoogleMap(
                  zoomControlsEnabled: false,
                  mapToolbarEnabled: false,
                  // mapType: MapType.hybrid,
                  mapType: MapType.normal,
                  initialCameraPosition:const CameraPosition(
                    target: LatLng(19.8134554, 85.8312359),
                    zoom: 17,
                  ),
                  onMapCreated: (GoogleMapController controller){
                    _controller = controller;
                  },
                  markers: _markers,
                ) ,

              ),

              Positioned(  //search input bar
                  top:Dimensions.size30,
                  child: InkWell(
                      onTap: () async {
                        // var place = await PlacesAutocomplete.show(
                        var place = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: googleApikey,
                            //mode: Mode.overlay,
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
                            apiHeaders: await const GoogleApiHeaders().getHeaders(),
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

                          _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                            target: LatLng(lat,lang),
                            zoom: 17,
                          )));
                          setState(() {

                            getLatitude= lat;
                            getLongitude = lang;
                            _markers.add(Marker(markerId: const MarkerId('Home'),
                                icon: mapMarker,
                                position: LatLng(lat, lang)
                            ));
                          });
                        }
                      },
                      child:Padding(
                        padding: EdgeInsets.all(Dimensions.size15),
                        child: Card(
                          child: Container(
                              padding: const EdgeInsets.all(0),
                              width: MediaQuery.of(context).size.width - 40,
                              child: ListTile(
                                title:Text(locationString, style: const TextStyle(fontSize: 18),),
                                trailing: const Icon(Icons.search),
                                dense: true,
                              )
                          ),
                        ),
                      )
                  )
              ),

              Positioned(
                bottom: Dimensions.size50,
                left: Dimensions.size75,
                child: Center(
                  child: Row(
                    children: [
                      Container(

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                            child: const Text('SAVE MY LOCATION'),onPressed: (){

                            saveLocation();

                          },
                          ),

                      ),
                      SizedBox(
                        width:Dimensions.size20,
                      ),

                       ElevatedButton(
                            onPressed: () {
                              getLocation();

                            },
                            child: const Icon(Icons.my_location, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(10),
                              primary: Colors.blue, // <-- Button color
                              onPrimary: Colors.red, // <-- Splash color
                            ),
                          )
                        //)

                    ],
                  ),
                ),
              ),


            ]
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
            prefixIcon: const Icon(Icons.search,size: 30,),
            contentPadding:
            const EdgeInsets.only(left:20,bottom: 5,right: 5),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white),

            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white),
            )
        ),
      ),
    );
  }

  Future<void> saveLocation() async {

    Get.find<MenuBusinessController>().getMenuLocationPostDetails(getLatitude,getLongitude);
    if(getLatitude.toString()!=""){


    } else {
      Fluttertoast.showToast(
          msg: "Kinldy select a location !",  // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.SNACKBAR,    // location
          timeInSecForIosWeb: 1                 // duration
      );
    }

  }
}
