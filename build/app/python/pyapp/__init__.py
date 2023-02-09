import logging.config
from datetime import datetime


class ColorFormatter(logging.Formatter):
    COLORS = {
        logging.DEBUG: "\x1b[37;20m",
        logging.INFO: "\x1b[96;20m",
        logging.WARNING: "\x1b[93;20m",
        logging.ERROR: "\x1b[91;20m",
        logging.CRITICAL: "\x1b[97;41;20m",
    }

    msg_formatter = logging.Formatter("%(message)s")

    def format(self, record):
        s = ""
        dt = datetime.fromtimestamp(record.created)
        prefix = "{}  {}{}\x1b[0m  {}/{}:{}  ".format(dt.strftime("%Y-%m-%d %H:%M:%S"),
                                                      ColorFormatter.COLORS[record.levelno], record.levelname,
                                                      record.module, record.filename, record.lineno)

        msg = ColorFormatter.msg_formatter.format(record)
        for x in msg.splitlines(keepends=True):
            s += prefix + "\t" + x

        return s


def setup_logging(level):
    logging.config.dictConfig({
        "version": 1,
        "disable_existing_loggers": False,
        "formatters": {
            "console": {
                "class": "pyapp.ColorFormatter",
            },
            "extended": {
                "format": "%(asctime)s | %(levelname)s | %(message)s | %(name)s",
            },
            "access": {
                "format": "%(message)s",
            },
        },
        "handlers": {
            "console": {
                "class": "logging.StreamHandler",
                "formatter": "console",
                "stream": "ext://sys.stdout",
            },
        },
        "loggers": {
            "": {
                "handlers": ["console"],
                "level": level
            },
        },
    })

    log = logging.getLogger(__name__)
