<?php
defined('_JEXEC') or die;

/**
 * -------------------------------------------------------------------
 * Software:			eorisis jQuery
 * Software Type:	Joomla! System Plug-in
 * 
 * @author		eorisis http://eorisis.com
 * @copyright	Copyright (C) 2012-2015 eorisis. All Rights Reserved.
 * @license		GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
 * 
 * 'eorisis jQuery' is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License.
 * See /misc/licence.txt
 * -------------------------------------------------------------------
**/

class plgSystemEorisis_jQueryInstallerScript
{
	protected $J3;
	protected $current_path;
	protected $xml;
	protected $attributes;
	protected $client_id;
	protected $install_type;
	protected $version_upgrade;
	protected $element;
	protected $app_title;
	protected $app_title_full;
	protected $app_type;
	protected $app_group;
	protected $app_path;
	protected $media_dir;
	protected $release_date;
	protected $app_version_new = '';
	protected $app_version_old = '';
	protected $min_joomla_version = '';
	protected $min_php_version = '';
	protected $jversion = '';
	protected $manifest_cache;
	protected $html;
	protected $short_url;
	protected $thanks;
	protected $copyright;
	protected $new_jversion;
	protected $db;
	protected $ext_params;
	protected $update_multi;

	//	--------------------------------------------------

	function preflight($type, $parent)
	{
		//	Preflight is executed prior to any Joomla install, update or discover_install actions (or uninstall for plugins).
		$type = strtolower($type); // important

		//	Install or Update
		if (($type == 'install') or
			($type == 'update'))
		{
			if ($this->get_extension_details($parent))
			{
				//	Minimum PHP Version Check
				if (version_compare(PHP_VERSION, $this->min_php_version, '<'))
				{
					$warning  = 'Your PHP Version is '.PHP_VERSION;
					$warning .= ' - <b>'.$this->app_title.'</b> requires PHP Version '.$this->min_php_version.' or higher in order to work properly.';
					$warning .= ' Please upgrade your PHP';
					$this->warning($warning);
				}

				//	Minimum Joomla Version Check
				if (version_compare($this->jversion, $this->min_joomla_version, '<'))
				{
					$warning  = 'Your Joomla Version is too old. You are running Joomla! '.$this->jversion;
					$warning .= ' - The minimum Joomla Version for this '.ucfirst($this->app_type).' is '.$this->min_joomla_version.'. Please upgrade your Joomla!';
					$this->warning($warning);
					return false;
				}

				//	--------------------------------------------------

				$this->new_jversion = version_compare($this->jversion, '1.7.0', '>=');
				$this->install_type = $this->install_type();

				//	--------------------------------------------------

				//	Clean first
				$this->clean_dir_contents($this->app_path.'framework');
				$this->clean_dir_contents($this->media_dir);

				//	--------------------------------------------------

				$go_to_app = 'You may now go to your <strong>Extensions > '.ucfirst($this->app_type).' Manager > '.$this->app_title_full.'</strong>';

				//	Update
				if ($type == 'update')
				{
					$setup_text = 'Update';
					$this->app_version_old = preg_replace('/[^0-9a-zA-Z.-]+/', '', $this->manifest_cache('version'));
					$method = $this->install_type.'.';

					//	Upgrade to a newer version
					if (version_compare($this->app_version_new, $this->app_version_old, '>'))
					{
						$this->version_upgrade = true;
						$version_text  = 'You have upgraded from version <strong>'.$this->app_version_old.'</strong> to version <strong>'.$this->app_version_new.'</strong>';
						$version_text .= $this->release_date;
					}

					//	Downgrade
					elseif (version_compare($this->app_version_new, $this->app_version_old, '<'))
					{
						$version_text  = 'You have downgraded from version <strong>'.$this->app_version_old.'</strong> to version <strong>'.$this->app_version_new.'</strong>';
						$version_text .= $this->release_date.'<br />';
						$version_text .= 'This is not recommended, you may have lost your '.ucfirst($this->app_type).' settings.';
					}

					//	Re-installed the same version
					else
					{
						$version_text = 'You have re-installed version: <strong>'.$this->app_version_old.'</strong>'.$this->release_date;
					}

					$enable_app = '';
				}

				//	Install
				else
				{
					$setup_text = 'Installation';
					$version_text = 'Version Installed: <strong>'.$this->app_version_new.'</strong>'.$this->release_date;
					$method = $this->install_type.' - Fresh Install.';
					$enable_app = 'Remember to <strong>enable</strong> the '.ucfirst($this->app_type).'.<br />';
				}

				//	--------------------------------------------------

				$changelog_link = 'eorisis.com/'.$this->short_url.'/changelog';
				$changelog_link = '<a href="http://'.$changelog_link.'" target="_blank" title="'.JText::_('JBROWSERTARGET_NEW').'">'.$changelog_link.'</a>';
				$this->thanks = 'Thanks for choosing eorisis.';

				$html  = '<p>';
				$html .=	'<strong>'.$this->app_title.' ('.ucfirst($this->app_group).' '.ucfirst($this->app_type).')</strong> '.$setup_text.' Complete.<br />';
				$html .=	$version_text.'<br />';
				$html .=	'Method Used: '.$method.'<br />';
				$html .=	'Changelog: <strong>'.$changelog_link.'</strong><br />';
				$html .=	'<br />';
				$html .=	$go_to_app.'<br />';
				$html .=	$enable_app;
				$html .=	"(After an Install, Update or Uninstall, clear your Joomla! and browser's cache)<br />";
				$html .=	'<br />';
				$html .=	$this->thanks.'<br />';
				$html .=	$this->copyright;
				$html .= '</p>';
				$this->html = $html;
			}
			else
			{
				$this->warning('Installation aborted due to a package problem. Please report this to info@eorisis.com');
				return false;
			}
		}
		elseif ($type != 'uninstall')
		{
			$this->warning('You cannot use this Install Type');
			return false;
		}
	}

	//	--------------------------------------------------

	function install($parent)
	{
		$this->system_message();
	}

	//	--------------------------------------------------

	function update($parent)
	{
		if ($this->update_multi)
		{
			$this->html .= '<hr>';
		}

		$this->system_message();
	}

	//	--------------------------------------------------

	function uninstall($parent)
	{
		//	Uninstall cannot cause an abort of the Joomla uninstall action, so returning false would be a waste of time
	}

	//	--------------------------------------------------

	function postflight($type, $parent)
	{
		//	postflight() Executed after Install or Update. Not after uninstall
		//	--------------------------------------------------

		$type = strtolower($type); // important

		//	--------------------------------------------------

		if ($this->version_upgrade)
		{
			$versions = array(
				'1.2.0',
				'1.3.0',
				'1.3.3',
				'1.3.7'
			);

			foreach ($versions as $version)
			{
				if ($this->version_update($version))
				{
					require_once($this->current_path.'/updates/'.$version.'/update.php');
				}
			}

			if ($this->ext_params)
			{
				$this->set_params(json_encode($this->ext_params));
				unset($this->ext_params);
			}
		}

		//	--------------------------------------------------

		//	Re-enable the eorisis update sites in case they were disabled (bad connection or server down)
		$this->enable_update_sites();
	}

	//	--------------------------------------------------

	protected function get_extension_details($parent)
	{
		$this->J3 = version_compare(JVERSION, 3, '>=');
		$this->current_path = dirname(__FILE__);
		$this->xml = $parent->get('manifest');
		$this->element = (string)$this->xml->name;

		if ($this->xml and $this->element)
		{
			$this->attributes = $this->xml->attributes();
			$this->app_type = (string)$this->attributes->type;

			if (defined('JPATH_SITE') and
				defined('JPATH_ADMINISTRATOR'))
			{
				if (($this->app_type == 'template') or
					($this->app_type == 'module'))
				{
					$type_dir = '/'.$this->app_type.'s/';
					switch ((string)$this->attributes->client)
					{
						case 'site'			: $this->client_id = '0'; $root_path = JPATH_SITE.$type_dir; break;
						case 'administrator': $this->client_id = '1'; $root_path = JPATH_ADMINISTRATOR.$type_dir; break;
					}
				}
				elseif ($this->app_type == 'plugin')
				{
					$this->app_group = (string)$this->attributes->group;
					$this->app_title_full = $this->app_title_full();
					$root_path = JPATH_SITE.'/plugins/'.$this->app_group.'/';
				}
				else
				{
					return false;
				}

				$this->media_dir = $this->media_destination();
				$this->app_path = $root_path.$this->element.'/';
				$this->app_title = (string)$this->xml->title;
				$this->jversion = $this->version_correction(JVERSION);
				$this->min_joomla_version = (string)$this->attributes->version;
				$this->min_php_version = (string)$this->xml->min_php_version;
				$this->app_version_new = (string)$this->xml->version;
				$this->release_date = ' - Released on '.(string)$this->xml->creationDate.'.';
				$this->short_url = (string)$this->xml->short_url;
				$this->copyright = str_replace('(C)', '&copy', (string)$this->xml->copyright);

				return true;
			}
		}
	}

	//	--------------------------------------------------

	protected function media_destination()
	{
		if ($media_dir = (string)$this->xml->media['destination'])
		{
			$media_dir = preg_replace('/[^a-zA-Z_-]+/', '', $media_dir);

			if (strlen($media_dir))
			{
				return JPATH_SITE.'/media/'.$media_dir.'/';
			}
		}
	}

	//	--------------------------------------------------

	protected function install_type()
	{
		$install_type = null;

		if (isset($_POST['task']))
		{
			$task = $_POST['task'];
			if ($this->J3 or (isset($_POST['option']) and ($_POST['option'] == 'com_installer')))
			{
				//	J3.x task: install.install
				//	J2.x task: install
				if ((($task == 'install.install') or ($task == 'install')) and isset($_POST['installtype']))
				{
					$install_type = $_POST['installtype']; // upload, folder, url
				}

				//	J3.x task: update.update
				//	J2.x task: update
				elseif ((($task == 'update.update') or ($task == 'update')) and isset($_POST['boxchecked']))
				{
					if ($_POST['boxchecked'] == 1)
					{
						$install_type = 'update';
					}
					elseif ($_POST['boxchecked'] > 1)
					{
						$this->update_multi = true;
						$install_type = 'update_multi';
					}
				}
			}
		}

		//	discover_install is NOT firing the intaller
		switch ($install_type)
		{
			case 'update'		: return 'Joomla Update';
			case 'update_multi'	: return 'Joomla Update (Multiple Extensions)';
			case 'upload'		: return 'Upload Package File (File Upload)';
			case 'folder'		: return 'Install from Directory';
			case 'url'			: return 'Install from URL';
			default: return 'Unknown';
		}
	}

	//	--------------------------------------------------

	protected function clean_dir_contents($path, $exceptions = false)
	{
		if (is_dir($path) === true)
		{
			$exceptions_default = array(
				'.',
				'..',
				'.htaccess',
				'.htpasswd',
				'.ftpquota');

			if ($exceptions)
			{
				if (is_array($exceptions))
				{
					if (!empty($exceptions))
					{
						$exceptions = array_merge($exceptions_default, $exceptions);
						$exceptions = array_unique($exceptions);
					}
				}
				elseif (is_string($exceptions))
				{
					$exceptions_default[] = (string)$exceptions;
					$exceptions = $exceptions_default;
				}
			}
			else
			{
				$exceptions = $exceptions_default;
			}

			$contents = array_diff(scandir($path), $exceptions);

			//	--------------------------------------------------

			foreach ($contents as $item)
			{
				$this->delete(realpath($path).'/'.$item);
			}

			return true;
		}
	}

	//	--------------------------------------------------

	protected function delete($path)
	{
		if (is_dir($path) === true)
		{
			$contents = array_diff(scandir($path), array('.', '..'));

			foreach ($contents as $item)
			{
				$this->delete(realpath($path).'/'.$item);
			}

			return rmdir($path);
		}
		elseif (is_file($path) === true)
		{
			return unlink($path);
		}

		return false;
	}

	//	--------------------------------------------------

	protected function warning($warning)
	{
		Jerror::raiseWarning(null, $warning);
	}

	//	--------------------------------------------------

	protected function system_message()
	{
		if ($this->J3)
		{
			$type = 'notice';
		}
		else
		{
			$type = 'message';
		}

		JFactory::getApplication()->enqueueMessage($this->html, $type);
	}

	//	--------------------------------------------------

	protected function version_correction($version)
	{
		if (strlen($version) == 3)
		{
			$version .= '.0';
		}

		return $version;
	}

	//	--------------------------------------------------

	protected function quote_name($name)
	{
		if ($this->new_jversion)
		{
			return $this->db->quoteName($name);
		}

		return $this->db->nameQuote($name);
	}

	//	--------------------------------------------------

	protected function manifest_cache($value = false)
	{
		if (!$this->manifest_cache)
		{
			$db = JFactory::getDbo();
			$this->db = $db;
			$query = $db->getQuery(true);

			if (isset($this->client_id)) // template, module
			{
				$condition = $this->quote_name('client_id').'='.$db->quote($this->client_id);
			}
			elseif (isset($this->app_group)) // plugin
			{
				$condition = $this->quote_name('folder').'='.$db->quote($this->app_group);
			}

			$query->select($this->quote_name('manifest_cache'));
			$query->from($this->quote_name('#__extensions'));
			$query->where(array(
				$this->quote_name('type').'='.$db->quote($this->app_type),
				$this->quote_name('element').'='.$db->quote($this->element),
				$condition));
			$db->setQuery($query);
			$this->manifest_cache = json_decode($db->loadResult());
		}

		if ($this->manifest_cache)
		{
			if ($value)
			{
				return (string)$this->manifest_cache->$value;
			}

			return $this->manifest_cache;
		}
	}

	//	--------------------------------------------------

	protected function app_title_full()
	{
		$current_path = str_replace('framework'.DIRECTORY_SEPARATOR.'install', '', $this->current_path);

		if ($ini = $current_path.'language/'.(string)$this->xml->languages->language[1])
		{
			$ini = parse_ini_file($ini);
			return $ini[strtoupper($this->element)];
		}
	}

	//	--------------------------------------------------

	protected function enable_update_sites()
	{
		$table = '#__update_sites';

		$db = JFactory::getDbo();
		$this->db = $db;
		$query = $db->getQuery(true);
		$query->select(array(
			$this->quote_name('update_site_id'),
			$this->quote_name('name'),
			$this->quote_name('location'),
			$this->quote_name('enabled')));
		$query->from($this->quote_name($table));
		$db->setQuery($query);
		$update_sites = $db->loadObjectList();

		foreach ($update_sites as $object)
		{
			if (is_object($object) and
				($object->enabled != 1) and
				(strpos($object->name, 'eorisis') === 0) and
				(strpos($object->location, 'eorisis.com') !== false))
			{
				$db = JFactory::getDbo();
				$this->db = $db;
				$query = $db->getQuery(true);
				$query->update($this->quote_name($table));
				$query->set($this->quote_name('enabled').'='.$db->quote(1));
				$query->where($this->quote_name('update_site_id').'='.$db->quote($object->update_site_id));
				$db->setQuery($query);
				$db->query();
			}
		}
	}

	//	--------------------------------------------------

	protected function version_update($version)
	{
		if (version_compare($this->app_version_old, $version, '<'))
		{
			if ($this->ext_params = $this->get_params())
			{
				return true;
			}
		}
	}

	//	--------------------------------------------------

	protected function get_params()
	{
		if (!$this->ext_params)
		{
			$db = JFactory::getDbo();
			$this->db = $db;
			$query = $db->getQuery(true);
			$query->select($this->quote_name('params'));
			$query->from($this->quote_name('#__extensions'));
			$query->where(array(
				$this->quote_name('type').'='.$db->quote($this->app_type),
				$this->quote_name('folder').'='.$db->quote($this->app_group),
				$this->quote_name('element').'='.$db->quote($this->element)));
			$db->setQuery($query);

			$params = json_decode($db->loadResult());
			if ($params and is_object($params))
			{
				return $params;
			}

			return null;
		}

		return $this->ext_params;
	}

	//	--------------------------------------------------

	protected function set_params($params)
	{
		$db = JFactory::getDbo();
		$this->db = $db;
		$query = $db->getQuery(true);
		$query->update($this->quote_name('#__extensions'));
		$query->set($this->quote_name('params').'='.$db->quote($params));
		$query->where(array(
			$this->quote_name('type').'='.$db->quote($this->app_type),
			$this->quote_name('folder').'='.$db->quote($this->app_group),
			$this->quote_name('element').'='.$db->quote($this->element)));
		$db->setQuery($query);
		$db->query();
	}
}
