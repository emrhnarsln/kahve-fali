import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  final String? selectedMood;
  final Function(String) onMoodSelected;

  const MoodSelector({
    required this.selectedMood,
    required this.onMoodSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final moods = {
      'mutlu': Icons.sentiment_very_satisfied,
      'üzgün': Icons.sentiment_dissatisfied,
      'kızgın': Icons.sentiment_very_dissatisfied,
      'heyecanlı': Icons.star,
      'yorgun': Icons.bedtime,
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: moods.entries.map((entry) {
        final isSelected = selectedMood == entry.key;
        return GestureDetector(
          onTap: () => onMoodSelected(entry.key),
          child: Column(
            children: [
              Icon(
                entry.value,
                color: isSelected ? Colors.brown : Colors.grey,
                size: 40,
              ),
              Text(entry.key),
            ],
          ),
        );
      }).toList(),
    );
  }
}
