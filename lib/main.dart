import 'package:expense_tracker/custom_button.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_chart.dart';
import 'package:expense_tracker/expense_input.dart';
import 'package:expense_tracker/expense_list.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  ).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 16,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

  final List<Expense> expenseList = [
    Expense(
      id: "01",
      title: "Bruh",
      amount: 10500,
      date: DateTime.now(),
    ),
    Expense(
      id: "02",
      title: "New car",
      amount: 500000,
      date: DateTime.now(),
    ),
  ];

  List<Expense> get lastSevenDaysExpenses {
    return expenseList
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 8))))
        .toList();
  }

  void addNewExpense(Expense expense) {
    setState(() {
      expenseList.add(expense);
      print(expenseList[0].amount);
    });
  }

  void startAddNewExpense(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: ExpenseInput(addNewExpense),
          );
        });
  }

  void deleteExpense(String id) {
    expenseList.removeWhere((element) => element.id == id);
    setState(() {});
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQ, AppBar appBar, Widget expenseList) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Show chart"),
          Switch(
            value: showChart,
            onChanged: (val) {
              setState(() {
                showChart = val;
              });
            },
          ),
        ],
      ),
      showChart
          ? Container(
              height: (mediaQ.size.height -
                      appBar.preferredSize.height -
                      mediaQ.padding.top) *
                  0.7,
              child: ExpenseChart(
                recentExpenses: lastSevenDaysExpenses,
              ),
            )
          : expenseList
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQ, AppBar appBar, Widget expenseList) {
    return [
      Container(
        height: (mediaQ.size.height -
                appBar.preferredSize.height -
                mediaQ.padding.top) *
            0.2,
        child: ExpenseChart(
          recentExpenses: lastSevenDaysExpenses,
        ),
      ),
      expenseList
    ];
  }

  bool showChart = true;

  @override
  Widget build(BuildContext context) {
    print("MAIN IS CALLED AGAIN");

    var mediaQ = MediaQuery.of(context);

    final bool isDeviceLandscape = mediaQ.orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: [
        CustomButton(
          onPressed: () => startAddNewExpense(context),
        ),
      ],
      title: Text(
        "Expense Tracker",
        style: TextStyle(),
      ),
    );

    var renderExpenseList = Container(
      height: (mediaQ.size.height -
              appBar.preferredSize.height -
              mediaQ.padding.top) *
          0.8,
      child: ExpenseList(expenseList, deleteExpense),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Color.fromARGB(255, 179, 179, 179),
        child: Column(
          children: [
            if (isDeviceLandscape)
              ..._buildLandscapeContent(
                mediaQ,
                appBar,
                renderExpenseList,
              ),
            if (!isDeviceLandscape)
              ..._buildPortraitContent(
                mediaQ,
                appBar,
                renderExpenseList,
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAddNewExpense(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
