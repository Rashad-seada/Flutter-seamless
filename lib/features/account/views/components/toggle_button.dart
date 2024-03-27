import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isActive = !_isActive;
            });
          },
          child: Container(
            width: 10.w,
            height: 4.w,
            decoration: BoxDecoration(
              color: _isActive ? AppTheme.primary900 : Colors.grey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: AnimatedAlign(
              alignment:
                  _isActive ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              child: Container(
                width: 3.5.w,
                height: 3.5.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
