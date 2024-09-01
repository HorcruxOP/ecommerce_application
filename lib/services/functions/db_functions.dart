import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application/services/models/product_model.dart';

class DbFunctions {
  static createProduct(Map<String, dynamic> map) async {
    var docRef =
        await FirebaseFirestore.instance.collection("products").add(map);
    await docRef.update({'productId': docRef.id});

    // var response = await FirebaseFirestore.instance
    //     .collection("categories")
    //     .doc("trqXPT1eo7JdJGa8CBYI")
    //     .collection("sub-categories")
    //     .get();
    // for (var doc in response.docs) {
    //   log(doc.data().toString());
    // }
  }

  static fetchData() async {
    var querysnapshot =
        await FirebaseFirestore.instance.collection("products").get();

    List<ProductModel> list = [];
    for (var doc in querysnapshot.docs) {
      log(doc.data().toString());
      list.add(ProductModel.fromMap(doc.data()));
    }
    return list;
  }

  static update() async {
    var querysnapshot =
        await FirebaseFirestore.instance.collection("products").get();
    List<String> updatedImageUrls = [
      'https://images.unsplash.com/photo-1607853202273-797f1c22a38e?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1656662961786-b04873ceb4b9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=2147&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1526509867162-5b0c0d1b4b33?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1643966398552-0bb0bf0c78cf?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1507457379470-08b800bebc67?q=80&w=2109&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1531525645387-7f14be1bdbbd?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1531390770335-d94a0dacd992?q=80&w=1978&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1597840900578-2c0798e868c3?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1531525727990-67532cd332c6?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ];

    for (var doc in querysnapshot.docs) {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(doc.id)
          .update({"imageUrls": updatedImageUrls});

      log(doc.data()["imageUrls"].toString());
    }
  }

  static addproduct() async {
    log("message");
    var list1 = [
      {
        "productId": "",
        "name": "Apple iPad Pro 12.9 (2022)",
        "description":
            "The Apple iPad Pro 12.9 (2022) is the ultimate tablet for professionals and creatives who demand power and versatility. Featuring a 12.9-inch Liquid Retina XDR display, it delivers stunning color accuracy and contrast, perfect for design and multimedia work. The tablet is powered by the M2 chip, offering incredible performance and efficiency. It supports the Apple Pencil (2nd generation) and Magic Keyboard, making it an excellent choice for drawing, note-taking, and productivity. The iPad Pro 12.9 also includes a 12MP wide camera, a 10MP ultra-wide camera, and a LiDAR scanner, enhancing augmented reality experiences and photo capabilities. With a 40.88Wh battery, it offers up to 10 hours of usage on a single charge. Running iPadOS 16, the iPad Pro provides a powerful and intuitive user experience with multitasking and app integration.",
        "price": 1299.99,
        "categoryId": "trqXPT1eo7JdJGa8CBYI",
        "subCategoryId": "uxA6ZbEWI6bC3krnd7cy",
        "imageUrls": ["https://example.com/apple-ipad-pro-12-9-2022.jpg"],
        "stockQuantity": 10,
        "ratings": {"averageRating": 4.9, "totalRatings": 1200}
      },
      {
        "productId": "",
        "name": "Samsung Galaxy Tab S8 Ultra",
        "description":
            "The Samsung Galaxy Tab S8 Ultra is a high-end tablet designed for productivity and entertainment. It features a massive 14.6-inch Super AMOLED display with a 120Hz refresh rate, offering vibrant colors and smooth visuals. Powered by the Snapdragon 8 Gen 1 processor, it ensures fast and responsive performance for multitasking and gaming. The tablet supports the S Pen (included) for precise input and creative work. Its camera system includes a 13MP main sensor and a 6MP ultra-wide lens, providing versatility for photos and video calls. The Galaxy Tab S8 Ultra also includes a 11200mAh battery with fast charging support. Running on Android 12 with One UI, it offers a feature-rich and customizable user experience. With its large display and powerful hardware, the Galaxy Tab S8 Ultra is ideal for users who need a premium tablet experience.",
        "price": 1149.99,
        "categoryId": "trqXPT1eo7JdJGa8CBYI",
        "subCategoryId": "uxA6ZbEWI6bC3krnd7cy",
        "imageUrls": ["https://example.com/samsung-galaxy-tab-s8-ultra.jpg"],
        "stockQuantity": 15,
        "ratings": {"averageRating": 4.8, "totalRatings": 900}
      },
      {
        "productId": "",
        "name": "Microsoft Surface Pro 9",
        "description":
            "The Microsoft Surface Pro 9 is a versatile 2-in-1 tablet that combines the power of a laptop with the flexibility of a tablet. It features a 13-inch PixelSense Flow display with a 120Hz refresh rate, providing sharp and smooth visuals. The device is powered by the latest Intel Core i7 processor and includes 16GB of RAM, ensuring excellent performance for demanding tasks. It supports the Surface Pen (sold separately) and the Type Cover (sold separately), enhancing productivity and creative work. The Surface Pro 9 includes a 5MP front camera and a 10MP rear camera, suitable for video calls and photography. With a 47.7Wh battery, it offers up to 15.5 hours of usage on a single charge. Running on Windows 11, the Surface Pro 9 provides a full desktop experience in a portable form factor. Its blend of performance and versatility makes it an ideal choice for professionals and power users.",
        "price": 1599.99,
        "categoryId": "trqXPT1eo7JdJGa8CBYI",
        "subCategoryId": "uxA6ZbEWI6bC3krnd7cy",
        "imageUrls": ["https://example.com/microsoft-surface-pro-9.jpg"],
        "stockQuantity": 8,
        "ratings": {"averageRating": 4.9, "totalRatings": 650}
      },
      {
        "productId": "",
        "name": "Lenovo Tab P12 Pro",
        "description":
            "The Lenovo Tab P12 Pro is a high-performance tablet designed for both productivity and entertainment. It features a 12.6-inch AMOLED display with a 120Hz refresh rate, delivering vibrant colors and smooth visuals. The tablet is powered by the Snapdragon 888 processor, ensuring excellent performance for multitasking and gaming. It supports the Lenovo Precision Pen 3 (sold separately) for precise input and creative work. The camera system includes a 13MP main sensor and a 5MP ultra-wide lens, providing versatility for different shooting scenarios. The Tab P12 Pro also includes an 8600mAh battery with fast charging support. Running on Android 12, it offers a fluid and responsive user experience with minimal lag. With its impressive hardware and large display, the Lenovo Tab P12 Pro is a great choice for users who need a powerful and versatile tablet.",
        "price": 849.99,
        "categoryId": "trqXPT1eo7JdJGa8CBYI",
        "subCategoryId": "uxA6ZbEWI6bC3krnd7cy",
        "imageUrls": ["https://example.com/lenovo-tab-p12-pro.jpg"],
        "stockQuantity": 12,
        "ratings": {"averageRating": 4.7, "totalRatings": 550}
      }
    ];
    for (var element in list1) {
      await createProduct(element);
    }
  }
}
