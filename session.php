<?php
define( '_JEXEC', 1 );
define('JPATH_BASE', __DIR__);
 
require_once ( JPATH_BASE . '/includes/defines.php' );
require_once ( JPATH_BASE . '/includes/framework.php' );
$mainframe = JFactory::getApplication('site');
$mainframe->initialise();