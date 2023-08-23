import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_boilerplate/view_model/controller/allcovid_cases_controller.dart';
import 'package:my_flutter_boilerplate/views/home_screen/home_screen_component/home_screen_comp.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final colorList = <Color>[
    Colors.red,
    Colors.blue,
    const Color.fromARGB(255, 2, 84, 16),
  ];

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var allcovidCasesController = Get.put(AllCovidCasesController());
    double responsiveHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (allcovidCasesController.isLoading.value) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: responsiveHeight * .0099,
                  ),
                  PieChart(
                      dataMap: {
                        "Total": double.parse(
                            allcovidCasesController.isDataAvailable.value
                                ? allcovidCasesController.allCovidCasesModel[0]
                                        ["cases"]
                                    .toString()
                                : "0"),
                        "Death": double.parse(
                            allcovidCasesController.isDataAvailable.value
                                ? allcovidCasesController.allCovidCasesModel[0]
                                        ["deaths"]
                                    .toString()
                                : "0"),
                        "Recovered": double.parse(
                            allcovidCasesController.isDataAvailable.value
                                ? allcovidCasesController.allCovidCasesModel[0]
                                        ["recovered"]
                                    .toString()
                                : "0"),
                      },
                      // other properties
                      animationDuration: const Duration(milliseconds: 1200),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 25,
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.left,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: responsiveHeight * .06,
                    ),
                    child: Card(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          GetBuilder<AllCovidCasesController>(
                            builder: (controller) {
                              if (controller.isDataAvailable.value) {
                                return Column(
                                  children: [
                                    HomeScreenComponents(
                                      title: "Today Cases",
                                      value: controller.allCovidCasesModel[0]
                                              ["todayCases"]
                                          .toString(),
                                    ),
                                    HomeScreenComponents(
                                      title: "Today Deaths",
                                      value: controller.allCovidCasesModel[0]
                                              ["todayDeaths"]
                                          .toString(),
                                    ),
                                    HomeScreenComponents(
                                      title: "Today Recovered",
                                      value: controller.allCovidCasesModel[0]
                                              ["todayRecovered"]
                                          .toString(),
                                    ),
                                    HomeScreenComponents(
                                      title: "Total Deaths",
                                      value: controller.allCovidCasesModel[0]
                                              ["deaths"]
                                          .toString(),
                                    ),
                                    HomeScreenComponents(
                                      title: "Total Recovered",
                                      value: controller.allCovidCasesModel[0]
                                              ["recovered"]
                                          .toString(),
                                    ),
                                    HomeScreenComponents(
                                      title: "Total Cases",
                                      value: controller.allCovidCasesModel[0]
                                              ["cases"]
                                          .toString(),
                                    ),

                                    // Other components here
                                  ],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 35, 108, 37),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text("Track Countries"),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
