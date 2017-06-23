#include "basesqlcontroller.h"
#include <QMessageBox>
#include <QSqlError>

BaseSQLController::BaseSQLController()
{

}

BaseSQLController::~BaseSQLController()
{

}

void BaseSQLController::printError(QSqlQuery &query)
{
  QSqlError err = query.lastError();
  QMessageBox::warning(nullptr, "Ошибка SQL", err.text());
}
