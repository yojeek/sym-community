<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventmembers_edit extends Event{

		const ROOTELEMENT = 'members-edit';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Members: Edit',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-11-01T18:28:17+00:00',
				'trigger-condition' => 'action[members-edit]'
			);
		}

		public static function getSource(){
			return '2';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-edit result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/members-edit></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;members-edit result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/members-edit></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;label>Username
    &lt;input name="fields[username]" type="text" />
  &lt;/label>
  &lt;label>Email
    &lt;input name="fields[email]" type="text" />
  &lt;/label>
  &lt;fieldset>
    &lt;label>Password
      &lt;input name="fields[password][password]" type="password" />
    &lt;/label>
    &lt;label>Password Confirm
      &lt;input name="fields[password][confirm]" type="password" />
    &lt;/label>
  &lt;/fieldset>
  &lt;label>Activation
    &lt;input name="fields[activation]" type="text" />
  &lt;/label>
  &lt;label>Location
    &lt;input name="fields[location]" type="text" />
  &lt;/label>
  &lt;label>Bio
    &lt;textarea name="fields[bio]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;input name="action[members-edit]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://sym-community.local/success/" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['members-edit'])) return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
