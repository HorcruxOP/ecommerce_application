🛒 eCommerce App
A powerful and intuitive eCommerce application built with Flutter and Dart, integrated with Firebase for backend services, and Razorpay for secure payment processing. The app features dynamic theming, allowing users to switch between light and dark modes seamlessly.

🚀 Features
User Authentication: Secure user sign-up, login, and password recovery with Firebase Authentication.
Product Management: Browse, search, and filter products from various categories.
Cart & Checkout: Add products to the cart, manage cart items, and proceed to checkout.
Secure Payments: Integrated with Razorpay for handling secure payments.
Order History: View past orders and track current orders.
Dynamic Theming: Toggle between light and dark themes for a personalized user experience.
🛠️ Technologies Used
Flutter: Frontend framework for building cross-platform applications.
Dart: Programming language used for Flutter development.
Firebase:
Firebase Authentication: User authentication and management.
Cloud Firestore: Real-time database for storing product details, user information, and orders.
Firebase Storage: Store and retrieve product images.
Firebase Cloud Messaging: Send push notifications.
Razorpay: Payment gateway integration for secure transactions.
Bloc: State management solution to handle app-wide state efficiently.
🖌️ Dynamic Themes
The app supports dynamic theming, allowing users to switch between light and dark modes. The theme persists across sessions, providing a consistent user experience.

🔧 Installation
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/ecommerce-app.git
cd ecommerce-app
Install dependencies:

bash
Copy code
flutter pub get
Configure Firebase:

Download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) from your Firebase Console.
Place them in the respective platform directories:
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
Set up Razorpay:

Follow the Razorpay documentation to obtain your API key.
Add your Razorpay key to the app in the payment configuration file.
Run the app:

bash
Copy code
flutter run
🖥️ Demo


🤝 Contributing
Contributions are welcome! Please create an issue or submit a pull request if you'd like to contribute.

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

📧 Contact
For any inquiries, please reach out to bhupender7678362318@gmail.com.
