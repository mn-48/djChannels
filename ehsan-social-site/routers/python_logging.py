from logging import *
log_format = ' {lineno} : {name} at {asctime} //  {message}'

basicConfig(filename='logfile1.log', level=DEBUG, filemode='w', style='{', format=log_format)

# logger= getLogger()
logger= getLogger('fahad')

# debug("This is From Debug: 10")
# info("This is From info: 20")
# warning("This is From warning: 30")
# error("This is From error: 40")
# critical("This is From critical: 50")
logger.debug("This is From Debug: 10")
logger.info("This is From info: 20")
logger.warning("This is From warning: 30")
logger.error("This is From error: 40")
logger.critical("This is From critical: 50")


# For django Mannual Logging

import logging, traceback

logger=logging.getLogger('django') # djngo named on settings

logger.debug("This is From Debug: 10")
logger.info("This is From info: 20")
logger.warning("This is From warning: 30")
logger.error("This is From error: 40")
logger.critical("This is From critical: 50")

