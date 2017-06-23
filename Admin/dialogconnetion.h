#ifndef DIALOGCONNETION_H
#define DIALOGCONNETION_H

#include <QDialog>
#include "database/dbconnectedsetting.h"

namespace Ui {
class DialogConnetion;
}

class DialogConnetion : public QDialog
{
    Q_OBJECT

public:
    explicit DialogConnetion(QWidget *parent = 0);
    ~DialogConnetion();

    DbConnectedSetting getSetting();
private slots:
    void on_pushButton_3_clicked();

    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::DialogConnetion *ui;
    DbConnectedSetting setting;
};

#endif // DIALOGCONNETION_H
