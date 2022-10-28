import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ChartData> data = [
    ChartData('David', 2,),
    ChartData('Steve', 3),
    ChartData('Jack', 8),
    ChartData('Others', 10),
    ChartData('John', 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SfCircularChart(
          legend: Legend(
            image: NetworkImage('https://source.unsplash.com/random/'),
            orientation: LegendItemOrientation.vertical,
            padding: 20,
            position: LegendPosition.bottom,
            iconBorderWidth: 30,
            isVisible: true,
            iconHeight: 50,
            toggleSeriesVisibility: false,
            iconWidth: 50,
          ),
          series: <CircularSeries>[
            RadialBarSeries<ChartData, String>(
                innerRadius: '50%',
                maximumValue: 10,
                name: 'Users',
                radius: '80%',
                gap: '5%',
                onPointTap: (v){
                  debugPrint(v.toString());
                },
                cornerStyle: CornerStyle.bothFlat,
                pointRadiusMapper: (c, i){},
                dataSource: data,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y
            )
          ],
        ));
  }
}

  class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
  }
