# Load usual np/pd libraries

import numpy as np
import pandas as pd

# Load SQL magics
import sqlalchemy
import psycopg2
import os

connect_to_db = 'postgresql+psycopg2://{}:{}@{}:{}/{}'.format(os.environ.get('Rio_DBUSER'),
                                                            os.environ.get('Rio_DBPASS'),
                                                            os.environ.get('Rio_DBHOST'),
                                                            os.environ.get('Rio_DBPORT'),
                                                            os.environ.get('Rio_DBNAME'))

%load_ext sql
%config SqlMagic.displaylimit=10
%sql $connect_to_db
