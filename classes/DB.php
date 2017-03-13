<?php

/**
 * User: Gorlum
 * Date: 02.09.2015
 * Time: 0:41
 */
class DB
{

    const DB_PGSQL_TRANSACTION_SERIALIZABLE = 'SERIALIZABLE';
    const DB_PGSQL_TRANSACTION_REPEATABLE_READ = 'REPEATABLE READ';
    const DB_PGSQL_TRANSACTION_READ_COMMITTED = 'READ COMMITTED';
    const DB_PGSQL_TRANSACTION_READ_UNCOMMITTED = 'READ UNCOMMITTED';

    /**
     * Соединение с PostgreSQL
     *
     * @var \PDO $link
     */
    private $link = null;
    
    /**
     * 
     * @var \PDOStatement
     */
    private $stmt = null;

    /**
     * Статус соеднения с PostgreSQL
     *
     * @var bool
     */
    public $connected = false;

    // public $dbsettings = array();

    function __construct($settings) {
        global $debug;

        static $need_keys = array('host', 'user', 'pass', 'dbname', 'schema');

        if ($this->connected) {
            return true;
        }

        if (empty($settings) || !is_array($settings) || array_intersect($need_keys, array_keys($settings)) != $need_keys) {
            $debug->error_fatal('There is missconfiguration in your config.php. Check it again');
        }

        $this->link = new \PDO(sprintf('pgsql:port=5432;dbname=%s;', $settings->dbname), $settings->user, $settings->pass);
        if (!$this->link instanceof \PDO) {
            $debug->error_fatal('DB Error - cannot connect to server error #' . $this->link->connect_errno, $this->link->connect_error);
        }


        $this->connected = true;

        return true;
    }

    function query($query_string)
    {
        $this->stmt = $this->link->query($query_string);
        
        return $this->stmt;
    }

    function fetch_assoc(\PDOStatement $query)
    {
        return $query->fetch(\PDO::FETCH_ASSOC);
    }

    function fetch_row(\PDOStatement $query)
    {
        return $query->fetch();
    }

    function __destruct() {
        if ($this->link instanceof \PDO) {
            $this->connected = false;
            unset($this->link);
        }

        return true;
    }

    function error()
    {
        return $this->link->errorInfo();
    }

    function insert_id()
    {
        return $this->link->lastInsertId();
    }

    function num_rows(\PDOStatement $result)
    {
        return $result->rowCount();
    }

}
