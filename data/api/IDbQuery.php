<?php
/**
 * IAddress.php
 *
 */
namespace data\api;


/**
 * 数据库执行接口
 */
interface IDbQuery
{
    /**
     * 修复表
     * @param unknown $tables
     */
    function repair($tables);
    
    /**
     * 优化表
     */
    function optimize($tables);
    /**
     * 执行sql
     * @param unknown $sql
     */
    function sqlQuery($sql);
    /**
     * 查询所有表
     */
    function getDatabaseList();
}
