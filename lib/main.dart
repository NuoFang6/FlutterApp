import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HoYoTools',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 手脚架
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Tools"),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(child: Text("1")),
              const PopupMenuItem(child: Text("2")),
              const PopupMenuItem(child: Text("3")),
            ],
          )
        ],
      ),
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://t.mwm.moe/mp'),
                  fit: BoxFit.cover)),
        ),
        const AppHomeBody(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '工具'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: '我的'),
        ],
      ),
    );
  }
}

class AppHomeBody extends StatelessWidget {
  const AppHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeCard(
            text: "123",
          )
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: NetworkImage('https://t.mwm.moe/ycy'), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8.0), // 自定义边框半径
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 5), // 阴影位置，可根据需要调整
          ),
        ],
      ),
      child:
          SizedBox(width: 500, height: 180, child: Center(child: Text(text))),
    );
  }
}
