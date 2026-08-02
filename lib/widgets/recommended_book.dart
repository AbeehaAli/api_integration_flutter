import 'package:flutter/material.dart';
import 'package:flutter_api_integration/models/book_model.dart';
import 'package:flutter_api_integration/screens/details_screen.dart';


class RecommendedBooks extends StatelessWidget {
  final List<BookModel> books;

  const RecommendedBooks({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Recommended For You",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: books.length,

          separatorBuilder: (_, __) =>
              const SizedBox(height: 5),

          itemBuilder: (context, index) {
            final book = books[index];

            return GestureDetector(
              // borderRadius: BorderRadius.circular(18),

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
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: Image.network(
                        book.coverUrl,
                        height: 100,
                        width: 70,
                        fit: BoxFit.cover,

                        errorBuilder:
                            (context, error, stackTrace) {
                          return Container(
                            height: 100,
                            width: 70,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.menu_book,
                              size: 35,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 24),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            book.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,

                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            book.author,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(height: 7),

                          Text(
                            "Published: ${book.firstPublishYear}",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}