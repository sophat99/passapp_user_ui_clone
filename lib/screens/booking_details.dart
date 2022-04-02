import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
    final Completer<GoogleMapController> _controller = Completer();
    late GoogleMapController controller;

    final CameraPosition _kGooglePlex = const CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: const [Text("Trip Details")],
              ),
              Row(
                children: const [
                  Text("Date : "),
                  Spacer(),
                  Text("11/11/2021"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.room),
                  Text("\"From unknown street\""),
                  Spacer(),
                  Text("17:46"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.room),
                  Text("..."),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                height: 250,
                child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    compassEnabled: true,
                    trafficEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                    },
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Table(
                border: const TableBorder(
                    verticalInside: BorderSide(
                        width: 1,
                        color: Colors.grey,
                        style: BorderStyle.solid)),
                //border: TableBorder.symmetric(outside: BorderSide.none),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Center(
                        child: Column(
                          children: const [
                            Text("0 m"),
                            Text("Duration"),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: const [
                            Text("0 km"),
                            Text("Distance"),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: const [
                  Text("Total:"),
                  Spacer(),
                  Text("0 KHR"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.stop),
                  Text("Decided not to go"),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: const [
                  Text("Payment method"),
                  Spacer(),
                  Icon(Icons.money),
                  Text("Cash"),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Center(
                child: Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.fill,
                      child: IconButton(
                        iconSize: 70,
                        icon: Image.asset("assets/vehicle_classic.PNG"),
                        onPressed: () {},
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("K0476"),
                        Text("Susuki Viva - ក្រហម - Red - ក្រចេះ.1A.0277"),
                        Text("Rormork"),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Text("Company"),
                    ],
                  ),
                ],
              ),
              Divider(),
              Divider(),
              Row(
                children: [
                  Column(
                    children: const [
                      Text("Report any issue"),
                      Text("+85589833597"),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.message),
                  Icon(Icons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
