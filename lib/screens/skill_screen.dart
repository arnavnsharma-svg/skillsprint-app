import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class SkillScreen extends StatelessWidget {
  const SkillScreen({super.key});

  int getTotalScore() {
    int total = 0;
    skillData.values.forEach((value) {
      total += value;
    });
    return (total / skillData.length).round();
  }

  @override
  Widget build(BuildContext context) {
    final score = getTotalScore();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 SkillScore Card (MAIN HIGHLIGHT)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SkillScore",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                Text(
                  "$score",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Top 10% Developer 🚀",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // 🔹 Section Title
          const Text(
            "Your Skills",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // 🔹 Skill Cards
          ...skillData.entries.map((entry) {
            return _buildSkillCard(entry.key, entry.value);
          }).toList(),
        ],
      ),
    );
  }

  // 🔥 Premium Skill Card
  Widget _buildSkillCard(String skill, int value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill name + %
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$value%",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(value: value / 100, minHeight: 8),
          ),
        ],
      ),
    );
  }
}
