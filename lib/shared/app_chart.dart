import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_run/shared/app_colors.dart';

class AppCustomizedChart extends StatefulWidget {
  @override
  _AppCustomizedChartState createState() => _AppCustomizedChartState();
}

class _AppCustomizedChartState extends State<AppCustomizedChart> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white30,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
              const TextStyle(color: Colors.black45, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '7:23am';
              case 2:
                return '8:06am';
              case 3:
                return '3:27pm';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) =>
              const TextStyle(color: Colors.black45, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '130';
              case 1:
                return '140';
              case 2:
                return '150';
              case 3:
                return '160';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.white30))),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 3,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 2),
            FlSpot(2, 1),
            FlSpot(3, 2.5),
          ],
          isCurved: true,
          colors: [Colors.white54],
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
              show: true,
              getDotPainter: (_, __, ___, ____) {
                return FlDotCirclePainter(
                    color: AppColors.secondaryColor,
                    strokeColor: Colors.transparent,
                    strokeWidth: 3);
              }),
        ),
      ],
    );
  }
}
