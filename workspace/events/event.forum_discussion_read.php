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
            <p>This event is triggers if: </p>
            <ol>
                <li>User is logged in. We look into $_SESSION array to know it.</li>
                <li>
                    We are at discussion page. Parsing url data to know this.
                    [symphony-page] => forum-discussion/<strong>159</strong>
                </li>
            </ol>
            <p>No $_POST data required for this event.</p>
            ';
		}

		public function load(){
            $this->post = $_POST;

            if (isset($_GET['symphony-page'])) {
                $page = explode('/', $_GET['symphony-page']);
                settype($page[1], 'int');
            }

            if (isset($_SESSION['sym-members']['id']) & $page[0] == 'forum-discussion' & is_int($page[1])) {
                $this->post[self::ROOTELEMENT]['member'] = $_SESSION['sym-members']['id'];
                $this->post[self::ROOTELEMENT]['discussion'] = $page[1];
                $this->post[self::ROOTELEMENT]['red'] = 'Yes';

                $isExists = $this->isEntryExists($page[1], $_SESSION['sym-members']['id']);

                if ($isExists) {
                    $this->post[self::ROOTELEMENT]['id'] = $isExists;
                }

                return $this->__trigger();
            }
		}

        // custom function, it is not Symphony API
        protected function isEntryExists($discussionId, $memberId){
            $entry_manager = new EntryManager(Symphony::Engine());

            $entries = $entry_manager->fetch(null, $this->getSource());

            foreach ($entries as $entry) {
                $entry_data = $entry->getData();
/*                    echo '<pre>';
                    print_r($entry_data);
                    echo '</pre>';*/
                if ($entry_data[38]['relation_id'] == $discussionId & $entry_data[39]['relation_id'] == $memberId) {
                    return $entry->get('id');
                }
            }

            return false;
        }

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];

            include(TOOLKIT . '/events/event.section.php');
            return $result;
		}
	}