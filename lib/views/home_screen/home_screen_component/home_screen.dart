import 'package:flutter/material.dart';
import 'package:my_flutter_boilerplate/views/home_screen/home_screen_component/home_screen_comp.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final colorList = <Color>[
    Colors.blue,
    Colors.red,
    const Color.fromARGB(255, 2, 84, 16),
  ];

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double responsiveWidth = MediaQuery.of(context).size.width;
    double responsiveHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: responsiveHeight * .0099,
            ),
            PieChart(
              dataMap: const {
                "Total": 20,
                "Death": 5,
                "Recovered": 15,
              },
              animationDuration: const Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
              chartRadius: responsiveWidth / 3.2,
              legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                  legendLabels: {"name": "sheraz"}),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: responsiveHeight * .06,
              ),
              child: Card(
                child: Column(
                  children: [
                    HomeScreenComponents(title: "Total", value: "992220"),
                    HomeScreenComponents(title: "Recovered", value: "22220"),
                    HomeScreenComponents(title: "Death", value: "22220"),
                    HomeScreenComponents(title: "Active", value: "32220"),
                    HomeScreenComponents(title: "Critical", value: "12220"),
                    HomeScreenComponents(title: "Total Deaths", value: "8220"),
                    HomeScreenComponents(
                        title: "Total Recovered", value: "22220"),
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
            )
          ],
        ),
      )),
    );
  }
}
