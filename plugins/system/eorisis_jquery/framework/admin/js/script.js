/**
 * ----------------------------------------------------------------------------
 * Software:		eorisis Framework
 * @author		eorisis http://eorisis.com
 * 
 * @copyright	Copyright (C) 2012-2015 eorisis. All Rights Reserved.
 * @license		eorisis Proprietary Use License: http://eorisis.com/license
 * ----------------------------------------------------------------------------
**/

var jq_loaded = false;
function eorisis_info()
{
	if (jq_loaded)
	{
		var head = document.getElementsByTagName("head")[0];
		script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "//code.jquery.com/jquery-migrate-*migrate_version*.min.js";
		head.insertBefore(script, head.childNodes[1]);

		var head = document.getElementsByTagName("head")[0];
		script = document.createElement("script");
		script.type = "text/javascript";
		script.innerHTML = "jQuery.noConflict();";
		head.insertBefore(script, head.childNodes[2]);
	}

	if (typeof(jQuery) === "undefined")
	{
		var head = document.getElementsByTagName("head")[0];
		script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "//code.jquery.com/jquery-*jquery_version*.min.js";
		head.insertBefore(script, head.firstChild);

		//	jQuery is now loaded
		jq_loaded = true;

		script.onload = function()
		{
			eorisis_info();
		};
	}
	else
	{
		jQuery(document).ready(function($)
		{
			$("#server-version").hide();
			$("#eo-dl-update").hide();
			$('#eo-latest').hide();
			$('#eo-release-date').hide();
			$("#eo-release-notes").hide();

			$("#eo-update-check a").fadeIn(500);

			function check_for_update()
			{
				$("#eo-update-check").fadeOut(500).hide();
				$("#server-version").fadeIn(500);

				$("#eo-version-no").text('Checking for update ..').fadeIn(500, function()
				{
					timer = setTimeout(function()
					{
						clearTimeout(timer);

						$.ajax(
						{
							url				: '*update_site_url*/*app_url*/version',
							type			: 'GET',
							data			: {'update':'*app_type*', 'software':'*app_url*'},
							dataType		: 'jsonp',
							jsonpCallback	: 'callback',
							contentType		: 'application/json; charset=utf-8',
							cache			: false,
							timeout			: 12000,
							success: function(response)
							{
								if ((typeof response['server_version'] !== 'undefined') &&
									(typeof response['infourl'] !== 'undefined') &&
									(typeof response['download_url'] !== 'undefined') &&
									(typeof response['release_date'] !== 'undefined') &&
									(typeof response['release_notes'] !== 'undefined'))
								{
									var server_version	= response['server_version'];
									var infourl			= response['infourl'];
									var download_url	= response['download_url'];
									var release_date	= response['release_date'];
									var release_notes	= response['release_notes'];

									$("#eo-infourl").wrap(function()
									{
										var link = $('<a/>');
										link.attr('href', infourl);
										link.attr('target', '_blank');
										link.attr('title', 'Opens in a new window');
										link.text($(this).text());
										return link;
									});

									$("#eo-version-no").fadeOut(300, function()
									{
										$("#eo-version-no").html('Latest Version: '+server_version).fadeIn(500);
										$("#eo-release").fadeIn(800);
										$('#server-version').animate({ height:"55px" }, 200, 'linear');

										if (server_version <= installed_version)
										{
											$('#eo-release').animate({ height:"40px" }, 200, 'linear');
											$('#eo-latest').text('You have the latest version').fadeIn();
											$('#eo-release-date').html('Release Date: '+release_date).fadeIn();
											$('#eo-infourl').html('Visit the software info page').fadeIn();
										}
										else if (server_version > installed_version)
										{
											$("#eo-dl-update").wrap(function()
											{
												var link = $('<a/>');
												link.attr('href', download_url);
												link.attr('target', '_blank');
												link.attr('title', 'Opens in a new window');
												link.text($(this).text());
												return link;
											});

											$('#eo-release').animate({ height:"60px" }, 200, 'linear');
											$('#eo-dl-update').fadeIn(150).fadeOut(150).fadeIn().fadeOut(150).fadeIn().text('A new version is available: Download Here');
											$('#eo-release-date').html('Release Date: '+release_date).fadeIn();
											$("#eo-release-notes").html('Release Notes: '+release_notes).fadeIn();
											$('#eo-infourl').html('Visit the software info page').fadeIn();

											$("#eo-release").addClass('new-update');
											$("span#eo-dl-update").addClass('blue');
										}
									});
								}
								else
								{
									conneciton_error();
								}
							},
							error: function()
							{
								conneciton_error();
							}
						});
						return false;

					}, 550);
				});
			}

			function conneciton_error()
			{
				$("#eo-version-no").fadeOut(function()
				{
					var title = 'Unable to connect to server';
					var desc = 'Could not get version information from the update server. The server may be offline or your browser is blocking the connection. You can try checking for an update using your Joomla Extension Manager. If this persists, please contact: info@eorisis.com';

					$('#server-version').animate({ height:'120px' }, 300, 'linear');
					$("#eo-version-no").addClass('error');
					$("#eo-dl-update").addClass('error');
					$("#eo-version-no").text(title).fadeIn();
					$('#eo-dl-update').text(desc).fadeIn();
				});
			}

			$('#eo-update-check').click(function()
			{
				check_for_update(this.href);
				return false;
			});
		});
	}
};
eorisis_info();
