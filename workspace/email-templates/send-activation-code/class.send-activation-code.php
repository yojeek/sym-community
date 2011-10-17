<?php

Class Send_activation_codeEmailTemplate extends EmailTemplate{

		
	public $datasources = Array(
 			'member_just_created',);
	public $layouts = Array(
 			'plain' => 'template.plain.xsl',);
	public $subject = 'Activation code';
	public $reply_to_name = '';
	public $reply_to_email_address = '';
	public $recipients = '{/data/member-just-created/entry/email}';
	
	public $editable = true;

	public $about = Array(
		'name' => 'Send Activation Code',
		'version' => '1.0',
		'author' => array(
			'name' => 'Miki Noidea',
			'website' => 'http://sym-community.local',
			'email' => 'antiplaka@gmail.com'
		),
		'release-date' => '2011-09-30T06:29:49+00:00'
	);	
}