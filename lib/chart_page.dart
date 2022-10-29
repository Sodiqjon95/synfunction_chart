import 'package:charts_project/data_table.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key, required this.students}) : super(key: key);
  final List<Students> students;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  late List<ChartData> data = List.generate(
    students.length,
    (index) => ChartData(
      students[index].name,
      students[index].score,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SfCircularChart(
          legend: Legend(
            isResponsive: true,
            image: NetworkImage('https://source.unsplash.com/random/'),
            orientation: LegendItemOrientation.horizontal,
            padding: 20,
            position: LegendPosition.top,
            iconBorderWidth: 0,
            isVisible: true,
            iconHeight: 20,
            toggleSeriesVisibility: false,
            iconWidth: 20,
            title: LegendTitle(
              text: "Students",
              textStyle: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
            ),
            backgroundColor: Colors.yellow,

          ),
          series: <CircularSeries>[
            RadialBarSeries<ChartData, String>(
                innerRadius: '50%',
                maximumValue: 10,
                name: 'Users',
                radius: '100%',
                gap: '1%',
                onPointTap: (v) {
                  debugPrint(v.toString());
                },
                cornerStyle: CornerStyle.endCurve,
                pointRadiusMapper: (c, i) {},
                dataSource: data,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
