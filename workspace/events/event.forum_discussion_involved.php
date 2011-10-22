<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_discussion_involved extends Event{

		const ROOTELEMENT = 'forum-discussion-involved';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: Discussion - Involved',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-10-18T10:38:21+00:00',
				'trigger-condition' => 'action[forum-discussion-involved]'
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
        <h3>This event is totally custom.</h3>
        ';
		}

        public function priority(){
            return self::kLOW;
        }

		public function load(){
            $this->post = $_POST;
            if(isset($_POST['action'][self::ROOTELEMENT])) return $this->__trigger();
		}

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];
            
            $_POST['fields']['red'] = 'Yes';
            $_POST['field']['involved'] = 'Yes';

            include(TOOLKIT . '/events/event.section.php');
            return $result;
		}

	}
