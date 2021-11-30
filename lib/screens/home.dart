import 'package:flutter/material.dart';
import '../models/advertisement.dart';
import '../models/vehicle_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final List<Advertisement> _promotion = [
    Advertisement(
      "រដូវភ្លៀង ចេញក្រៅទៅផ្សារ ឬ ទៅជួបមិត្តភក្តិ មិនជាបញ្ហា...",
      "Raining season? No problem with PassApp.",
      "banner_promotion.PNG")
  ];

  static final List<Advertisement> _information = [
    Advertisement(
      "កាន់តែងាយស្រួលចាប់ពីថ្ងៃនេះតទៅ រាល់ពេលធ្វើដំណើរ...",
      "Your next ride with us will be much easier and faster when you link your ABA account to it!...",
      "banner_information.PNG")
  ];

  static const List<VehicleInfo> vehicleInfo = [
    VehicleInfo(0, "Tuktuk", "vehicle_motor.PNG"),
    VehicleInfo(1, "Rickshaw", "vehicle_rickshaw.PNG"),
    VehicleInfo(2, "Classic", "vehicle_classic.PNG"),
    VehicleInfo(3, "SUV", "vehicle_suv.PNG"),
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _advertisementWidget("Promotion", _promotion),
                _advertisementWidget("Information", _information),
              ],
            ),
          ),
        ),
        _vehicleOption(vehicleInfo, context)
      ],
    );
  }
}

Widget _advertisementWidget(String sectionName, List<Advertisement> advertisement) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: List.generate(advertisement.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                sectionName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/${advertisement[index].imageName}')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      advertisement[index].kh_title,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      advertisement[index].en_title,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    ),
  );
}

Widget _vehicleOption(List<VehicleInfo> vehicleInfo, BuildContext context) {
  const TextStyle optionStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);
  return Container(
    alignment: Alignment.bottomCenter,
    child: Row(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width / 5,
          width: MediaQuery.of(context).size.width,
          //alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                )
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(vehicleInfo.length, (index) {
              return Column(
                children: [
                  Expanded(
                      child: FittedBox(
                    fit: BoxFit.fill,
                    child: IconButton(
                      icon:
                          Image.asset("assets/${vehicleInfo[index].logoName}"),
                      onPressed: () {},
                    ),
                  )),
                  Text(
                    vehicleInfo[index].name,
                    style: optionStyle,
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    ),
  );
}
