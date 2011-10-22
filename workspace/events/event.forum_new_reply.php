<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_new_reply extends Event{

		const ROOTELEMENT = 'forum-new-reply';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: New Reply',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-10-07T09:15:44+00:00',
				'trigger-condition' => 'action[forum-new-reply]'
			);
		}

		public static function getSource(){
			return '5';
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
			<p>This event triggers some other events in chain.</p>
			<p>They are : <strong>forum-discussion-member</strong> and <strong>forum-discussion-update</strong></p>
			';
		}


        public function priority(){
            return self::kNORMAL;
        }

        public $post = array();
        
		public function load(){
            $this->post = $_POST;
			if(isset($_POST['action']['forum-new-reply'])) return $this->__trigger();
		}

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];

            include(TOOLKIT . '/events/event.section.php');

            // check that this event returned successfully
            // then execute chained events event
            if($result->getAttribute('result') == "success") {
                // data for first event
                $_POST['action']['forum-discussion-involved'] = 'Submit';
                $_POST['forum-discussion-involved']['member'] = $this->post[self::ROOTELEMENT]['author'];
                $_POST['forum-discussion-involved']['discussion'] = $this->post[self::ROOTELEMENT]['discussion'];
                $_POST['forum-discussion-involved']['involved'] = 'Yes';
                $_POST['action']['forum-discussion-update'] = 'Submit';
                // data for second event
                $_POST['action']['forum-discussion-update'] = 'Submit';
                $_POST['forum-discussion-update']['id'] = $this->post[self::ROOTELEMENT]['discussion'];
                $_POST['forum-discussion-update']['last-poster'] = $this->post[self::ROOTELEMENT]['author'];
            }

            return $result;
		}
	}