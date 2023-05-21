import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro_timer/core_utils/context_utils.dart';
import 'package:pomodoro_timer/core_utils/datetime_utils.dart';
import 'package:pomodoro_timer/main/timer/timer_store.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsComponent extends StatefulWidget {
  const StatisticsComponent({Key? key}) : super(key: key);

  @override
  State<StatisticsComponent> createState() => _StatisticsComponentState();
}

class _StatisticsComponentState extends State<StatisticsComponent> {
  late final _store = context.read<TimerStore>();
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = _store.timerSessions
        .map((session) => _ChartData(
            session?.sessionDate.monthName ?? DateTime.now().toString(), _store.completedSessions.toDouble()))
        .toList();

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: _buildClearTimersButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            'Statistics',
            style: context.textStyles.headlineLarge?.copyWith(color: context.colors.onBackground),
          ),
        ),
        body: _buildContent(context),
      );

  Widget _buildContent(BuildContext context) => Center(
        child: Stack(
          children: [
            Column(
              children: [
                _cartesianChart(),
                Expanded(child: _buildTimerSessionsBoard(context)),
              ],
            )
          ],
        ),
      );

  Widget _buildTimerSessionsBoard(BuildContext context) => Observer(
        builder: (context) => ListView.separated(
          itemCount: _store.timerSessions.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (context, index) => ListTile(
            title: Center(
              child: Wrap(
                children: [
                  Text(
                    _store.timerSessions[index]?.sessionName ?? 'No name',
                    style: context.textStyles.subtitle2,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    _store.timerSessions[index]?.sessionDate.dayAndMonthName ?? DateTime.now().toString(),
                    style: context.textStyles.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildClearTimersButton(BuildContext context) =>
      IconButton(onPressed: () => _store.clearTimerSessions(), icon: const Icon(Icons.delete_forever));

  Widget _cartesianChart() => SizedBox(
        width: double.infinity,
        height: 150,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 20, interval: 5),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.currentMonth,
              yValueMapper: (_ChartData data, _) => data.completedSessions,
              name: 'Completed sessions',
              color: const Color.fromRGBO(8, 142, 255, 1),
            )
          ],
        ),
      );
}

class _ChartData {
  _ChartData(this.currentMonth, this.completedSessions);

  final String currentMonth;
  final double completedSessions;
}
