import 'dart:developer';

import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppoimentPieChart extends StatefulWidget {
  const AppoimentPieChart({super.key});

  @override
  State<AppoimentPieChart> createState() => _AppoimentPieChartState();
}

class _AppoimentPieChartState extends State<AppoimentPieChart> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppoimentProvider>(context, listen: false).adminappoimentGet();
  }

  @override
  Widget build(BuildContext context) {
    var appointments = Provider.of<AppoimentProvider>(context, listen: false)
        .listOfAppoimentFOrAdmin;

    var days = appointments.map((e) => e.day).toList();
    var sanitizedDays =
        days.map((e) => e.replaceAll(RegExp(r'[, ]'), '')).toList();

    const weekDays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    var dayCounts = Map.fromIterable(
      weekDays,
      key: (day) => day,
      value: (day) => sanitizedDays.where((d) => d == day).length,
    );

    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(
        title: const Text('Bar Chart'),
        backgroundColor: ColorsConstents.witeColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AspectRatio(
          aspectRatio: 1.1,
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.toY.round().toString(),
                      const TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                      const titles = [
                        'Sun',
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat'
                      ];
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 10,
                        child: Text(titles[value.toInt()], style: style),
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(7, (index) {
                String day = weekDays[index];
                double count = dayCounts[day]?.toDouble() ?? 0;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: count,
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.cyan],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ],
                  showingTooltipIndicators: [],
                );
              }),
              gridData: const FlGridData(show: true),
              alignment: BarChartAlignment.spaceAround,
              maxY: 15,
            ),
          ),
        ),
      ),
    );
  }
}
