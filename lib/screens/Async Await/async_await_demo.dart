import 'package:flutter/material.dart';

class AsyncAwaitDemo extends StatefulWidget {
  const AsyncAwaitDemo({Key? key}) : super(key: key);

  @override
  State<AsyncAwaitDemo> createState() => _AsyncAwaitDemoState();
}

class _AsyncAwaitDemoState extends State<AsyncAwaitDemo> {
  bool isWaiting = false;
  String msg = 'No Food Ordered Yet';
  String btnText = 'Order Food';

  doOrder() async {
    setState(() {
      isWaiting = true;
      msg = 'Please wait...';
    });

    print('Before doDelay()...');
    String val = await doDelay(5);
    print('after doDelay()...$val');

    setState(() {
      isWaiting = false;
      msg = 'Order Complete';
    });
  }

  doDelay(int s) async {
    print('before $s seconds doDelay()...');
    await Future.delayed(Duration(seconds: 5));
    print('after $s seconds doDelay()...');
    return 'delay complete';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Async Await Demo',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 50),
          (isWaiting)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    isWaiting ? null : doOrder();
                  },
                  child: Text('Order Food')),

          SizedBox(height: 10),
          Text(msg),
          // if (isWaiting) ...[
          //   CircularProgressIndicator()
          // ] else ...[
          //   ElevatedButton(
          //       onPressed: () => doOrder(), child: Text('Order Food'))
          // ]
        ]),
      ),
    );
  }
}
