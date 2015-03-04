<?php
defined('_JEXEC') or die;

/**
 * ------------------------------------------------------------------
 * Software:		eorisis Framework
 * @author		eorisis http://eorisis.com
 * @copyright	Copyright (C) 2012-2015 eorisis. All Rights Reserved.
 * ------------------------------------------------------------------
**/

class eorisis_jquery extends plgSystemEorisis_jQuery
{
	protected static $loaded = array(
		'lib' => null,
		'noconflict' => null);

	//	--------------------------------------------------

	public static function set_loaded($key, $value)
	{
		$valid = array('lib', 'noconflict');

		if (in_array($key, $valid))
		{
			$value = filter_var($value, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);
			self::$loaded[$key] = $value;
		}
	}

	//	--------------------------------------------------

	public static function loaded($value = null)
	{
		if ($value)
		{
			return self::$loaded[$value];
		}

		return (object)self::$loaded;
	}
}
