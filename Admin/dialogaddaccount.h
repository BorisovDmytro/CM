#ifndef DIALOGADDACCOUNT_H
#define DIALOGADDACCOUNT_H

#include <QDialog>
#include "entity/account.h"

namespace Ui {
  class DialogAddAccount;
}

class DialogAddAccount : public QDialog
{
  Q_OBJECT

public:
  explicit DialogAddAccount(QWidget *parent = 0);
  ~DialogAddAccount();

  Account *getAccount() const;
private slots:
  void on_btnSuccess_clicked();

  void on_btnCansel_clicked();

private:
  Ui::DialogAddAccount *ui;
  Account *mAccount;
};

#endif // DIALOGADDACCOUNT_H
