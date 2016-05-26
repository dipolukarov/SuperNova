<?php

/**
 * Class DBStaticRecord
 */
class DBStaticRecord {

  public static $_table = '_table';
  public static $_idField = 'id';

  /**
   * @var db_mysql $dbStatic
   */
  protected static $dbStatic;

  /**
   * DBStaticRecord constructor.
   *
   * @param db_mysql|null $db
   */
  public static function _init($db = null) {
    static::$dbStatic = (!empty($db) && $db instanceof db_mysql) || !class_exists('classSupernova', false) ? $db : classSupernova::$db;
  }

  /**
   * @return DbSqlStatement
   */
  public static function buildSelect() {
    return DbSqlStatement::build(null)->getParamsFromStaticClass(get_called_class())->select(false);
  }

  /**
   * @return DbSqlStatement
   */
  public static function buildSelectAll() {
    return static::buildSelect()->field('*');
  }

  /**
   * @return DbSqlStatement
   */
  public static function buildSelectLock() {
    return
      static::buildSelect()->field(1)
        ->forUpdate();
  }

  /**
   * @param array       $where
   * @param mixed|array $fieldList
   *     Field list can be scalar - it would be converted to array and used as field name
   * @param bool        $for_update
   *
   * @return array|null
   *
   * @see static::getRecordList
   */
  protected static function getRecord($where = array(), $fieldList = '*', $for_update = false) {
    $result = static::fetchOne(
      static::buildSelect()->fields($fieldList)
        ->where($where)
    );

    return $result;
  }

  /**
   * Get maximum ID from table
   *
   * @return int
   */
  public static function getMaxId() {
    $maxId = static::getRecord(array(), DbSqlLiteral::build()->max(static::$_idField, 'maxId'));

    return !empty($maxId['maxId']) ? $maxId['maxId'] : 0;
  }

  /**
   * @param int|string  $recordId
   * @param mixed|array $fieldList
   * @param bool        $forUpdate
   *
   * @return array|null
   */
  public static function getRecordById($recordId, $fieldList = '*', $forUpdate = false) {
    return static::getRecord(array(static::$_idField . '=' . $recordId), $fieldList, $forUpdate);
  }

  /**
   * @param DbSqlStatement $statement
   *
   * @return array|bool|mysqli_result|null
   */
  protected static function execute($statement) {
    return static::$dbStatic->execute((string)$statement);
  }

  /**
   * @param DbSqlStatement $statement
   *
   * @return array|null
   */
  protected static function fetchOne($statement) {
    return static::$dbStatic->fetchOne($statement);
  }

  /**
   * @param array $idList
   *
   * @return mysqli_result|null
   */
  /**
   * @param array $idList
   *
   * @return mysqli_result|null
   */
  public static function queryExistsIdInList($idList) {
    $query = null;
    if (!empty($idList) && is_array($idList)) {
      $query = static::execute(
        static::buildSelectAll()
          ->fields(static::$_idField)
          ->where(array("`" . static::$_idField . "` IN (" . implode(',', $idList) . ")"))
      );
    }

    return !empty($query) ? $query : null;
  }


  /**
   * @param string $idList
   *
   * @return string
   */
  public static function filterIdListStringRepack($idList) {
    // TODO - remove HelperArray caller
    $idList = HelperArray::stringToArrayFilterEmpty($idList);

    $result = array();
    if (!empty($idList)) {
      $query = static::queryExistsIdInList($idList);
      while($row = db_fetch($query)) {
        $result[] = $row[static::$_idField];
      }
    }

    // TODO - remove implode
    return implode(',', $result);
  }

  /**
   *
   */
  public static function lockAllRecords() {
    static::execute(
      static::buildSelectLock()
    );
  }

  /**
   * Builds and Executes prepared statement
   *
   * @param string $sqlQuery
   * @param array  $values
   *
   * @return array|bool|mysqli_result|null
   */
  protected static function prepareExecute($sqlQuery, $values = array()) {
    return static::$dbStatic->sqlPrepareAndExecute($sqlQuery, $values);
  }

  /**
   * Builds and executes prepared statement then return first record from sets
   *
   * @param string $sqlQuery
   * @param array  $values
   *
   * @return array|null
   */
  protected static function prepareFetchOne($sqlQuery, $values = array()) {
    return static::$dbStatic->db_fetch(static::prepareExecute($sqlQuery, $values));
  }

  /**
   * Builds and executes prepared statement then fetches first record from sets and returns value from first field
   *
   * @param string $sqlQuery
   * @param array  $values
   *
   * @return mixed|null
   */
  protected static function prepareFetchValue($sqlQuery, $values = array()) {
    $result = static::prepareFetchOne($sqlQuery, $values);
    if (empty($result) || !array($result)) {
      $result = null;
    } else {
      $result = array_pop($result);
    }

    return $result;
  }

}

DBStaticRecord::_init();