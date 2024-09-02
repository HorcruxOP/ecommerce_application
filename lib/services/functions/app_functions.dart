import 'package:ecommerce_application/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showCustomSnackbar(
    BuildContext context, String message, Color backgroundColor) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 16.0,
      right: 16.0,
      child: CustomSnackbar(
        message: message,
        backgroundColor: backgroundColor,
      ),
    ),
  );

  overlay.insert(overlayEntry);
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

class CustomSnackbar extends StatelessWidget {
  final String message;
  final String? leadingIcon;
  final Color backgroundColor;
  final Duration duration;
  final Widget? action;

  const CustomSnackbar({
    required this.message,
    this.backgroundColor = Colors.black,
    this.duration = const Duration(seconds: 2),
    super.key,
    this.action,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) SvgPicture.asset(leadingIcon ?? ""),
            Expanded(
              child: Text(
                message,
                style: BTextStyle.captionSemiBold(context),
              ),
            ),
            if (action != null) const SizedBox(width: 20),
            action ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
