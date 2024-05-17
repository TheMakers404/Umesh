import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shimmer Effect Example'),
        ),
        backgroundColor: Colors.white, // Set the background color to white
        body: const ShimmerEffectWidget(), // Your ShimmerEffectWidget here
      ),
    );
  }
}

class ShimmerEffectWidget extends StatefulWidget {
  const ShimmerEffectWidget({super.key});

  @override
  State<ShimmerEffectWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerEffectWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1000),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: _shimmerContainer(140, 50),
                  ),
                  const Spacer(), // Use Spacer to push the 34x34 container to the right corner
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: _shimmerContainer(34, 34),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: _shimmerContainer(378, 48), // Center the search block
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: _shimmerContainer(79, 34, const EdgeInsets.only(right: 8)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _shimmerContainer(430, 184), // Adjusted size for running banners
            const SizedBox(height: 16),
            _shimmerContainer(378, 48, const EdgeInsets.only(left: 12)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _shimmerContainer(219, 144, const EdgeInsets.only(right: 8)),
                ),
                Expanded(
                  child: _shimmerContainer(219, 144, const EdgeInsets.only(left: 8)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _shimmerContainer(378, 48, const EdgeInsets.only(left: 12)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _shimmerContainer(219, 144, const EdgeInsets.only(right: 8)),
                ),
                Expanded(
                  child: _shimmerContainer(219, 144, const EdgeInsets.only(left: 8)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shimmerContainer(double width, double height,
      [EdgeInsetsGeometry? margin]) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
