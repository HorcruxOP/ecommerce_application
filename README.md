<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eCommerce App</title>
</head>

<body>

    <h1>🛒 eCommerce App</h1>
    <p>
        A powerful and intuitive eCommerce application built with Flutter and Dart, integrated with Firebase for backend
        services, and Razorpay for secure payment processing. The app features dynamic theming, allowing users to switch
        between light and dark modes seamlessly.
    </p>

    <h2>🚀 Features</h2>
    <ul>
        <li><strong>User Authentication</strong>: Secure user sign-up, login, and password recovery with Firebase
            Authentication.</li>
        <li><strong>Product Management</strong>: Browse, search, and filter products from various categories.</li>
        <li><strong>Cart & Checkout</strong>: Add products to the cart, manage cart items, and proceed to checkout.
        </li>
        <li><strong>Secure Payments</strong>: Integrated with Razorpay for handling secure payments.</li>
        <li><strong>Order History</strong>: View past orders and track current orders.</li>
        <li><strong>Dynamic Theming</strong>: Toggle between light and dark themes for a personalized user experience.
        </li>
    </ul>

    <h2>🛠️ Technologies Used</h2>
    <ul>
        <li><strong>Flutter</strong>: Frontend framework for building cross-platform applications.</li>
        <li><strong>Dart</strong>: Programming language used for Flutter development.</li>
        <li><strong>Firebase</strong>:</li>
        <ul>
            <li><strong>Firebase Authentication</strong>: User authentication and management.</li>
            <li><strong>Cloud Firestore</strong>: Real-time database for storing product details, user information, and
                orders.</li>
            <li><strong>Firebase Storage</strong>: Store and retrieve product images.</li>
            <li><strong>Firebase Cloud Messaging</strong>: Send push notifications.</li>
        </ul>
        <li><strong>Razorpay</strong>: Payment gateway integration for secure transactions.</li>
        <li><strong>Bloc</strong>: State management solution to handle app-wide state efficiently.</li>
    </ul>

    <h2>🖌️ Dynamic Themes</h2>
    <p>
        The app supports dynamic theming, allowing users to switch between light and dark modes. The theme persists
        across sessions, providing a consistent user experience.
    </p>

    <h2>🔧 Installation</h2>
    <p><strong>Clone the repository:</strong></p>
    <pre><code>git clone https://github.com/your-username/ecommerce-app.git
cd ecommerce-app</code></pre>

    <p><strong>Install dependencies:</strong></p>
    <pre><code>flutter pub get</code></pre>

    <p><strong>Configure Firebase:</strong></p>
    <ul>
        <li>Download the <code>google-services.json</code> (for Android) and <code>GoogleService-Info.plist</code> (for
            iOS) from your Firebase Console.</li>
        <li>Place them in the respective platform directories:</li>
        <ul>
            <li><code>android/app/google-services.json</code></li>
            <li><code>ios/Runner/GoogleService-Info.plist</code></li>
        </ul>
    </ul>

    <p><strong>Set up Razorpay:</strong></p>
    <ul>
        <li>Follow the <a href="https://razorpay.com/docs/payment-gateway/flutter-integration/">Razorpay documentation</a>
            to obtain your API key.</li>
        <li>Add your Razorpay key to the app in the payment configuration file.</li>
    </ul>

    <p><strong>Run the app:</strong></p>
    <pre><code>flutter run</code></pre>

    <h2>🖥️ Demo</h2>
    <p>Include screenshots or a link to a video demo of the app here.</p>

    <h2>🤝 Contributing</h2>
    <p>Contributions are welcome! Please create an issue or submit a pull request if you'd like to contribute.</p>

    <h2>📜 License</h2>
    <p>This project is licensed under the MIT License - see the LICENSE file for details.</p>

    <h2>📧 Contact</h2>
    <p>For any inquiries, please reach out to <a href="mailto:bhupender7678362318@gmail.com">bhupender7678362318@gmail.com</a>.</p>

</body>

</html>
