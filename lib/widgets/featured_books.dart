import 'package:flutter/material.dart';
import 'package:flutter_api_integration/models/book_model.dart';
import 'package:flutter_api_integration/screens/details_screen.dart';


class FeaturedBooks extends StatelessWidget {
  final List<BookModel> books;

  const FeaturedBooks({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Featured Books",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 260,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,

            itemBuilder: (context, index) {
              final book = books[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookDetailScreen(
                        book: book,
                      ),
                    ),
                  );
                },

                child: Container(
                  width: 165,
                  margin: const EdgeInsets.only(right: 18),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),

                          child: Image.network(
                            book.coverUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,

                            
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        book.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}