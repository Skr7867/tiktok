import 'dart:core';

import 'package:fl_chart/fl_chart.dart';

import '../enum/enum.dart';

DashboardMetric selectedMetric = DashboardMetric.conversionRate;

List<FlSpot> lineChartData() {
  switch (selectedMetric) {
    case DashboardMetric.totalCustomers:
      return [
        FlSpot(0, 200),
        FlSpot(1, 280),
        FlSpot(2, 350),
        FlSpot(3, 480),
        FlSpot(4, 600),
        FlSpot(5, 720),
        FlSpot(6, 850),
        FlSpot(7, 950),
        FlSpot(8, 1100),
        FlSpot(9, 1180),
        FlSpot(10, 1247),
      ];

    case DashboardMetric.eligibleCustomers:
      return [
        FlSpot(0, 120),
        FlSpot(1, 180),
        FlSpot(2, 260),
        FlSpot(3, 330),
        FlSpot(4, 410),
        FlSpot(5, 500),
        FlSpot(6, 600),
        FlSpot(7, 680),
        FlSpot(8, 760),
        FlSpot(9, 810),
        FlSpot(10, 856),
      ];

    case DashboardMetric.totalEarnings:
      return [
        FlSpot(0, 0.5),
        FlSpot(1, 0.7),
        FlSpot(2, 0.9),
        FlSpot(3, 1.2),
        FlSpot(4, 1.4),
        FlSpot(5, 1.7),
        FlSpot(6, 2.0),
        FlSpot(7, 2.2),
        FlSpot(8, 2.4),
        FlSpot(9, 2.6),
        FlSpot(10, 2.8),
      ];

    default:
      return [
        FlSpot(0, 58),
        FlSpot(1, 59),
        FlSpot(2, 60),
        FlSpot(3, 61),
        FlSpot(4, 63),
        FlSpot(5, 64),
        FlSpot(6, 66),
        FlSpot(7, 67),
        FlSpot(8, 69),
        FlSpot(9, 70),
        FlSpot(10, 72),
      ];
  }
}
