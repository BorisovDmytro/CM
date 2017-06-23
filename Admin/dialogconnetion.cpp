#include "dialogconnetion.h"
#include "ui_dialogconnetion.h"
#include <QMessageBox>

DialogConnetion::DialogConnetion(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogConnetion)
{
    ui->setupUi(this);
}

DialogConnetion::~DialogConnetion()
{
    delete ui;
}

DbConnectedSetting DialogConnetion::getSetting()
{
    return setting;
}

void DialogConnetion::on_pushButton_3_clicked()
{

}

void DialogConnetion::on_pushButton_clicked()
{
    if (ui->lineEditDB->text().isEmpty()       || ui->lineEditHost->text().isEmpty() ||
        ui->lineEditPassword->text().isEmpty() || ui->lineEditPort->text().isEmpty() ||
        ui->lineEditUser->text().isEmpty()) {
        QMessageBox::warning(this, "Ошибка ввода", "Недопускаются пустые поля");
        return;
    }

    setting.setUrl(ui->lineEditHost->text());
    setting.setPassword(ui->lineEditPassword->text());
    setting.setPort(ui->lineEditPort->text().toInt());
    setting.setUser(ui->lineEditUser->text());
    setting.setDbName(ui->lineEditDB->text());

    accept();
}

void DialogConnetion::on_pushButton_2_clicked()
{
    reject();
}
