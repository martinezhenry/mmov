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
<?php if($this->countModules('slider')) : ?>
<div class="ja-slider">
	<jdoc:include type="modules" name="slider" />
</div>
<?php endif; ?>
