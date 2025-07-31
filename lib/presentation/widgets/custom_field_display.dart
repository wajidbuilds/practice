import 'package:flutter/material.dart';

class CustomFieldDisplay extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? iconColor;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry padding;

  const CustomFieldDisplay({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.labelStyle,
    this.valueStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Icon(icon, color: iconColor ?? Colors.black, size: 20),
          if (icon != null)
            const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black, // Text color black
                ),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: labelStyle ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  TextSpan(
                    text: value,
                    style: valueStyle ??
                        const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
