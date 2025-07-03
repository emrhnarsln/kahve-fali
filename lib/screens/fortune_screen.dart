import 'package:flutter/material.dart';

import '../utils/fortune_data.dart';
import '../widgets/mood_selector.dart';
import '../widgets/flip_cup.dart';

class FortuneScreen extends StatefulWidget {
  const FortuneScreen({super.key});

  @override
  State<FortuneScreen> createState() => _FortuneScreenState();
}

class _FortuneScreenState extends State<FortuneScreen> {
  String? selectedMood;
  String fortuneText = '';
  bool isCupFlipped = true;

  void generateFortune() {
    if (selectedMood == null) {
      setState(() {
        fortuneText = 'Lütfen bir ruh hali seçiniz!';
      });
    } else {
      setState(() {
        fortuneText = getRandomFortune(selectedMood!);
      });
    }
  }

  void handleShowFortune() {
    setState(() {
      isCupFlipped = false;
    });
    generateFortune();
  }

  void handleMoodChange(String mood) {
    setState(() {
      selectedMood = mood;
      isCupFlipped = true;
      fortuneText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/images/kahve.jpg'),
              radius: 16,
            ),
            const Text(
              'Kahve Falı',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFF3E0),
      body: Stack(
        children: [
          // 🔽 Sadece alt kısmı dumanla kaplayan Positioned görsel
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'lib/assets/images/kahve_dumani.png',
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlipCup(isFlipped: isCupFlipped),

                const SizedBox(height: 20),

                MoodSelector(
                  selectedMood: selectedMood,
                  onMoodSelected: handleMoodChange,
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: handleShowFortune,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                  ),
                  child: const Text(
                    'Falı Göster',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100.withAlpha((0.9 * 255).toInt()),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    fortuneText,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    const SizedBox(height: 15),
                    const Text(
                      '☕ “Bir fincan kahve, kırk yıl hatır demektir.”',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
