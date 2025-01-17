import 'package:demo_application/global_utils/constants.dart';
import 'package:demo_application/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'bottom_navigate_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Constants.LOGIN,
          action: []).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: ClipRRect(
                  child: Image.asset(Constants.CLOUD_IMAGE),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              Constants.LOGIN_TO_ACCOUNT,
              style: Get.textTheme.titleMedium!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.ENTER_USER_NAME,
                    style: Get.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  child: TextField(
                    style: Get.textTheme.titleSmall,
                    controller: userNameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).secondaryHeaderColor,
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.PASSWORD,
                    style: Get.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  child: TextField(
                    style: Get.textTheme.titleSmall,
                    controller: passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).secondaryHeaderColor,
                        contentPadding: const EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 8),
                onPressed: () {
                  if (userNameController.text.isEmpty) {
                    Fluttertoast.showToast(msg: Constants.ENTER_USER_NAME);
                    return;
                  } else if (passwordController.text.isEmpty) {
                    Fluttertoast.showToast(msg: Constants.ENTER_PASSWORD);
                    return;
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BottomNavigateBarScreen()));
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        Constants.LOGIN,
                        style: Get.textTheme.titleMedium!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.black,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
