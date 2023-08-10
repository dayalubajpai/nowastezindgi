import 'package:flutter/material.dart';
import '../textStyle.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool? loading;
  final IconData? icon;
  final String? image;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Function()? onTap;
  const LoginButton({
    Key? key,
    this.icon,
    required this.title,
    required this.color,
    this.image,
    this.borderColor,
    this.backgroundColor,
    this.fontWeight,
    this.onTap,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: double.infinity,
          height: 55,
          child: loading!
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor ?? Color(0xFFF6F6F6),
                      elevation: 0.0,
                      shadowColor: Colors.black54.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(
                          icon,
                          color: color,
                        ),
                        const SizedBox(width: 20),
                      ],
                      if (image != null) ...[
                        Image.asset(
                          image!,
                          width: 22,
                        ),
                        const SizedBox(width: 20),
                      ],
                      Text(title,
                          style: TextStyles.subheading
                              .copyWith(color: color, fontWeight: fontWeight)),
                    ],
                  ),
                )),
    );
  }
}
