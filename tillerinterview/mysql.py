"""
This modules defines the interface to get a connection to MySQL.

*Example of use*:

.. code-block:: python
    :linenos:

    import mysql

    # Gets a connection
    conn = mysql.get_connection()

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Runs a select query
    query = conn.cursor()
    query.execute("select `id`, `name` from `store` limit 10 ;")

    # To go through all results
    for row in query:
        # To access the collected values:
        print row['id']
        print row['name']

    query.close()

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Runs a insert query
    query = conn.cursor()
    query.execute("insert into `product` (`name`, `unit_price`) values (%s, %s)", 'MyProduct', 123)

    query.close()

    conn.close()


For more information visit `MySQLdb reference <http://mysql-python.sourceforge.net/MySQLdb.html#mysqldb>`.

"""
import os
import re
import sys
import MySQLdb
import MySQLdb.cursors


def get_connection():
    """
    Gets a connection object to the MySQL database.

    :return: A connection object.
    :rtype: :class:`MySQLdb.connections.Connection`
    """
    caller = sys.argv[0] if len(sys.argv) > 0 else None
    if caller is None:
        raise Exception('No argv')

    m = re.search(r'.*(\d)\.py', caller)
    if not m or m.group(1) not in ['1', '2', '3']:
        raise Exception('Caller not recognized')

    return MySQLdb.connect(
        host='BDD',
        port=3306,
        user=os.environ['MYSQL_USER'],
        passwd=os.environ['MYSQL_PASSWORD'],
        db='oltp{}'.format(m.group(1)),
        cursorclass=MySQLdb.cursors.DictCursor)
