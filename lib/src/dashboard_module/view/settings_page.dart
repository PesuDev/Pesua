import 'package:flutter/material.dart';
import 'package:pesu/src/dashboard_module/viewModel/dashboard_viewModel.dart';
import 'package:pesu/utils/services/bottom_navigaton_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late DashboardViewModel _viewModel;
  var _mainHeight;
  var _mainWidth;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<DashboardViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _mainHeight = MediaQuery.of(context).size.height;
    _mainWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
          onPressed: () {
            Provider.of<BottomNavigationProvider>(context, listen: false)
                .selectBottomIndex(bottomIndex: 0);
          },
        ),
        title: Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Container(
        height: _mainHeight,
        width: _mainWidth,
        color: Colors.white,
        padding: EdgeInsets.only(
            left: _mainWidth * 0.04,
            right: _mainWidth * 0.04,
            top: _mainHeight * 0.02),
        child: Container(
          height: _mainHeight * 0.8,
          width: _mainWidth,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
                mainAxisSpacing: _mainHeight * 0.05),
            itemBuilder: (_, index) {
              var data = _viewModel.getSettingsList()[index];
              return InkWell(
                onTap: () => data.callback != null ? data.callback : () {},
                child: Container(
                  //color: Colors.amber,
                  //height: _mainHeight*0.05,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        data.icon,
                        color: Colors.grey.shade400,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.name ?? '',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: _viewModel.getSettingsList().length,
          ),
        ),
      ),
    );
  }
}
