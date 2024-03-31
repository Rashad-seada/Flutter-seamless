import 'package:Mawthoq/core/config/app_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart'; // استيراد الحزمة للعمل بنسبة الشاشة
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';

class BiometricAuthButton extends StatefulWidget {
  @override
  _BiometricAuthButtonState createState() => _BiometricAuthButtonState();
}

class _BiometricAuthButtonState extends State<BiometricAuthButton> {
  bool _isActive = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            if (_isActive) {
              bool isAuthenticated = await _authenticate();
              if (isAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('تمت المصادقة بنجاح'),
                ));
              }
            } else {
              setState(() {
                _isActive = !_isActive;
              });
            }
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
                decoration: BoxDecoration(
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

  Future<bool> _authenticate() async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: 'يرجى المصادقة للمتابعة',
        // biometricOnly: true, // تم إزالة هذا الخيار في الإصدار الحالي
        // useErrorDialogs: true, // تم إزالة هذا الخيار في الإصدار الحالي
        // stickyAuth: true, // تم إزالة هذا الخيار في الإصدار الحالي
      );
    } catch (e) {
      print(e);
      return false;
    }
  }
}
