import 'package:flutter/material.dart';
import 'package:pomodoro_timer/main/statistics/domain/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppCartesianChart extends StatefulWidget {
  final List<ChartData> data;

  const AppCartesianChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<AppCartesianChart> createState() => _AppCartesianChartState();
}

class _AppCartesianChartState extends State<AppCartesianChart> {
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 150,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 5),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: widget.data,
              xValueMapper: (ChartData data, _) => data.currentMonth,
              yValueMapper: (ChartData data, _) => data.completedSessions,
              name: 'Completed sessions',
              color: const Color.fromRGBO(8, 142, 255, 1),
            )
          ],
        ),
      );
}
