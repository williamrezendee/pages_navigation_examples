import 'package:flutter/material.dart';
import 'package:pages_navigation/controllers/Posts_controller.dart';
import 'package:pages_navigation/widgets/custom_button_widget.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Viewer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.85,
              width: screenWidth,
              child: AnimatedBuilder(
                animation: Listenable.merge(
                    [_controller.posts, _controller.inLoading]),
                builder: (_, __) {
                  if (_controller.inLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.posts.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(_controller.posts.value[index].title),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            CustomButtonWidget(
              onPressed: () => _controller.callAPI(),
              title: 'Show Data',
            ),
          ],
        ),
      ),
    );
  }
}
