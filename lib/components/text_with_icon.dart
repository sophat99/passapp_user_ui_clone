import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
    final IconData icon;
    final String label;
    final String? parameter;
    final TextStyle? textStyle;

    const TextWithIcon(
        {Key? key,
            required this.icon,
            required this.label,
            this.parameter,
            this.textStyle = const TextStyle(fontSize: 17, color: Colors.black),
        })
        : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Row(
                children: [
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(
                            icon,
                            size: 30,
                        )),
                    Text(
                        parameter != null ? "$label : $parameter" : label,
                        style: textStyle,
                    ),
                ],
            );
    }
}