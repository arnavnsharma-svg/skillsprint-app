import 'package:flutter/material.dart';

class SprintScreen extends StatelessWidget {
  const SprintScreen({super.key});

  final int currentDay = 3;

  final List<String> stages = const [
    "Plan",
    "Setup",
    "Develop",
    "Develop",
    "Develop",
    "Review",
    "Payout",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Header Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00C9A7), Color(0xFF92FE9D)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current Sprint", style: TextStyle(color: Colors.white70)),
                SizedBox(height: 8),
                Text(
                  "Day 3 of 7 🚀",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Progress Timeline",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // 🔥 Timeline List
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                bool isCompleted = index < currentDay;
                bool isCurrent = index == currentDay;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Timeline Indicator
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: isCompleted
                              ? Colors.green
                              : isCurrent
                              ? Colors.blue
                              : Colors.grey.shade300,
                          child: Icon(
                            isCompleted
                                ? Icons.check
                                : isCurrent
                                ? Icons.play_arrow
                                : Icons.circle,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),

                        if (index != 6)
                          Container(
                            width: 2,
                            height: 50,
                            color: isCompleted
                                ? Colors.green
                                : Colors.grey.shade300,
                          ),
                      ],
                    ),

                    const SizedBox(width: 12),

                    // 🔹 Stage Card
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Day ${index + 1}: ${stages[index]}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              isCompleted
                                  ? "Completed"
                                  : isCurrent
                                  ? "In Progress"
                                  : "Pending",
                              style: TextStyle(
                                color: isCompleted
                                    ? Colors.green
                                    : isCurrent
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
