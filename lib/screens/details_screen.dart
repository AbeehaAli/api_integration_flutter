import 'package:flutter/material.dart';
import 'package:flutter_api_integration/models/book_detail_model.dart';
import 'package:flutter_api_integration/models/book_model.dart';
import 'package:flutter_api_integration/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;

  BookDetailScreen({
    super.key,
    required this.book,
  });

  final ApiService apiService = ApiService();
   
   Future<void> openBook() async {
    final Uri url =Uri.parse('https://openlibrary.org${book.workKey}');
   print(url);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      mode: LaunchMode.externalApplication,);
    } else {
      throw Exception('Could not launch book.');
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);},
         icon: Icon(Icons.arrow_back_ios_new,
         size: 18,
         color: Colors.black,
         )
         ),
        title: const Text(
          "Book Details",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: FutureBuilder<BookDetailModel>(
        future: apiService.getBookDetail(book.workKey),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Failed to load book details"),
            );
          }

          final detail = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        book.coverUrl,
                        height: 240,
                        width: 165,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 320,
                            width: 220,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.menu_book,
                              size: 80,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),

              
                Text(
                  book.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
              
                  ),
                ),

                const SizedBox(height: 3),

                
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.deepPurple,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          book.author,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.deepPurple,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${book.firstPublishYear}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  detail.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.7,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Subjects",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: detail.subjects
                      .take(8)
                      .map(
                        (subject) =>
                         Chip(
                          visualDensity: .compact,
                          materialTapTargetSize: .shrinkWrap,
                          backgroundColor:
                              Colors.deepPurple.shade50,
                          label: Text(subject,
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 50),

                Center(
                  child: SizedBox(
                    width: 300,
                    height: 43,
                    child: ElevatedButton(
                      onPressed: () async {
                         openBook();
                      },
                  
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                  
                      child: const Text(
                        "Open in Open Library",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}