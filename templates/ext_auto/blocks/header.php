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
<?php
$app = & JFactory::getApplication();
$siteName = $app->getCfg('sitename');
if ($this->getParam('logoType', 'image')=='image'): ?>
<h1 class="logo">
    <a href="<?php JURI::base(true) ?>" title="<?php echo $siteName; ?>"><span><?php echo $siteName; ?></span></a>
</h1>
<?php else:
$logoText = (trim($this->getParam('logoText'))=='') ? $siteName : JText::_(trim($this->getParam('logoText')));
$sloganText = JText::_(trim($this->getParam('sloganText'))); ?>
<div class="logo-text">
	<h1><a href="index.php" title="<?php echo $siteName; ?>"><span><?php echo $logoText; ?></span></a></h1>
	<p class="site-slogan"><?php echo $sloganText;?></p>
</div>
<?php endif; ?>

<?php if($this->countModules('adv')) : ?>
<div id="ext-adv">
	<jdoc:include type="modules" name="adv" />
</div>
<?php endif; ?>

<?php if($this->countModules('cart')) : ?>
<div id="ext-cart">
	<jdoc:include type="modules" name="cart" />
</div>
<?php endif; ?>
