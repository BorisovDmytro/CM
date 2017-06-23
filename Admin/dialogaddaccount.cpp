#include "dialogaddaccount.h"
#include "ui_dialogaddaccount.h"

#include <QMessageBox>

DialogAddAccount::DialogAddAccount(QWidget *parent) :
  QDialog(parent),
  ui(new Ui::DialogAddAccount)
{
  ui->setupUi(this);
}

DialogAddAccount::~DialogAddAccount()
{
  delete ui;
}

Account *DialogAddAccount::getAccount() const
{
  return mAccount;
}

void DialogAddAccount::on_btnSuccess_clicked()
{
  const QString name = ui->lineEdit->text();
  const QString pass = ui->lineEdit_2->text();

  if (name.isEmpty() || pass.isEmpty()) {
      QMessageBox::warning(this, "Ошибка", "Не допускается ввод пустых полей");
      return;
    }

  mAccount = new Account(name, pass);
  accept();
}

void DialogAddAccount::on_btnCansel_clicked()
{
  reject();
}
