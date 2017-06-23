#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "database/dbconnection.h"
#include "database/dbaccountcontroller.h"

#include "dialogconnetion.h"
#include "dialogaddaccount.h"

#include <QSqlDatabase>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  explicit MainWindow(QWidget *parent = 0);
  ~MainWindow();

private slots:
  void on_pushButton_clicked();

  void on_action_6_triggered();

  void on_action_5_triggered();

  void on_action_triggered();

private:
  Ui::MainWindow *ui;
  QSqlDatabase db;
  DbConnection mConnection;
  DbAccountController mAccountCntrl;
};

#endif // MAINWINDOW_H
