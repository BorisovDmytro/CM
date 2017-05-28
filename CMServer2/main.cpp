#include <QCoreApplication>

#include <QDebug>
#include <QDir>
#include "cmserver.h"
#include "consoledebugloger.h"

#include "diffhelmanprotocol.h"

int main(int argc, char *argv[])
{
  QCoreApplication a(argc, argv);

  a.setApplicationName("CMServer");
  a.setApplicationVersion("1.00");

  ConsoleDebugLoger *pLoger = new ConsoleDebugLoger();

  QString configPath = QDir::currentPath() + "/server.json";
  pLoger->info("Config file path : " + configPath);

  CMServerSetting setting;

  try {
    setting.load(configPath);
  } catch(...) {
    pLoger->error("Error load config file, set default setting : host 127.0.0.1, port 8080 and start server");
    setting.setHost("127.0.0.1");
    setting.setPort(8080);
  }

  CMServer server(pLoger);
  server.start(setting);

  return a.exec();
}
