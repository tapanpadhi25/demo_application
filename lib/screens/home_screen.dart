import 'package:demo_application/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global_utils/constants.dart';
import '../global_utils/global_utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Constants.HOME,
          action: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                ))
          ]).getAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(Constants.PUNCH_IN, style: Get.textTheme.titleMedium!),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      value: isTrue,
                      onChanged: (value) {
                        setState(() {
                          isTrue = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            Constants.TASK_STATUS,
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                ...List.generate(statusList.length, (index) {
                  return Container(
                    height: MediaQuery.sizeOf(context).height*0.12,
                    width: MediaQuery.sizeOf(context).width *0.25,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2, 2.1),
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            statusList[index]['count'].toString(),
                            style: Get.textTheme.titleSmall!
                                .copyWith(fontSize: 30),
                          ),
                          Text(
                            statusList[index]['status'],
                            style: Get.textTheme.titleSmall!.copyWith(
                                color: (index == 0)
                                    ? Colors.red
                                    : (index == 1)
                                        ? Colors.blue
                                        : Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: MediaQuery.sizeOf(context).height*0.4,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(Constants.MAP_IMAGE,fit: BoxFit.fill,),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).primaryColor),
              color: const Color(0xffF3F2F2),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${Constants.NAME}XXXXX",style: Get.textTheme.titleSmall!.copyWith(),),
                    Text("${Constants.VEHICLE}KA O1 JK2345",style: Get.textTheme.titleSmall!.copyWith(),),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Text("${Constants.WORD}5",style: Get.textTheme.titleSmall!.copyWith(color: Colors.white),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                      child: Row(
                        children: [
                          Text("9886745344 ",style: Get.textTheme.titleSmall!.copyWith(color: Colors.black),),
                          Image.asset(Constants.OUT_GOING_CALL),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black12)
              ),
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Constants.VIEW_DRIVER_LIST,style: Get.textTheme.titleSmall!.copyWith(color: Colors.white),),
                  const Icon(Icons.arrow_forward_ios,size: 10,color: Colors.white,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
