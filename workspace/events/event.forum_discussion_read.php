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

                $id = $this->isEntryExists($page[1], $_SESSION['sym-members']['id']);

                if ($id) {
                    $this->post[self::ROOTELEMENT]['id'] = $id;
                }

                return $this->__trigger();
            }
		}

        // custom function, it is not Symphony API
        protected function isEntryExists($discussionId, $memberId){
            $sql = "
                SELECT
                    sym_entries_data_38.entry_id
                FROM
                    sym_entries_data_38, sym_entries_data_39
                WHERE
                    sym_entries_data_38.relation_id = '{$discussionId}'
                AND
                    sym_entries_data_39.relation_id = '{$memberId}'
                AND
                    sym_entries_data_38.entry_id = sym_entries_data_39.entry_id
            ";

            $rows = Symphony::Database()->fetch($sql);

            if (!empty($rows)) {
                return $rows[0]['entry_id'];
            } else {
                return false;
            }
        }

		protected function __trigger(){
            unset($_POST['fields']);
            $_POST['fields'] = $this->post[self::ROOTELEMENT];
            $_POST['id'] = $this->post[self::ROOTELEMENT]['id'];

            include(TOOLKIT . '/events/event.section.php');
            return $result;
		}
	}