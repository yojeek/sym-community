<?php	require_once(TOOLKIT . '/class.datasource.php');	Class datasourceforum_discussion_member extends Datasource{		public $dsParamROOTELEMENT = 'forum-discussion-member';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$member-id';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';		public $dsParamFILTERS = array(
				'38' => '{$discussion-id}',
				'39' => '{$member-id}',
		);		public $dsParamINCLUDEDELEMENTS = array(
				'discussion',
				'red',
				'involved',
				'number-of-replies'
		);		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}		public function about(){
			return array(
				'name' => 'Forum: Discussion - Member',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-11-01T16:33:57+00:00'
			);
		}		public function getSource(){
			return '11';
		}		public function allowEditorToParse(){
			return true;
		}		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}			if($this->_force_empty_result) $result = $this->emptyXMLSet();						return $result;
		}	}
