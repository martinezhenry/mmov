<?php
/*
# ------------------------------------------------------------------------
# Extensions for Joomla 2.5
# ------------------------------------------------------------------------
# Copyright (C) 2011-2012 Ext-Joom.com. All Rights Reserved.
# @license - PHP files are GNU/GPL V2.
# Author: Ext-Joom.com
# Websites:  http://www.ext-joom.com
# ------------------------------------------------------------------------
*/
// No direct access
defined('_JEXEC') or die;
?>
<div class="ja-copyright">
	<p>Design by <a href="http://platinum-joomla-templates.com" title="Joomla templates">Platinum-Joomla-Templates.com</a></p>
</div>

<?php if($this->countModules('footnav')) : ?>
<div class="ja-footnav">
	<jdoc:include type="modules" name="footnav" />
</div>
<?php endif; ?>


<?php 
$t3_logo = $this->getParam ('setting_t3logo', 't3-logo-light', 't3-logo-dark');
if ($t3_logo != 'none') : ?>
<div id="ja-poweredby" class="<?php echo $t3_logo ?>">
	<a href="http://t3.joomlart.com" title="Powered By T3 Framework" target="_blank">Powered By T3 Framework</a>
</div>  	
<?php endif; ?>
