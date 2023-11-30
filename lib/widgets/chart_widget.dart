import 'package:calculator/data/mock_data.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final List<CandleData> _data = MockDataTesla.candles;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(24.0),
      child: InteractiveChart(
        candles: _data,

        /** Example styling */
        // style: ChartStyle(
        //   priceGainColor: Colors.teal[200]!,
        //   priceLossColor: Colors.blueGrey,
        //   volumeColor: Colors.teal.withOpacity(0.8),
        //   trendLineStyles: [
        //     Paint()
        //       ..strokeWidth = 2.0
        //       ..strokeCap = StrokeCap.round
        //       ..color = Colors.deepOrange,
        //     Paint()
        //       ..strokeWidth = 4.0
        //       ..strokeCap = StrokeCap.round
        //       ..color = Colors.orange,
        //   ],
        //   priceGridLineColor: Colors.blue[200]!,
        //   priceLabelStyle: TextStyle(color: Colors.blue[200]),
        //   timeLabelStyle: TextStyle(color: Colors.blue[200]),
        //   selectionHighlightColor: Colors.red.withOpacity(0.2),
        //   overlayBackgroundColor: Colors.red[900]!.withOpacity(0.6),
        //   overlayTextStyle: TextStyle(color: Colors.red[100]),
        //   timeLabelHeight: 32,
        //   volumeHeightFactor: 0.2, // volume area is 20% of total height
        // ),
        /** Customize axis labels */
        // timeLabel: (timestamp, visibleDataCount) => "📅",
        // priceLabel: (price) => "${price.round()} 💎",
        /** Customize overlay (tap and hold to see it)
             ** Or return an empty object to disable overlay info. */
        // overlayInfo: (candle) => {
        //   "💎": "🤚    ",
        //   "Hi": "${candle.high?.toStringAsFixed(2)}",
        //   "Lo": "${candle.low?.toStringAsFixed(2)}",
        // },
        /** Callbacks */
        // onTap: (candle) => print("user tapped on $candle"),
        // onCandleResize: (width) => print("each candle is $width wide"),
      ),
    );
  }

  _computeTrendLines() {
    final ma7 = CandleData.computeMA(_data, 7);
    final ma30 = CandleData.computeMA(_data, 30);
    final ma90 = CandleData.computeMA(_data, 90);

    for (int i = 0; i < _data.length; i++) {
      _data[i].trends = [ma7[i], ma30[i], ma90[i]];
    }
  }

  _removeTrendLines() {
    for (final data in _data) {
      data.trends = [];
    }
  }
}
