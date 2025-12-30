// Lightweight widget preview harness
// Run with: flutter run -t lib/widget_preview.dart

import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetPreviewApp());
}

class WidgetPreviewApp extends StatelessWidget {
  const WidgetPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Preview',
      theme: ThemeData.light(),
      home: const WidgetPreviewHome(),
    );
  }
}

class WidgetPreviewHome extends StatelessWidget {
  const WidgetPreviewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final previews = <_PreviewItem>[
      _PreviewItem(
        title: 'Fingerprint Button',
        builder: () => _fingerprintSample(),
      ),
      _PreviewItem(title: 'Switch Tile', builder: () => _switchSample()),
      _PreviewItem(
        title: 'Sign In Form (placeholder)',
        builder: () => _signInPlaceholder(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widget Preview')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: previews.length,
          itemBuilder: (context, index) {
            final p = previews[index];
            return Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      p.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Expanded(child: Center(child: p.builder())),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PreviewItem {
  final String title;
  final Widget Function() builder;
  _PreviewItem({required this.title, required this.builder});
}

// --- Sample preview widgets ---
Widget _fingerprintSample() {
  return IconButton(
    iconSize: 56,
    icon: const Icon(Icons.fingerprint_rounded, size: 56),
    onPressed: () {
      // in preview we just show a SnackBar
    },
  );
}

Widget _switchSample() {
  return ListTile(
    leading: const Icon(Icons.fingerprint_rounded),
    title: const Text('Finger Print Enable'),
    trailing: Switch(value: true, onChanged: (_) {}),
  );
}

Widget _signInPlaceholder() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const TextField(decoration: InputDecoration(labelText: 'Email')),
      const SizedBox(height: 8),
      const TextField(
        obscureText: true,
        decoration: InputDecoration(labelText: 'Password'),
      ),
      const SizedBox(height: 12),
      ElevatedButton(onPressed: () {}, child: const Text('Sign In')),
    ],
  );
}
