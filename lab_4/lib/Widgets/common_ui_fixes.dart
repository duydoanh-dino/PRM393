import 'package:flutter/material.dart';

class CommonFixesDemo extends StatelessWidget {
  const CommonFixesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> errorFixMovies = ["Movie A", "Movie B", "Movie C", "Movie D"];

    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 5 – Common UI Fixes")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Correct ListView inside Column using Expanded",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: errorFixMovies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.movie,
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          errorFixMovies[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}