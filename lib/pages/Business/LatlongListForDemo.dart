import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../helper/Dimension.dart';
import '../../models/LatlongListForDemoModel.dart';
import 'package:http/http.dart' as http;
import '../../routes/route_helper.dart';

class LatlongListForDemo extends StatefulWidget {
  const LatlongListForDemo({Key? key}) : super(key: key);
  @override
  State<LatlongListForDemo> createState() => _LatlongListForDemoState();
}

class _LatlongListForDemoState extends State<LatlongListForDemo> {
  late Future<LatlongListForDemoModel> ldm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Future<LatlongListForDemoModel> fetchData() async {
    final response = await http.post(
        Uri.parse('https://www.2designnerds.com/wherenx/public/api/pinned-property-marker?key_word=bar&location=20.3413076,85.8033065'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(LatlongListForDemoModel.fromJson(jsonDecode(response.body)));
      return LatlongListForDemoModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {
    ldm = fetchData();
    print(ldm);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/images/ic_head_logo.png',
          height: Dimensions.logoHeight,
          width: Dimensions.logowidth,
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/images/ic_manprofile.png'),
            onPressed: () => Get.toNamed(RouteHelper.businessMapMarkerpage),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: Dimensions.size10,
          ),

          FutureBuilder<LatlongListForDemoModel>(
            future: ldm,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.businessData?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(
                              "LatLong : " +
                                  snapshot.data!.businessData![index].latLng
                                      .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  fontSize: 20)),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),

        ]),
      ),
    );
  }
}
