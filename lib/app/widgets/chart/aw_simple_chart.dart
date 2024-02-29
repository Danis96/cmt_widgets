part of widgets;

class AW_SimpleChart extends StatelessWidget {
  const AW_SimpleChart({this.listData = const <double>[], this.widgetKey, this.chartColor = const Color.fromRGBO(0, 0, 0, 1)});

  final Key? widgetKey;
  final Color? chartColor;
  final List<double?>? listData;

  double getMaxValueFromList(List<double?> durationPerHour) {
    double maxValue = 0.0;
    for (int i = 0; i < durationPerHour.length; i++) {
      if (durationPerHour[i] != null) {
        if (durationPerHour[i]! > maxValue) {
          maxValue = durationPerHour[i]!;
        }
      }
    }

    return maxValue + maxValue / 4;
  }

  List<BarChartGroupData> getBarChartGroupData(List<double?> durationPerHour) {
    final List<BarChartGroupData> listData = <BarChartGroupData>[];

    for (int i = 0; i < durationPerHour.length; i++) {
      if (durationPerHour[i] != null) {
        listData.add(
          BarChartGroupData(
            x: i,
            barRods: <BarChartRodData>[
              BarChartRodData(y: durationPerHour[i]!, colors: <Color>[chartColor!], borderRadius: BorderRadius.circular(0))
            ],
            showingTooltipIndicators: <int>[1],
          ),
        );
      } else {
        listData.add(
          BarChartGroupData(
            x: i,
            barRods: <BarChartRodData>[
              BarChartRodData(y: i.toDouble(), colors: <Color>[chartColor!], borderRadius: BorderRadius.circular(0))
            ],
            showingTooltipIndicators: <int>[1],
          ),
        );
      }
    }
    return listData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      height: 230,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(enabled: false),
          gridData: FlGridData(show: false),
          maxY: getMaxValueFromList(listData!),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              margin: 5,
              getTextStyles: (BuildContext context, double value) {
                if ((value % 2) == 0) {
                  return Theme.of(context).textTheme.bodyLarge;
                }
                return null;
              },
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return '00';
                  case 1:
                    return '';
                  case 2:
                    return '02';
                  case 3:
                    return '';
                  case 4:
                    return '04';
                  case 5:
                    return '';
                  case 6:
                    return '06';
                  case 7:
                    return '';
                  case 8:
                    return '08';
                  case 9:
                    return '';
                  case 10:
                    return '10';
                  case 11:
                    return '';
                  case 12:
                    return '12';
                  case 13:
                    return '';
                  case 14:
                    return '14';
                  case 15:
                    return '';
                  case 16:
                    return '16';
                  case 17:
                    return '';
                  case 18:
                    return '18';
                  case 19:
                    return '';
                  case 20:
                    return '20';
                  case 21:
                    return '';
                  case 22:
                    return '22';
                  case 23:
                    return '';
                  case 24:
                    return '24';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
          ),
          borderData: FlBorderData(show: false),
          barGroups: getBarChartGroupData(listData!),
        ),
      ),
    );
  }
}
