import 'dart:convert';
import 'dart:io';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../helper/Dimension.dart';
import '../../routes/route_helper.dart';
import '../../models/LatlongListForDemoModel.dart';
import 'package:http/http.dart' as http;
class BusinessMapMarker extends StatefulWidget {
  const BusinessMapMarker({Key? key}) : super(key: key);

  @override
  State<BusinessMapMarker> createState() => _BusinessMapMarkerState();
}

class _BusinessMapMarkerState extends State<BusinessMapMarker> {
  static int count = 0;
  late final Future<LatlongListForDemoModel> ldm;

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

   List<Marker> _markers = <Marker>[];

   List<String>  _latlangApi = <String>[];
   List<String>  _nameApi = <String>[];
   List<String>  _pinnedApi = <String>[];
   List<String>  _propertyImageApi = <String>[];

   List<LatLng> _latlang = <LatLng>[];

   late String? imageURL ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //loaddata();
    ldm = fetchData();
  }

//featch data from api
  Future<LatlongListForDemoModel> fetchData() async {
    final response = await http.post(Uri.parse(
        'https://www.2designnerds.com/wherenx/public/api/pinned-property-marker?key_word=bar&location=20.3413076,85.8033065'));

    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(LatlongListForDemoModel.fromJson(jsonDecode(response.body)));
      return LatlongListForDemoModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception
      throw Exception('Failed to load album');
    }
  }

  loaddata() async {
    print("_____ from loaddata()_____");
    BitmapDescriptor mapMarker;
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(),'assets/images/ic_map_pin_me.png');
   print("____latlangApi.length______");
   print(_latlangApi.length);
   print(_latlang.length);
    for (int i = 0; i < 8; i++) {
      _markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            icon: mapMarker,
            //infoWindow: InfoWindow(title: '210 pinned'),
            position: _latlang[i],
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                Container(
                    width: 200,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          decoration:  BoxDecoration(
                            image: DecorationImage(

                            image: NetworkImage("https://maps.googleapis.com/maps/api/place/photo?maxwidth=300&photo_reference="
                                + _propertyImageApi[i] +"&key=AIzaSyAuFYxq-RX0I1boI5HU5-olArirEi2Ez8k"),

                              fit: BoxFit.fitWidth,
                              // filterQuality: FilterQuality.high,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            _nameApi[i],
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            // textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            _pinnedApi[i],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    )),
                _latlang[i],
              );
            }),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    print("_____ from view build _____");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/images/ic_head_logo.png',
          height: Dimensions.logoHeight,
          width: Dimensions.logowidth,),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/ic_manprofile.png'),
            onPressed: () => Get.toNamed(RouteHelper.getAuthLoginPage()),
          ),
        ],

      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [

            FutureBuilder<LatlongListForDemoModel>(
              future: ldm,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("_______ FutureBuilder______");
                  print(snapshot.data?.businessData?.length);
                  String? l = snapshot.data?.businessData?.length.toString();
                  var limt = int.parse(l!);
                  assert(limt is int);
                  print("_______limt______"); // 12345
                  print(limt); // 12345
                  print(limt.runtimeType);
                  print(limt);
                  for (int i = 0; i < 8; i++){

                    print(limt);
                    print(snapshot.data?.businessData![i].latLng.toString());
                    String? latlong = snapshot.data?.businessData![i].latLng.toString();
                    String? name = snapshot.data?.businessData![i].name.toString();
                    String? pinned = snapshot.data?.businessData![i].pinnedBy.toString();
                    String? _propertyImage = snapshot.data?.businessData![i].propertyImage.toString();
                    _latlangApi.add(latlong!) ;

                    String  La = latlong;
                    List<String> strArr = La.split(",");
                    double latitude = double.parse(strArr[0]);
                    double longitude = double.parse(strArr[1]);
                    LatLng location = new LatLng(latitude, longitude);
                    print(location);
                    _latlang.add(location);
                     _nameApi.add(name!);
                    _pinnedApi.add(pinned!);
                    _propertyImageApi.add(_propertyImage!);

                  }
                  count++;
                  print("_______latlangApi.length________");
                  print(_latlangApi.length);
                  print(_latlang.length);
                  print(_latlangApi[0].toString());
                  print(_latlang[0].toString());
                  print(_nameApi[0].toString());
                  print(_pinnedApi[0].toString());
                  print(_propertyImageApi[0].toString());

                  if (count == 1){
                    loaddata();

                  }else{
                    print("count else"+count.toString());
                  }

                 // }
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();

              },

            ),


            GoogleMap(
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition:const CameraPosition(
                  target: LatLng( 20.296059, 85.824539),
                  zoom: 10,
                ),
                onMapCreated: (GoogleMapController controller){
                  _customInfoWindowController.googleMapController = controller;
                },
                markers: Set.of(_markers),
                onTap: (position){
                  _customInfoWindowController.hideInfoWindow!();
                },

                onCameraMove: (position){
                  _customInfoWindowController.onCameraMove!();
                },
              ) ,

            CustomInfoWindow(controller: _customInfoWindowController,
              width: 200,
              height: 140,
              offset: 20,
            ),
          ],
        ),
      ),
    );

  }

}
