<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_new_discussion extends Event{

		const ROOTELEMENT = 'forum-new-discussion';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: New Discussion',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-10-04T16:15:26+00:00',
				'trigger-condition' => 'action[forum-new-discussion]'
			);
		}

		public static function getSource(){
			return '10';
		}

		public static function allowEditorToParse(){
			return false;
		}

		public static function documentation(){
			return '
			<p>This event is chained with <strong>forum-new-reply</strong></p>
			';
		}

        public function priority(){
            return self::kHIGH;
        }

		public function load(){
            $this->post = $_POST;
            if(isset($_POST['action'][self::ROOTELEMENT])) return $this->__trigger();
		}

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];

            include(TOOLKIT . '/events/event.section.php');
            
            if($result->getAttribute('result') == "success") {
                // chained event post initial message as first reply to thread
                $_POST['action']['forum-new-reply'] = 'Submit';
                $_POST['forum-new-reply']['discussion'] = $result->getAttribute('id');
                $_POST['forum-new-reply']['author'] = $this->post[self::ROOTELEMENT]['author'];
                $_POST['forum-new-reply']['message'] = $this->post[self::ROOTELEMENT]['message'];
            }

			return $result;
		}
	}
