import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidgets extends StatelessWidget {
    const ContactUsWidgets({Key? key}) : super(key: key);
    static const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

    @override
    Widget build(BuildContext context) {
        return Flex(direction: Axis.vertical, children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: [
                            Wrap(
                                runSpacing: 5,
                                children: [
                                    const Text(
                                        "Call to company",
                                        style: textStyle,
                                    ),
                                    const Divider(
                                        thickness: 1,
                                    ),
                                    const Text(
                                        "Email us",
                                        style: textStyle,
                                    ),
                                    const Divider(
                                        thickness: 1,
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: const [
                                            Text(
                                                "Legal",
                                                style: textStyle,
                                            ),
                                            Icon(Icons.arrow_forward_ios_rounded),
                                        ],
                                    ),
                                    const Divider(
                                        thickness: 1,
                                    ),
                                ],
                            ),
                        ],
                    ),
                ),
            ),
            _goToFacebookIcon()
        ]);
    }
}

Widget _goToFacebookIcon() {
    const String toLaunch = 'https://www.facebook.com/sophat777/';
    Future<void> _launchUniversalLinkIos(String url) async {
        if (await canLaunch(url)) {
            final bool nativeAppLaunchSucceeded = await launch(
                url,
                forceSafariVC: false,
                universalLinksOnly: true,
            );
            if (!nativeAppLaunchSucceeded) {
                await launch(
                    url,
                    forceSafariVC: true,
                );
            }
        }
    }
    return Expanded(
        flex: 1,
        child: Center(
            child: IconButton(
                icon: Image.asset("assets/facebook_icon.png"),
                iconSize: 100,
                onPressed: () {
                    _launchUniversalLinkIos(toLaunch);
                },
            )),
    );
}

