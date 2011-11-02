<?php	require_once(TOOLKIT . '/class.datasource.php');	Class datasourcemember_just_created extends Datasource{		public $dsParamROOTELEMENT = 'member-just-created';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$member-id';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';		public $dsParamFILTERS = array(
				'id' => '{$etm-entry-id}',
		);		public $dsParamINCLUDEDELEMENTS = array(
				'username',
				'email',
				'activation'
		);		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}		public function about(){
			return array(
				'name' => 'Member: Just Created',
				'author' => array(
					'name' => 'Miki Noidea',
					'website' => 'http://sym-community.local',
					'email' => 'antiplaka@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-11-01T19:17:21+00:00'
			);
		}		public function getSource(){
			return '2';
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
