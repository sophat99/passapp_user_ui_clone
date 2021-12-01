import 'package:flutter/material.dart';
import '../models/booking.dart';
import 'booking_details.dart';
import 'package:intl/intl.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);
  static final List<Booking> _myBooking = [
    Booking(0, "K0476", 1648353999, "Cancelled"),
    Booking(2, "A0476", 1638354036, "Finished"),
    Booking(3, "B0476", 1638333543, "Finished"),
    Booking(4, "D0476", 1638333543, "Cancelled"),
    Booking(5, "W0476", 1638333543, "Finished"),
    Booking(6, "Q0476", 1638333543, "Cancelled"),
    Booking(7, "A0476", 1638333543, "Finished"),
    Booking(8, "H0476", 1638333543, "Finished"),
    Booking(9, "J0476", 1638333543, "Finished"),
    Booking(10, "L0476", 1638333543, "Cancelled"),
    Booking(11, "M0476", 1638333543, "Finished"),
    Booking(12, "N0476", 1638333543, "Finished"),
    Booking(13, "B0476", 1638333543, "Finished"),
    Booking(14, "V0476", 1638333543, "Cancelled"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: _myBookingList(context, _myBooking)
      ),
    );
  }
}

_formatDateTime(int timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String formattedDateTime = DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime).toString();

  return formattedDateTime;
}

Widget _myBookingList(BuildContext context, List<Booking> myBooking) {
  const TextStyle driverIdStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  const TextStyle dateStyle = TextStyle(fontSize: 12);
  const TextStyle statusStyle = TextStyle(fontSize: 12);
  return Column(
    children: List.generate(myBooking.length, (index) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BookingDetailsScreen(
              ),
            ),
          );
        },
        child: Wrap(
          //spacing: 5,
          runSpacing: 5,
          children: [
            Row(
              children: [
                const Text(
                  "Driver : ",
                  style: driverIdStyle,
                ),
                Text(
                  myBooking[index].driverId,
                  style: driverIdStyle,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Date : ",
                  style: dateStyle,
                ),
                Text(
                  _formatDateTime(myBooking[index].timeStamp),
                  style: dateStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  myBooking[index].status,
                  style: statusStyle,
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      );
    }),
  );
}
