<?php
/**
* 2017 Zlab Solutions
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    Eugene Zubkov <magrabota@gmail.com>
*  @copyright 2017 Zlab Solutions
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*/

/**
* In some cases you should not drop the tables.
* Maybe the merchant will just try to reset the module
* but does not want to loose all of the data associated to the module.
*/

$sql = array();

// remove our carrier and payment table, keep order table for reinstall
$sql[] ='UPDATE `' . _DB_PREFIX_ . 'carrier` 
			SET deleted=1,
				active=0
			WHERE external_module_name="packetery"
            	OR id_carrier IN (SELECT id_carrier 
        							FROM `' . _DB_PREFIX_ . 'packetery_carrier`)';

$sql[] ='DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'packetery_carrier`';
$sql[] ='DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'packetery_payment`';
$sql[] ='DROP TABLE IF EXISTS` ' . _DB_PREFIX_ . 'packetery_address_delivery`';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
