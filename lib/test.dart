// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class BarChart extends StatelessWidget {
//   final List<ChartData> data;
//
//   BarChart({required this.data});
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<ChartData> data = [
//       ChartData(category: "Apples", value: 10, color: charts.MaterialPalette.blue.shadeDefault),
//       ChartData(category: "Oranges", value: 1, color: charts.MaterialPalette.red.shadeDefault),
//       ChartData(category: "Bananas", value: 15, color: charts.MaterialPalette.green.shadeDefault),ChartData(category: "Apples", value: 10, color: charts.MaterialPalette.blue.shadeDefault),
//       ChartData(category: "Oranges", value: 1, color: charts.MaterialPalette.red.shadeDefault),
//       ChartData(category: "Bananas", value: 15, color: charts.MaterialPalette.green.shadeDefault),ChartData(category: "Apples", value: 10, color: charts.MaterialPalette.blue.shadeDefault),
//       ChartData(category: "Oranges", value: 1, color: charts.MaterialPalette.red.shadeDefault),
//       ChartData(category: "Bananas", value: 15, color: charts.MaterialPalette.green.shadeDefault),
//     ];
//
//     BarChart(data: data);
//     List<charts.Series<ChartData, String>> series = [
//       charts.Series(
//         id: "Data",
//         data: data,
//         domainFn: (ChartData series, _) => series.category,
//         measureFn: (ChartData series, _) => series.value,
//         colorFn: (ChartData series, _) => series.color,
//       ), charts.Series(
//         id: "Data",
//         data: data,
//         domainFn: (ChartData series, _) => series.category,
//         measureFn: (ChartData series, _) => series.value,
//         colorFn: (ChartData series, _) => series.color,
//       ), charts.Series(
//         id: "Data",
//         data: data,
//         domainFn: (ChartData series, _) => series.category,
//         measureFn: (ChartData series, _) => series.value,
//         colorFn: (ChartData series, _) => series.color,
//       ), charts.Series(
//         id: "Data",
//         data: data,
//         domainFn: (ChartData series, _) => series.category,
//         measureFn: (ChartData series, _) => series.value,
//         colorFn: (ChartData series, _) => series.color,
//       ),
//     ];
//
//     return Container(
//       height: 400,
//       padding: EdgeInsets.all(20),
//       child: Card(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Text(
//                 'Sales by Category',
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//               Expanded(
//                 child: charts.BarChart(
//                   series,
//                   animate: true,
//                   vertical: true,
//                   barRendererDecorator: charts.BarLabelDecorator<String>(),
//                   domainAxis: new charts.OrdinalAxisSpec(),
//
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ChartData {
//   final String category;
//   final int value;
//   final charts.Color color;
//
//   ChartData({required this.category, required this.value, required this.color});}
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:charts_flutter/flutter.dart' as charts;
// //
// // class CircleChart extends StatelessWidget {
// //   final List<ChartData> data;
// //
// //   CircleChart({required this.data});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     List<ChartData> data = [
// //       ChartData(category: "Apples", value: 10, color: charts.MaterialPalette.blue.shadeDefault),
// //       ChartData(category: "Oranges", value: 5, color: charts.MaterialPalette.red.shadeDefault),
// //       ChartData(category: "Bananas", value: 15, color: charts.MaterialPalette.green.shadeDefault),
// //     ];
// //
// //     CircleChart(data: data);
// //     List<charts.Series<ChartData, String>> series = [
// //       charts.Series(
// //         id: "Data",
// //         data: data,
// //         domainFn: (ChartData series, _) => series.category,
// //         measureFn: (ChartData series, _) => series.value,
// //         colorFn: (ChartData series, _) => series.color,
// //         labelAccessorFn: (ChartData series, _) => '${series.category}: ${series.value}',
// //       ),
// //     ];
// //
// //     return Container(
// //       height: 400,
// //       padding: EdgeInsets.all(20),
// //       child: Card(
// //         child: Padding(
// //           padding: EdgeInsets.all(8.0),
// //           child: Column(
// //             children: <Widget>[
// //               Text(
// //                 'Sales by Category',
// //                 style: Theme.of(context).textTheme.headline6,
// //               ),
// //               Expanded(
// //                 child: charts.PieChart(
// //                   series,
// //                   animate: true,
// //                   defaultRenderer: charts.ArcRendererConfig(
// //                       arcRendererDecorators: [
// //                         charts.ArcLabelDecorator(
// //                           labelPosition: charts.ArcLabelPosition.outside,
// //                           leaderLineColor: charts.Color.black,
// //                           outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 14),
// //                         )
// //                       ]
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class ChartData {
// //   final String category;
// //   final int value;
// //   final charts.Color color;
// //
// //   ChartData({required this.category, required this.value, required this.color});
// // }



