<?php
$doc->addStyleSheet(JUri::base() . 'templates/system/css/system.css', $type = 'text/css');
$doc->addStyleSheet(JUri::base() . 'templates/' . $this->template . '/css/template.css', $type = 'text/css');
$doc->addStyleSheet(JUri::base() . 'templates/' . $this->template . '/css/bootstrap.css', $type = 'text/css');
if($expand=="yes" OR $expand=="true") { $doc->addStyleSheet(JUri::base() . 'templates/' . $this->template . '/css/expand1060.css', $type = 'text/css'); }
if($expand=="true") { $doc->addStyleSheet(JUri::base() . 'templates/' . $this->template . '/css/expand1240.css', $type = 'text/css'); }
$doc->addScript($this->baseurl . '/templates/' . $this->template . '/js/jquery.min.js', 'text/javascript');
$doc->addScript($this->baseurl . '/templates/' . $this->template . '/js/bootstrap.min.js', 'text/javascript');
$doc->addScript($this->baseurl . '/templates/' . $this->template . '/js/respond.min.js', 'text/javascript');
if($jqueryactive=="yes") {$doc->addScript($this->baseurl . '/templates/' . $this->template . '/js/jquery.js', 'text/javascript'); }
?>