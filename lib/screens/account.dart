import 'package:flutter/material.dart';
import 'package:passapp_clone/models/user.dart';
import 'package:passapp_clone/models/user_data.dart';
import 'package:passapp_clone/screens/base_screen.dart';
import '../components/text_with_icon.dart';
import './my_booking.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const _versionTextStyle =
      TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);
  static final User _user = User(
      1,
      "Sophat Heang",
      "profile.png",
      UserData(
          5,
          9899,
      )
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _profile(_user),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              runSpacing: 2,
              children: [
                _textWithIcon(
                    context: context,
                    icon: Icons.star,
                    label: "Earned Point",
                    param: _user.userData.points.toString(),
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is Earned Points Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textWithIcon(
                        context: context,
                        icon: Icons.qr_code_2_sharp,
                        label: "Referral",
                        param: _user.userData.refferal.toString(),
                        onTap: () {
                          _goToPage(context, const BaseScreen(text: "This is Referral Screen",));
                        }),
                    const Icon(Icons.share),
                  ],
                ),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.book,
                    label: "My Booking",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is My Booking Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.room,
                    label: "Saved Places",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is Saved Places Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.credit_card,
                    label: "Payment method",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is Payment Method Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.settings,
                    label: "Settings",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is Settings Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.message,
                    label: "Contact us",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is ContacUs Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                _textWithIcon(
                    context: context,
                    icon: Icons.power_settings_new,
                    label: "Log out",
                    onTap: () {
                      _goToPage(context, const BaseScreen(text: "This is Log out Screen",));
                    }),
                const Divider(
                  thickness: 1,
                ),
                Center(child: _appVersion(_versionTextStyle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _textWithIcon(
    {required BuildContext context,
    required IconData icon,
    required String label,
    String? param,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: TextWithIcon(
      icon: icon,
      label: label,
      parameter: param,
    ),
  );
}

void _goToPage(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Widget _profile(User user) {
  return Container(
    width: double.infinity,
    color: Colors.deepOrange,
    child: Column(
      children: [
        ClipOval(
          child: Material(
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset("assets/${user.profileName}"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            user.name,
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

Widget _appVersion(TextStyle textStyle) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Text(
      "Version Clone : 2.2.40",
      style: textStyle,
    ),
  );
}
