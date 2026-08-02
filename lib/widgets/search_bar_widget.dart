import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: SizedBox(
              height: 42,
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  hintText: "Search books, authors...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
              
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
              
                  filled: true,
                  fillColor: Colors.white,
              
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
              
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
              
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.tune,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}