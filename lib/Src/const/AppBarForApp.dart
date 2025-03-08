import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbarforapp extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onPressed;
  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? titleStyle;

  const Appbarforapp({
    super.key,
    this.onPressed,
    this.title,
    this.actions,
    this.backgroundColor,
    this.iconColor,
    this.titleStyle,
  });

  @override
  State<Appbarforapp> createState() => _AppbarforappState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Define the preferred size
}

class _AppbarforappState extends State<Appbarforapp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.only(left: 6.w),
        margin: EdgeInsets.only(left: 10.w, top: 10.h),
        decoration: BoxDecoration(
          color: Color(0xFF252525),
          borderRadius: BorderRadius.circular(17),
        ),
        child: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
            color: widget.iconColor ?? Color(0xFFDA6317),
          ),
        ),
      ),
     
    );
  }
}