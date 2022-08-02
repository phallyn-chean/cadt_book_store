import 'package:http/http.dart' as http;

class BookApi {

    Future getBooks() async {
      final response = await http.get(
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=Fiction&maxResults=40")
      );

      String body = response.body ; 
      return body ;
    }

    Future searchBooks ({required String searchBook}) async {
      final response = await http.get(
        Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39"
        )
      );
      String body = response.body ; 
      return body ;

    }

    Future getAnime () async {
      final response = await http.get(
         Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=amine+manga&maxResults=39"
         )
      );
      String body = response.body ; 
      return body;
    }

    Future getAction() async {
      final response = await http.get(
               Uri.parse(
                "https://www.googleapis.com/books/v1/volumes?q=action+adventure&maxResults=39"
                )
      );
    }


    Future getNovel() async {
      final response = await http.get(
         Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=novel&maxResults=39"
         )
      );

      String body = response.body ; 
      return body ;
    } 

    Future getHorro () async {
      final response = await http.get(
          Uri.parse(
            "https://www.googleapis.com/books/v1/volumes?q=horroe&maxResults=39"
          )
        );

        String body = response.body; 
        return body; 
    }
}