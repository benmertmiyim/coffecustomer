import 'package:coffecustomer/core/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:coffecustomer/core/model/notification_model.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late NotificationView notificationView;

  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {

    notificationView = Provider.of<NotificationView>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: FxText.titleMedium("Notifications", fontWeight: 600),
      ),
      body: notificationView.notificationProcess == NotificationProcess.idle
          ? (notificationView.notificationList != null && notificationView.notificationList!.isNotEmpty
              ? ListView.builder(
                  padding: FxSpacing.all(0),
                  itemCount: notificationView.notificationList!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: theme.primaryColor,
                        padding: FxSpacing.symmetric(horizontal: 20),
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.delete_outline,
                              color: theme.colorScheme.onPrimary,
                            ),
                            Padding(
                              padding: FxSpacing.left(8),
                              child: FxText.bodyMedium("Delete",
                                  fontWeight: 500,
                                  color: theme.colorScheme.onPrimary),
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {

                          notificationView.deleteNotification(notificationView.notificationList![index].id);
                          showSnackBarWithFloating("Deleted");
                        });
                      },
                      key: UniqueKey(),
                      child: Padding(
                        padding: FxSpacing.xy(16, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: FxText.titleSmall(
                                          notificationView.notificationList![index].title,
                                          fontWeight: 600,
                                        ),
                                      ),
                                      FxText.titleSmall(
                                        DateFormat('dd MMM yy - kk:mm')
                                            .format(notificationView.notificationList![index].sendedDate),
                                        fontWeight:600,
                                      ),
                                    ],
                                  ),
                                  FxText.bodyMedium(
                                    notificationView.notificationList![index].message,
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              :  Center(
        child:  FxText.bodyMedium("You dont have notifications",),
                ))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void showSnackBarWithFloating(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FxText.titleSmall(message, color: theme.colorScheme.onPrimary),
        backgroundColor: theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
