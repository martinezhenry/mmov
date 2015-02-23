<?php defined('_JEXEC') or die('Restricted access'); JHtml::_('behavior.framework', true); ?>
<?php require_once dirname(__FILE__).DIRECTORY_SEPARATOR.'framework/functions.php'; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jdoc:include type="head" />
</head>

<body class="<?php echo $this->params->get('fontfamily'); ?>">
<?php if($this->countModules('topmenu') or $this->countModules('topright')) : ?>
<div id="top-outer" class="clr">
<div id="top-float">
<div id="top-inner">
<?php if($this->countModules('topmenu')) : ?>
<div id="topmenu">
<jdoc:include type="modules" name="topmenu" style="none" />
</div>
<?php endif; ?>
<?php if($this->countModules('topright')) : ?>
<div id="topright">
<jdoc:include type="modules" name="topright" style="none" />
</div>
<?php endif; ?>
</div>
</div>
</div>
<?php endif; ?>
<?php if($showheader=="yes") { ?>
<div id="header-outer" class="clr">
<div id="header-inner">
<div id="logo">
<img class="logo" src="<?php echo $this->baseurl; ?>/<?php echo "$logo"; ?>" />
</div>
<?php if($this->countModules('toolbar')) : ?>
<div id="navigation" class="navbar navbar-inverse" role="navigation">
<span class="navigation">Menu</span>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<div id="toolbar" class="navbar-collapse collapse">
<jdoc:include type="modules" name="toolbar" style="none" />
</div>
</div>
<?php endif; ?>
</div>
</div>
<?php } ?>
<?php if($this->countModules('banner')) : ?>
<div id="banner-outer" class="clr">
<div id="<?php if($bannerwidth=="fix") { echo "banner-float"; } elseif($bannerwidth=="wide") { echo "banner-border"; } ?>">
<div<?php if($bannerwidth=="fix") { echo ' id="banner-inner"'; } ?>>
<jdoc:include type="modules" name="banner" style="none" />
</div>
</div>
</div>
<?php endif; ?>
<div id="spacer" class="clr">&nbsp;</div>
<div id="body-outer" class="clr">
<div id="body-float">
<div id="body-inner" class="<?php echo $centerposition; ?>">
<?php if($this->countModules('left')) : ?>
<div id="left<?php echo $columns; ?>">
<jdoc:include type="modules" name="left" style="xhtml" />
</div>
<?php endif; ?>
<div id="body<?php echo $columns; ?>">
<?php $mClasses = modulesClasses('block1'); if ($this->countModules('user1') or $this->countModules('user2') or $this->countModules('user3')) : ?>
<div id="user<?php echo $columns; ?>" class="clr">
<div class="<?php echo $user_width; ?>">
<?php if($this->countModules('user1')) : ?>
<div class="user <?php echo $mClasses['user1'][0]; ?>">
<jdoc:include type="modules" name="user1" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user2')) : ?>
<div class="user <?php echo $mClasses['user2'][0]; ?>">
<jdoc:include type="modules" name="user2" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user3')) : ?>
<div class="user <?php echo $mClasses['user3'][0]; ?>">
<jdoc:include type="modules" name="user3" style="xhtml" />
</div>
<?php endif; ?>
</div>
</div>
<?php endif; ?>
<?php $mClasses = modulesClasses('block2'); if ($this->countModules('user4') or $this->countModules('user5') or $this->countModules('user6')) : ?>
<div id="user<?php echo $columns; ?>" class="clr">
<div class="<?php echo $user2_width; ?>">
<?php if($this->countModules('user4')) : ?>
<div class="user <?php echo $mClasses['user4'][0]; ?>">
<jdoc:include type="modules" name="user4" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user5')) : ?>
<div class="user <?php echo $mClasses['user5'][0]; ?>">
<jdoc:include type="modules" name="user5" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user6')) : ?>
<div class="user <?php echo $mClasses['user6'][0]; ?>">
<jdoc:include type="modules" name="user6" style="xhtml" />
</div>
<?php endif; ?>
</div>
</div>
<?php endif; ?>
<div class="clr">
<div id="layer<?php echo $columns; ?>">
<div id="mainbody" class="clr">
<jdoc:include type="message" />
<jdoc:include type="component" />
</div>
</div>
</div>
<?php $mClasses = modulesClasses('block3'); if ($this->countModules('user7') or $this->countModules('user8') or $this->countModules('user9')) : ?>
<div id="user<?php echo $columns; ?>" class="clr">
<div class="<?php echo $user3_width; ?>">
<?php if($this->countModules('user7')) : ?>
<div class="user <?php echo $mClasses['user7'][0]; ?>">
<jdoc:include type="modules" name="user7" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user8')) : ?>
<div class="user <?php echo $mClasses['user8'][0]; ?>">
<jdoc:include type="modules" name="user8" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('user9')) : ?>
<div class="user <?php echo $mClasses['user9'][0]; ?>">
<jdoc:include type="modules" name="user9" style="xhtml" />
</div>
<?php endif; ?>
</div>
</div>
<?php endif; ?>
</div>
<?php if($this->countModules('right')) : ?>
<div id="right<?php echo $columns; ?>">
<jdoc:include type="modules" name="right" style="xhtml" />
</div>
<?php endif; ?>
</div>
</div>
</div>
<div id="footer-border">
<?php $mClasses = modulesClasses('block4'); if ($this->countModules('footer1') or $this->countModules('footer2') or $this->countModules('footer3') or $this->countModules('footer4') or $this->countModules('footer5')) : ?>
<div id="footer-outer" class="clr">
<div id="footer-float">
<div id="footer-inner">
<div class="<?php echo $footer_width; ?>">
<?php if($this->countModules('footer1')) : ?>
<div class="footer <?php echo $mClasses['footer1'][0]; ?>">
<jdoc:include type="modules" name="footer1" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('footer2')) : ?>
<div class="footer <?php echo $mClasses['footer2'][0]; ?>">
<jdoc:include type="modules" name="footer2" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('footer3')) : ?>
<div class="footer <?php echo $mClasses['footer3'][0]; ?>">
<jdoc:include type="modules" name="footer3" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('footer4')) : ?>
<div class="footer <?php echo $mClasses['footer4'][0]; ?>">
<jdoc:include type="modules" name="footer4" style="xhtml" />
</div>
<?php endif; ?>
<?php if($this->countModules('footer5')) : ?>
<div class="footer <?php echo $mClasses['footer5'][0]; ?>">
<jdoc:include type="modules" name="footer5" style="xhtml" />
</div>
<?php endif; ?>
</div>
</div>
</div>
</div>
<?php endif; ?>
<?php include("$copyframe"); ?>
</div>
</body>
</html>