#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QMessageBox>

#include "database/dbconnectedsetting.h"

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  ui->action->setEnabled(false);
  ui->action_2->setEnabled(false);
  ui->action_3->setEnabled(false);
  ui->action_4->setEnabled(false);
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::on_pushButton_clicked()
{
  /*db = QSqlDatabase::addDatabase("QPSQL");
  db.setHostName("localhost");
  db.setPort(5432);

  db.setDatabaseName("postgres");
  db.setUserName("postgres");
  db.setPassword("695497");

  bool isOpen = db.open();

  QString res;
  if (isOpen) {
    res = "Database open success";
  } else {
    res = "Error open database";
  }

  QMessageBox::warning(this, "DB connect", res);*/

  /*
   *
   * execute sql query
QSqlQuery query;
   query.exec("SELECT name, salary FROM employee WHERE salary > 50000");

   read answer

  while (query.next()) {
     QString name = query.value(0).toString();
     int salary = query.value(1).toInt();
     qDebug() << name << salary;
   }

*/

  /* DbConnectedSetting setting;
  setting.load("E:\\iks\\setting.json");
  setting.save("E:\\iks\\setting2.json");*/
}

void MainWindow::on_action_6_triggered()
{

}

void MainWindow::on_action_5_triggered()
{
  DialogConnetion dlg;
  if (dlg.exec() == QDialog::Accepted) {
      DbConnectedSetting setting = dlg.getSetting();
      mConnection.init(setting);
      if (!mConnection.connect()) {
          QMessageBox::warning(this, "Ошибка", "Ошибка подключения к базе\n" + mConnection.getLastError());
          return;
        }
      mAccountCntrl.init(&mConnection);

      ui->action->setEnabled(true);
      ui->action_2->setEnabled(false);
      ui->action_3->setEnabled(false);
      ui->action_4->setEnabled(true);
    }
}

void MainWindow::on_action_triggered()
{
  DialogAddAccount dlg;
  if (dlg.exec() == QDialog::Accepted) {
      Account *acc = dlg.getAccount();
      mAccountCntrl.add(acc);
      delete acc;
    }
}

void MainWindow::on_action_7_triggered()
{
    mAccountCntrl.createTable();
}
