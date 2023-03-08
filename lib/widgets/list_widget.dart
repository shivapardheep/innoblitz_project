import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

SizedBox listWidget(
    double height, var dataList, LocationData? currentLocation) {
  return SizedBox(
    height: height,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, i) {
            return Card(
              semanticContainer: true,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListTile(
                onTap: () async {
                  if (currentLocation != null) {
                    String url =
                        'https://www.google.com/maps/dir/?api=1&destination=${dataList[i].address!.geo!.lat},${dataList[i].address!.geo!.lng}';
                    url +=
                        '&origin=${currentLocation.latitude},${currentLocation.longitude}';
                    await launchUrl(Uri.parse(url));
                  } else {
                    // getLocation
                  }
                },
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  maxRadius: 30,
                  // radius: 100,
                  backgroundImage:
                      AssetImage("assets/icons/image${i % 2 == 0 ? 1 : 2}.jpg"),
                ),
                title: Text(dataList[i].name.toString()),
                subtitle: Text(dataList[i].email.toString()),
                trailing: const Icon(
                  Icons.location_on_rounded,
                  color: Colors.green,
                ),
              ),
            );
          }),
    ),
  );
}
