import 'package:bwv2/pages/components/statistics_card.dart';
import 'package:flutter/material.dart';

class StatisticsSection extends StatefulWidget {
  const StatisticsSection({super.key, this.stats});

  final List<Map<String, dynamic>>? stats;

  @override
  State<StatisticsSection> createState() => _StatisticsSectionState();
}

class _StatisticsSectionState extends State<StatisticsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            bottom: 5.0,
          ),
          child: Text(
            "Interesting Stats",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 4.0,
          ),
          child: Row(
            children: [
              StatisticsCard(
                title: widget.stats?[0]["title"] ?? "",
                value: widget.stats?[0]["value"] ?? "",
                color: Colors.blue[700]!,
              ),
              const SizedBox(width: 12),
              StatisticsCard(
                title: widget.stats?[1]["title"] ?? "",
                value: widget.stats?[1]["value"] ?? "",
                color: Colors.green[600]!,
              ),
              const SizedBox(width: 12),
              StatisticsCard(
                title: widget.stats?[2]["title"] ?? "",
                value: widget.stats?[2]["value"] ?? "",
                color: Colors.orange[700]!,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
