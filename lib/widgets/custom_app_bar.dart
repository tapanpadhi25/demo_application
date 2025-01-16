import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar{
  final Widget leading;
  final String title;
  final List<Widget> action;
  bool? centerTitle;
  CustomAppBar({required this.leading, required this.title, required this.action, this.centerTitle = true });
  PreferredSizeWidget getAppBar(){
    return PreferredSize(
      preferredSize:  const Size.fromHeight(kToolbarHeight),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: AppBar(
          backgroundColor: const Color(0xffFBEB5A),
          centerTitle: centerTitle,
          title: Text(title,style: Get.textTheme.titleMedium,),
          leading: leading,
          actions: action,
        ),
      ),
    );
  }
}