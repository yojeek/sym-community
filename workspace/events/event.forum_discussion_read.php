<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_discussion_read extends Event{

		const ROOTELEMENT = 'forum-discussion-read';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: Discussion - read',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-10-18T10:38:21+00:00',
				'trigger-condition' => 'action[forum-discussion-read]'
			);
		}

		public static function getSource(){
			return '11';
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;forum-discussion-read result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/forum-discussion-read></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;forum-discussion-read result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/forum-discussion-read></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="5242880" />
  &lt;input name="fields[discussion]" type="hidden" value="..." />
  &lt;input name="fields[member]" type="hidden" value="..." />
  &lt;label>Involved
    &lt;input name="fields[involved]" type="checkbox" />
  &lt;/label>
  &lt;label>Red
    &lt;input name="fields[red]" type="checkbox" />
  &lt;/label>
  &lt;input name="action[forum-discussion-read]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://sym-community.local/success/" /></code></pre>';
		}

		public function load(){
			return $this->__trigger();
		}

		protected function __trigger(){
			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
