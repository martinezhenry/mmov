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
<div id="ext-top">
<?php if($this->countModules('search')) : ?>
<div id="top_l">
	<jdoc:include type="modules" name="search" />
</div>
<?php endif; ?>
<?php if($this->countModules('social')) : ?>
<div id="top_r">
	<jdoc:include type="modules" name="social" />
</div>
<?php endif; ?>
</div>