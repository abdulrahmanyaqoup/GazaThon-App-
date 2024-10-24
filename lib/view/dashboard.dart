import 'package:feutric_app/view/detailed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import the syncfusion charts package

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // List of items for the GridView
  final List<Map<String, dynamic>> gridItems = [
    {'name': 'منشأة سكنية', 'percentage': '95%'},
    {'name': 'منشأة ترفيهية', 'percentage': '40%'},
    {'name': 'منشأة طبية', 'percentage': '88%'},
    {'name': 'منشأة تعليمية', 'percentage': '85%'},
    {'name': 'منشأة تجارية', 'percentage': '60%'},
    {'name': 'منشأة حكومية', 'percentage': '92%'},
    {'name': 'منشأة زراعية', 'percentage': '62%'},
    {'name': 'منشأة صناعية', 'percentage': '45%'},
    {'name': 'منشأة خدمية', 'percentage': '72%'},
    {'name': 'منشأة أخرى', 'percentage': '30%'},
  ];

  // Colors to alternate between const Color(0xFF008080) and 0xFF800020   0xFF008080
  final List<Color> alternatingColors = [
    const Color(0xFF008080),
    const Color(0xFF800020),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'منطقة خان يونس',
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF800020),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // GridView with 2 cross axis and alternating colors
            Expanded(
              flex: 2, // Flex to control how much space GridView takes
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items in a row
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.5, // Adjust for item size
                ),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailedPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: alternatingColors[index % 2],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              gridItems[index]['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              gridItems[index]['percentage'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30), // Space between GridView and Bar Chart

            // Bar Chart with 5 items
            Expanded(
              flex: 1, // Flex to control how much space BarChart takes
              child: SfCartesianChart(
                primaryXAxis:
                    const CategoryAxis(), // X-axis with category labels
                title: ChartTitle(
                  text: 'نسب الأضرار',
                  textStyle: GoogleFonts.rubik(
                    color: const Color(0xFF800020),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries>[
                  // Render bar chart
                  BarSeries<_ChartData, String>(
                    dataSource: _getChartData(),
                    xValueMapper: (_ChartData data, _) => data.name,
                    yValueMapper: (_ChartData data, _) => data.value,
                    pointColorMapper: (_ChartData data, _) =>
                        data.color, // Use different colors for each bar
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true, textStyle: TextStyle(fontSize: 12)),
                    // Display percentage on top of the bar
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to get the chart data (using percentages)
  List<_ChartData> _getChartData() {
    return <_ChartData>[
      _ChartData('دمار بليغ', 49, Colors.red), // 49% for red
      _ChartData('دمار كلي', 20, Colors.orange), // 20% for orange
      _ChartData('دمار شديد', 16,
          const Color(0xFF008080)), // 13% for const Color(0xFF008080)
      _ChartData('مدمر جزئيا', 11, Colors.grey), // 14% for amber
      _ChartData('شبه سليم', 4, Colors.green), // 4% for green
    ];
  }
}

// Class to hold the chart data
class _ChartData {
  _ChartData(this.name, this.value, this.color);
  final String name;
  final double value;
  final Color color;
}
