{*
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
*}
{if soap_disabled eq 1}
	<ps-alert-error>{l s='Soap is disabled. You have to enable Soap on your server' mod='packetery'}</ps-alert-error>
{/if}

<input type="hidden" name="check_e" id="check_e" value="{$check_e|escape:'htmlall':'UTF-8'}">
<input type="hidden" name="baseuri" id="baseuri" value="{$baseuri|escape:'htmlall':'UTF-8'}">
<div id="packetery-form">
	<div id="top_packetery">
		<img id ="top_packetery_image" src="{$module_dir|escape:'html':'UTF-8'}/logo.png" id="payment-logo" class="pull-right" />
		<div id="top_packetery_text">
			<i class="icon icon-truck"></i> {l s='Zasilkovna Dashboard' mod='packetery'}
		</div>
	</div>
	<ps-tabs position="top">
		<ps-tab title="{l s='Orders' mod='packetery'}" id="tab-orders" {if $active_tab_settings neq 1}active="true"{/if} icon="icon-AdminParentModules" >
		    {include file="./tab_orders.tpl"}
		</ps-tab>
		<ps-tab title="{l s='Settings' mod='packetery'}" id="tab-settings" {if $active_tab_settings eq 1}active="true"{/if} icon="icon-AdminParentModules" >
		    {include file="./tab_settings.tpl"}
		</ps-tab>
		<ps-tab title="{l s='Branches' mod='packetery'}" id="tab-branch" >
		    {include file="./tab_branch.tpl"}
		</ps-tab>
	    <ps-tab title="{l s='FAQ' mod='packetery'}" id="faq">
	        {include file="./tab_faq.tpl"}
	    </ps-tab>
	</ps-tabs>
</div>
