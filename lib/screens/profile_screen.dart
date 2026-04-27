import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 PROFILE HEADER
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Arnav",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Gold Tier Developer 🏆",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔥 STATS ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatCard("12", "Sprints"),
              _StatCard("₹12K", "Earned"),
              _StatCard("5.0", "Rating"),
            ],
          ),

          const SizedBox(height: 25),

          // 🔹 SECTION TITLE
          const Text(
            "Completed Work",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // 🔥 COMPLETED TASK LIST
          ...completedTasks.map((task) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5),
                ],
              ),

              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(task["title"].toString()),
                subtitle: Text("Client: ${task["client"]}"),
                trailing: Text("⭐ ${task["rating"]}"),
              ),
            );
          }).toList(),

          const SizedBox(height: 20),

          // 🔥 GITHUB BUTTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening GitHub...")),
                );
              },
              icon: const Icon(Icons.link),
              label: const Text("View GitHub Profile"),
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 DOWNLOAD REPORT BUTTON (IMPORTANT)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Master's Ready Report Downloaded"),
                  ),
                );
              },
              child: const Text("Download Master's Ready Report"),
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 SMALL STAT CARD WIDGET
class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),

      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
