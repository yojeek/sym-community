<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventforum_discussion_update extends Event{

		const ROOTELEMENT = 'forum-discussion-update';

		public $eParamFILTERS = array(
			
		);

		public static function about(){
			return array(
				'name' => 'Forum: Discussion Update',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-10-22T18:34:39+00:00',
				'trigger-condition' => 'action[forum-discussion-update]'
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
			<p>Update activity data :</p>
			<ul>
			    <li>activity-date</li>
			    <li>last-poster</li>
			    <li>number of replies</li>
			</ul>
            ';
		}

        public function priority(){
            return self::kLOW;
        }
		public function load(){
            $this->post = $_POST;
            if(isset($_POST['action'][self::ROOTELEMENT])) {
                return $this->__trigger();
            }
		}

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];

            $date = new DateTime('now');
            $_POST['fields']['last-active'] = $date->format('d F Y H:i');
            
            if (!isset($_POST['fields']['number-of-replies']))
                $_POST['fields']['number-of-replies'] = 0;

			include(TOOLKIT . '/events/event.section.php');
			return $result;
		}

	}
