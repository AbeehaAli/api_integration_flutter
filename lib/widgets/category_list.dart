import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "All",
      "Fiction",
      "Self Help",
      "Business",
      "Technology",
      "AI",
      "Science",
      "Programming",
    ];

    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,

        separatorBuilder: (_, __) => const SizedBox(width: 10),

        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),

            decoration: BoxDecoration(
              color: index == 0
                  ? Colors.deepPurple
                  : Colors.white,

              borderRadius: BorderRadius.circular(20),

              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),

            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == 0
                      ? Colors.white
                      : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}