library x;

import 'dart:convert';

var js = '''
{
 "kind": "books#volumes",
 "totalItems": 382,
 "items": [
  {
   "kind": "books#volume",
   "id": "4kZdePXe6M4C",
   "etag": "OfktvXSB+RY",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/4kZdePXe6M4C",
   "volumeInfo": {
    "title": "An Introduction to Programming Using Java",
    "authors": [
     "Anthony J. Dos Reis"
    ],
    "publisher": "Jones & Bartlett Learning",
    "publishedDate": "2011-09-22",
    "description": "Ideal for the ",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "1449633374"
     },
     {
      "type": "ISBN_13",
      "identifier": "9781449633370"
     }
    ],
    "pageCount": 450,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "averageRating": 2.5,
    "ratingsCount": 2,
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks6.books.google.at/books?id=4kZdePXe6M4C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks6.books.google.at/books?id=4kZdePXe6M4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=4kZdePXe6M4C&pg=PA105&dq=dart+java&hl=&cd=1&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=4kZdePXe6M4C&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/An_Introduction_to_Programming_Using_Jav.html?hl=&id=4kZdePXe6M4C"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": true,
     "acsTokenLink": "http://books.google.at/books/download/An_Introduction_to_Programming_Using_Jav-sample-pdf.acsm?id=4kZdePXe6M4C&format=pdf&output=acs4_fulfillment_token&dl_type=sample&source=gbs_api"
    },
    "webReaderLink": "http://books.google.at/books/reader?id=4kZdePXe6M4C&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Suppose ae board is a square with dimensions"
   }
  },
  {
   "kind": "books#volume",
   "id": "ECGJMAEACAAJ",
   "etag": "BmSMiSIIkig",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/ECGJMAEACAAJ",
   "volumeInfo": {
    "title": "Dart in Action",
    "authors": [
     "Chris Buckett"
    ],
    "publisher": "Manning Publications",
    "publishedDate": "2013",
    "description": "Summary Dart in Action introduces Google's Dart language and prov",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "1617290866"
     },
     {
      "type": "ISBN_13",
      "identifier": "9781617290862"
     }
    ],
    "pageCount": 398,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "averageRating": 3.0,
    "ratingsCount": 1,
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks9.books.google.at/books?id=ECGJMAEACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api",
     "thumbnail": "http://bks9.books.google.at/books?id=ECGJMAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=ECGJMAEACAAJ&dq=dart+java&hl=&cd=2&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=ECGJMAEACAAJ&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Dart_in_Action.html?hl=&id=ECGJMAEACAAJ"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "NO_PAGES",
    "embeddable": false,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=ECGJMAEACAAJ&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "NONE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "About this Book Dart in Action introduces the Dart la"
   }
  },
  {
   "kind": "books#volume",
   "id": "5R7WsLh4qMMC",
   "etag": "WN/iv5a+YKA",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/5R7WsLh4qMMC",
   "volumeInfo": {
    "title": "Big Java",
    "subtitle": "Compatible with Java 5, 6 and 7",
    "authors": [
     "Cay S. Horstmann"
    ],
    "publisher": "John Wiley & Sons",
    "publishedDate": "2009-12-30",
    "description": "This book introduces programmers to objects at a gradual p",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "0470509481"
     },
     {
      "type": "ISBN_13",
      "identifier": "9780470509487"
     }
    ],
    "pageCount": 1132,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "averageRating": 5.0,
    "ratingsCount": 1,
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks0.books.google.at/books?id=5R7WsLh4qMMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks0.books.google.at/books?id=5R7WsLh4qMMC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=5R7WsLh4qMMC&pg=PA269&dq=dart+java&hl=&cd=3&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=5R7WsLh4qMMC&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Big_Java.html?hl=&id=5R7WsLh4qMMC"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=5R7WsLh4qMMC&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Compatible with  5, 6 and 7 Cay S. Horstmann. x a "
   }
  },
  {
   "kind": "books#volume",
   "id": "8_ccs3hMw1oC",
   "etag": "o2DmY9pzcjk",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/8_ccs3hMw1oC",
   "volumeInfo": {
    "title": "What is Dart?",
    "authors": [
     "Kathy Walrath",
     "Seth Ladd"
    ],
    "publisher": "O'Reilly Media, Inc.",
    "publishedDate": "2012-03-07",
    "description": "This short, free ebook from March 2012 describes the Dart language, lib",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "1449332331"
     },
     {
      "type": "ISBN_13",
      "identifier": "9781449332334"
     }
    ],
    "pageCount": 20,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks8.books.google.at/books?id=8_ccs3hMw1oC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks8.books.google.at/books?id=8_ccs3hMw1oC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=8_ccs3hMw1oC&pg=PT8&dq=dart+java&hl=&cd=4&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=8_ccs3hMw1oC&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/What_is_Dart.html?hl=&id=8_ccs3hMw1oC"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "FOR_SALE",
    "isEbook": true,
    "listPrice": {
     "amount": 0.0,
     "currencyCode": "EUR"
    },
    "retailPrice": {
     "amount": 0.0,
     "currencyCode": "EUR"
    },
    "buyLink": "http://books.google.at/books?id=8_ccs3hMw1oC&dq=dart+java&hl=&buy=&source=gbs_api"
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "ALL_PAGES",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": true
    },
    "webReaderLink": "http://books.google.at/books/reader?id=8_ccs3hMw1oC&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Whether you know JavaScript or "
   }
  },
  {
   "kind": "books#volume",
   "id": "7Oh8xNYEgwYC",
   "etag": "cZg2sqpdWvA",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/7Oh8xNYEgwYC",
   "volumeInfo": {
    "title": "PC Mag",
    "publishedDate": "1998-04-07",
    "description": "PCMag.com is a leading authority on technology, delivering Labs-based, independent reviews o",
    "pageCount": 350,
    "printType": "MAGAZINE",
    "contentVersion": "0.2.1.0.preview.1",
    "imageLinks": {
     "smallThumbnail": "http://bks4.books.google.at/books?id=7Oh8xNYEgwYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks4.books.google.at/books?id=7Oh8xNYEgwYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=7Oh8xNYEgwYC&pg=PA120&dq=dart+java&hl=&cd=5&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=7Oh8xNYEgwYC&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/PC_Mag.html?hl=&id=7Oh8xNYEgwYC"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "ALL_PAGES",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=7Oh8xNYEgwYC&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Since "
   }
  },
  {
   "kind": "books#volume",
   "id": "C5ADQbl1LL8C",
   "etag": "nh/aIv13KAA",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/C5ADQbl1LL8C",
   "volumeInfo": {
    "title": "Java For Everyone",
    "authors": [
     "Cay S. Horstmann"
    ],
    "publisher": "John Wiley & Sons",
    "publishedDate": "2010-02-02",
    "description": "This book gives an introduction to Java and computer programming that focuses on the essentials and on effective learning.",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "0471791911"
     },
     {
      "type": "ISBN_13",
      "identifier": "9780471791911"
     }
    ],
    "pageCount": 515,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks9.books.google.at/books?id=C5ADQbl1LL8C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks9.books.google.at/books?id=C5ADQbl1LL8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=C5ADQbl1LL8C&pg=PA161&dq=dart+java&hl=&cd=6&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=C5ADQbl1LL8C&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Java_For_Everyone.html?hl=&id=C5ADQbl1LL8C"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=C5ADQbl1LL8C&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": ""
   }
  },
  {
   "kind": "books#volume",
   "id": "xLxqmzlZHU4C",
   "etag": "4kKu4bwcmpM",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/xLxqmzlZHU4C",
   "volumeInfo": {
    "title": "Dart",
    "subtitle": "Up and Running",
    "authors": [
     "Kathy Walrath",
     "Seth Ladd"
    ],
    "publisher": "O'Reilly Media, Inc.",
    "publishedDate": "2012",
    "description": "Get up to speed on Dart, the web development language that not only mat",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "1449330894"
     },
     {
      "type": "ISBN_13",
      "identifier": "9781449330897"
     }
    ],
    "pageCount": 123,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "contentVersion": "preview-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks7.books.google.at/books?id=xLxqmzlZHU4C&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks7.books.google.at/books?id=xLxqmzlZHU4C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=xLxqmzlZHU4C&pg=PA4&dq=dart+java&hl=&cd=7&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=xLxqmzlZHU4C&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Dart.html?hl=&id=xLxqmzlZHU4C"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=xLxqmzlZHU4C&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": ""
   }
  },
  {
   "kind": "books#volume",
   "id": "IFRUAAAAcAAJ",
   "etag": "8mPq7O6Czkk",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/IFRUAAAAcAAJ",
   "volumeInfo": {
    "title": "An Essay on the Oopas Or Poison Tree of Java",
    "subtitle": "Addressed to the Honorable Thomas Stamford Raffles",
    "authors": [
     "Thomas Horsfield"
    ],
    "publishedDate": "1814",
    "industryIdentifiers": [
     {
      "type": "OTHER",
      "identifier": "KBNL:KBNL03000073138"
     }
    ],
    "pageCount": 59,
    "printType": "BOOK",
    "contentVersion": "full-1.0.0",
    "imageLinks": {
     "smallThumbnail": "http://bks5.books.google.at/books?id=IFRUAAAAcAAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks5.books.google.at/books?id=IFRUAAAAcAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=IFRUAAAAcAAJ&pg=PA47&dq=dart+java&hl=&cd=8&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=IFRUAAAAcAAJ&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/An_Essay_on_the_Oopas_Or_Poison_Tree_of.html?hl=&id=IFRUAAAAcAAJ"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "FREE",
    "isEbook": true,
    "buyLink": "http://books.google.at/books?id=IFRUAAAAcAAJ&dq=dart+java&hl=&buy=&source=gbs_api"
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "ALL_PAGES",
    "embeddable": true,
    "publicDomain": true,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": true,
     "downloadLink": "http://books.google.at/books/download/An_Essay_on_the_Oopas_Or_Poison_Tree_of.pdf?id=IFRUAAAAcAAJ&hl=&output=pdf&sig=ACfU3U2BzVp1oF8FGOdkmaUq8110KrA_Ag&source=gbs_api"
    },
    "webReaderLink": "http://books.google.at/books/reader?id=IFRUAAAAcAAJ&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "FULL_PUBLIC_DOMAIN",
    "quoteSharingAllowed": true
   },
   "searchInfo": {
    "textSnippet": "I have selected from a large number of experiments, those only which are nparticularly demo"
   }
  },
  {
   "kind": "books#volume",
   "id": "w2jC1KYCzcoC",
   "etag": "9Vu1SEdVRpE",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/w2jC1KYCzcoC",
   "volumeInfo": {
    "title": "Dart: Up and Running",
    "authors": [
     "Kathy Walrath",
     "Seth Ladd"
    ],
    "publisher": "O'Reilly Media, Inc.",
    "publishedDate": "2012-10-26",
    "description": "Get up to speed on Dart, the web development language that not only ma",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "1449330851"
     },
     {
      "type": "ISBN_13",
      "identifier": "9781449330859"
     }
    ],
    "pageCount": 152,
    "printType": "BOOK",
    "categories": [
     "Computers"
    ],
    "contentVersion": "1.1.1.0.preview.3",
    "imageLinks": {
     "smallThumbnail": "http://bks7.books.google.at/books?id=w2jC1KYCzcoC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks7.books.google.at/books?id=w2jC1KYCzcoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "en",
    "previewLink": "http://books.google.at/books?id=w2jC1KYCzcoC&pg=PA4&dq=dart+java&hl=&cd=9&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=w2jC1KYCzcoC&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Dart_Up_and_Running.html?hl=&id=w2jC1KYCzcoC"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "FOR_SALE",
    "isEbook": true,
    "listPrice": {
     "amount": 13.34,
     "currencyCode": "EUR"
    },
    "retailPrice": {
     "amount": 13.34,
     "currencyCode": "EUR"
    },
    "buyLink": "http://books.google.at/books?id=w2jC1KYCzcoC&dq=dart+java&hl=&buy=&source=gbs_api",
    "offers": [
     {
      "finskyOfferType": 1,
      "listPrice": {
       "amountInMicros": 1.334E7,
       "currencyCode": "EUR"
      },
      "retailPrice": {
       "amountInMicros": 1.334E7,
       "currencyCode": "EUR"
      }
     }
    ]
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": true
    },
    "pdf": {
     "isAvailable": true
    },
    "webReaderLink": "http://books.google.at/books/reader?id=w2jC1KYCzcoC&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": ""
   }
  },
  {
   "kind": "books#volume",
   "id": "Jj1yNc8JVzEC",
   "etag": "/dfImdbXsIk",
   "selfLink": "https://www.googleapis.com/books/v1/volumes/Jj1yNc8JVzEC",
   "volumeInfo": {
    "title": "Biologie für Dummies",
    "authors": [
     "Rene Fester Kratz",
     "Donna Rae Siegfried"
    ],
    "publisher": "John Wiley & Sons",
    "publishedDate": "2011",
    "industryIdentifiers": [
     {
      "type": "ISBN_10",
      "identifier": "3527707387"
     },
     {
      "type": "ISBN_13",
      "identifier": "9783527707386"
     }
    ],
    "pageCount": 414,
    "printType": "BOOK",
    "contentVersion": "1.4.4.0.preview.1",
    "imageLinks": {
     "smallThumbnail": "http://bks4.books.google.at/books?id=Jj1yNc8JVzEC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
     "thumbnail": "http://bks4.books.google.at/books?id=Jj1yNc8JVzEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "language": "de",
    "previewLink": "http://books.google.at/books?id=Jj1yNc8JVzEC&pg=PA243&dq=dart+java&hl=&cd=10&source=gbs_api",
    "infoLink": "http://books.google.at/books?id=Jj1yNc8JVzEC&dq=dart+java&hl=&source=gbs_api",
    "canonicalVolumeLink": "http://books.google.at/books/about/Biologie_f%C3%BCr_Dummies.html?hl=&id=Jj1yNc8JVzEC"
   },
   "saleInfo": {
    "country": "AT",
    "saleability": "NOT_FOR_SALE",
    "isEbook": false
   },
   "accessInfo": {
    "country": "AT",
    "viewability": "PARTIAL",
    "embeddable": true,
    "publicDomain": false,
    "textToSpeechPermission": "ALLOWED",
    "epub": {
     "isAvailable": false
    },
    "pdf": {
     "isAvailable": false
    },
    "webReaderLink": "http://books.google.at/books/reader?id=Jj1yNc8JVzEC&hl=&printsec=frontcover&output=reader&source=gbs_api",
    "accessViewStatus": "SAMPLE",
    "quoteSharingAllowed": false
   },
   "searchInfo": {
    "textSnippet": "Jahrhundert nachzeichnen: V Im Jahr 1891 fand der Forscher Eugene Dubois "
   }
  }
 ]
}
''';


void main(List<String> x) {

  Map d = JSON.decode(js);

  var books = (d['items'] as List).forEach((Map item) {
    //print(item);
    print('Title: ${item['volumeInfo']['title']}');
    if(item['volumeInfo']['authors'] != null) {
      (item['volumeInfo']['authors'] as List).forEach((a) => print('  Author: ${a}'));
    }
  });
}