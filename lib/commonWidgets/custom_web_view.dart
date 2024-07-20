import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String? blogUrl;

  const ArticleView({super.key, required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize controller with desired settings
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Allow JS execution (cautiously)
      ..setBackgroundColor(const Color(0x00000000)) // Transparent background
      ..setNavigationDelegate(
        NavigationDelegate(
          // Handle progress, navigation, and errors
          onProgress: (int progress) {
            // Update loading bar or indicator (implementation not shown)
          },
          onPageStarted: (String url) {
            // Handle page start (e.g., show loading indicator)
          },
          onPageFinished: (String url) {
            // Handle page finish (e.g., hide loading indicator)
          },
          onWebResourceError: (WebResourceError error) {
            // Handle web resource errors (e.g., display error message)
            print('WebResourceError: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            // Handle navigation requests (optional: prevent external links)
            final String requestedUrl = request.url;
            final bool isInternalLink = requestedUrl.startsWith(widget.blogUrl ?? ''); // Check for starting domain
            return isInternalLink ? NavigationDecision.navigate : NavigationDecision.prevent;
          },
        ),
      );

    // Load initial URL (handle null case)
    if (widget.blogUrl != null) {
      _controller.loadRequest(Uri.parse(widget.blogUrl!));
    } else {
      // Handle missing blogUrl (e.g., show error message)
      print('Error: blogUrl is null');
    }
  }

  // @override
  // void dispose() {
  //   _controller.dispose(); // Release controller resources
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ViewNews')),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
