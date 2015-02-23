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
<?php if (($jamenu = $this->loadMenu())) $jamenu->genMenu (); ?>
<!-- jdoc:include type="menu" level="0" / -->
<?php if ($this->hasSubmenu() && ($jamenu = $this->loadMenu())) : ?>
<div id="ja-subnav" class="clearfix">
<?php $jamenu->genMenu (1); ?>
<!-- jdoc:include type="menu" level="1" / -->
</div>
<?php endif;?>

<ul class="no-display">
    <li><a href="<?php echo $this->getCurrentURL();?>#ja-content" title="<?php echo JText::_("SKIP_TO_CONTENT");?>"><?php echo JText::_("SKIP_TO_CONTENT");?></a></li>
</ul>
