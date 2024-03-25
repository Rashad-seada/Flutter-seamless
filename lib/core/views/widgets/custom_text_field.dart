import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../config/app_images.dart';
import '../../config/app_theme.dart';

class CustomTextField extends StatefulWidget {
  double? width;
  double? height;
  BorderRadius borderRadius;
  TextEditingController? controller;
  String? hint;
  String? label;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  void Function()? onEditingComplete;
  ValueChanged<String>? onChanged;
  void Function(PointerDownEvent)? onTapOutside;
  void Function()? onTap;
  void Function(String)? onFieldSubmitted;
  bool enabled;
  FocusNode? focusNode;
  bool isSecure;

  CustomTextField({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onEditingComplete,
    this.onChanged,
    this.onTapOutside,
    this.onTap,
    this.onFieldSubmitted,
    this.enabled = true,
    this.focusNode,
    this.isSecure = false
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool displaySecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      focusNode: widget.focusNode,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: widget.keyboardType,
      enabled: widget.enabled,
      onTapOutside: widget.onTapOutside,
      onChanged: widget.onChanged,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isSecure && displaySecureText,
      decoration: InputDecoration(
        filled: true,

        fillColor: Color(0xffecf1fd),

        suffixIcon: (widget.isSecure)? Padding(
          padding: EdgeInsets.all(3.w),
          child: InkWell(
            onTap: (){
              displaySecureText = !displaySecureText;
              setState(() {});
            },
            child: SvgPicture.asset(
              AppImages.eye,
              width: 3.w,
              height: 3.h,
            ),
          ),
        ) : null,
        contentPadding: EdgeInsets.symmetric(
            vertical: (widget.height == null) ? 1.5.h : widget.height!, horizontal: 3.w),
        // Adjust the vertical padding as needed


        hintText: widget.hint,
        labelText: widget.label,

        labelStyle: TextStyle(
          color: AppTheme.neutral400,
          fontSize: AppTheme.font16.sp,
          fontWeight: FontWeight.w400,
        ),



        prefixIcon: widget.prefixIcon,

        hintStyle: TextStyle(
          color: AppTheme.neutral400,
          fontSize: AppTheme.font14.sp,
          fontWeight: FontWeight.w400,
        ),

        disabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppTheme.neutral400, width: 1),
            borderRadius: widget.borderRadius),

        enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppTheme.neutral100, width: 1),
            borderRadius: widget.borderRadius),

        focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppTheme.neutral100, width: 1),
            borderRadius: widget.borderRadius),

        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.error, width: 1),
            borderRadius: widget.borderRadius),

        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.error, width: 1),
            borderRadius: widget.borderRadius),
      ),
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
