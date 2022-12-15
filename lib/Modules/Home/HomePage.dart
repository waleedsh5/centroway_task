import 'package:centroway_task/Helpers/AssetHelper.dart';
import 'package:centroway_task/Modules/Home/HomeGetxController.dart';
import 'package:centroway_task/Widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Widgets/BottomAppBarWidget.dart';
import '../../Widgets/DiscountList.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  HomeGetxController homeGetxController = Get.put(HomeGetxController());
  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  List<GlobalKey> _formKeys = [];
  late ScrollController scrollController;
  bool isShow = true;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset <= 5) {
        setState(() {
          isShow = true;
        });
      } else {
        setState(() {
          isShow = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: GetBuilder<HomeGetxController>(
        builder: (controller) {
          return controller.isLoadingRequest
              ? const LoadingWidjet()
              : CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    sliverAppBarWidget(isShow),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 16.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Store name",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 30,
                                      child: TextButton.icon(
                                        icon: const Icon(Icons.info_outline,
                                            size: 16),
                                        label: const Text("info"),
                                        onPressed: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              storeInfo(), // Store information
                              SizedBox(
                                height: 15.h,
                              ),

                              Divider(
                                  color: Colors.grey.shade300, thickness: 0.8),
                              const DiscountList(), // Discount List
                              Divider(
                                  color: Colors.grey.shade300, thickness: 0.8),
                              SizedBox(
                                height: 15.h,
                              ),

                              /// CUSTOM TABBAR
                              SizedBox(
                                height: 40.h,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            Scrollable.ensureVisible(
                                                duration: Duration(seconds: 1),
                                                _formKeys[index]
                                                    .currentContext!);

                                            setState(() {
                                              currentIndex = index;
                                            });
                                            print(currentIndex);
                                          },
                                          child: Container(
                                            margin: EdgeInsetsDirectional.only(
                                              start: 15.w,
                                            ),
                                            alignment:
                                                AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: currentIndex == index
                                                    ? Colors.red.shade100
                                                    : Colors.white),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                controller.homeData!
                                                    .data![index].name!,
                                                style: TextStyle(
                                                    overflow: TextOverflow.fade,
                                                    color: currentIndex == index
                                                        ? Colors.red.shade300
                                                        : Colors.grey,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                    itemCount: 5),
                              ),
                              // End of Tab Bar

                              ListView.separated(
                                itemCount: controller.homeData!.data!.length,
                                // itemPositionsListener: itemPositionsListener,
                                // itemScrollController: itemController,
                                // padding: EdgeInsetsDirectional.only(top: 20),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final key = GlobalKey();
                                  _formKeys.add(key);

                                  return Column(
                                    key: _formKeys[index],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.all(16),
                                        child: Text(
                                          controller
                                              .homeData!.data![index].name!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: controller.homeData!
                                            .data![index].items!.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index2) =>
                                            GestureDetector(
                                          onTap: () {
                                            BottomSheet(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 90.h,
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: const DecorationImage(
                                                            image: NetworkImage(
                                                                "https://media.istockphoto.com/id/1054228718/photo/indian-sweets-in-a-plate-includes-gulab-jamun-rasgulla-kaju-katli-morichoor-bundi-laddu.jpg?s=612x612&w=0&k=20&c=hYWCXLaldKvhxdBa83M0RnUij7BCmhf-ywWdvyIXR40="),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(controller
                                                              .homeData!
                                                              .data![index]
                                                              .items![index2]
                                                              .name!),
                                                          const Text(
                                                              "Spiced, buttery rice with 6 pcs of Hot Shots topped with our signature ",
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          const Text(
                                                            "500\$",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: 15.h,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                    color: Colors.grey.shade300, thickness: 5),
                              ),
                            ],
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: BottomAppBarWidget(),
      ),
    );
  }

  void BottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      backgroundColor: Colors.white,
      constraints: BoxConstraints(maxHeight: .8.sh, minHeight: 100.h),
      (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AssetHelper.chocoSweet),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 15.w, top: 15.h),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Meat Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "2.60 OMR",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: SvgPicture.asset(
                      AssetHelper.shareIcon,
                      color: Colors.blue,
                      width: 30.w,
                      height: 30.h,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "With Orange juice / tea / water ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  const Icon(
                    Icons.chat,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Text(
                    "Add Message for Resturant",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget storeInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Healthy , Breakfast, Dinner",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetHelper.starlogo),
              SizedBox(
                width: 10.w,
              ),
              const Text("4.6(100) "),
              const Text(
                "Reviews ",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetHelper.timeclock),
              SizedBox(
                width: 10.w,
              ),
              const Text("10:00 Am - 10:00 PM "),
              const Text(
                "Opening ",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetHelper.timeralarm),
              SizedBox(
                width: 10.w,
              ),
              const Text("During 15 - 25 min ( Delivery Fee \$20 ) "),
            ],
          ),
        ],
      ),
    );
  }

  Widget sliverAppBarWidget(bool isShow) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Colors.grey,
          ),
        ),
      ),
      leadingWidth: 40,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 8.w,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22.r,
            child: const Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22.r,
              child: IconButton(
                icon: SvgPicture.asset(AssetHelper.shareIcon),
                onPressed: () {},
              )),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22.r,
            child: const Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.white,
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 160.0,
      flexibleSpace: FlexibleSpaceBar(
        title: !isShow
            ? const Text(
                'Store Name',
                style: TextStyle(color: Colors.black),
              )
            : Container(),
        background: SizedBox(
          width: double.infinity,
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
            height: .25.sh,
          ),
        ),
      ),
    );
  }
}
