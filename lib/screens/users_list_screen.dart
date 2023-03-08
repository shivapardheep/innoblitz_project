import 'package:flutter/material.dart';
import 'package:innoblitz_project/models/userDataModel.dart';
import 'package:innoblitz_project/providers/api/provider.dart';
import 'package:innoblitz_project/widgets/shimmer_widget.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/list_widget.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  Location location = Location();

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _currentLocation;

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      // if (!_serviceEnabled!) {
      //   return;
      // }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        getLocation();
      }
    }

    _currentLocation = await location.getLocation();
    setState(() {});
  }

  dummyLocation() async {
    if (_currentLocation == null) {
      getLocation();
    } else {
      var lat = 13.067439;
      var lng = 80.237617;

      var url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
      url +=
          '&origin=${_currentLocation!.latitude},${_currentLocation!.longitude}';
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  void initState() {
    getLocation();
    context.read<ApiProvider>().fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataModel> dataList = context.watch<ApiProvider>().getDataList;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users"),
        excludeHeaderSemantics: true,
        actions: [
          IconButton(
              onPressed: () async {
                //dummy location
                dummyLocation();
              },
              icon: const Icon(Icons.my_location))
        ],
      ),
      body: dataList.isEmpty
          ? const ShimmerList()
          : listWidget(height, dataList, _currentLocation),
    );
  }
}
