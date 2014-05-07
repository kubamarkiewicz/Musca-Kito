<?
/* 

	Klasa tree tworzy drzewo ktore zawira strukture stron.
	Drzewo jest tworzone na podstawie wartosci id i parentId kazdego rekordu.
	Uwaga: rekordy powinny byc posortowane przy wyciaganiu z bazy wg fields ord
	
	Dodatkowa funkcja sort zwraca tablice posortowanych rekordow z dodana glebokoscia rekordu w strukturze.
	
	Kuba Markiewicz 2007 

*/

class Tree {

	private $data;
	private $list;

	/* tu wpisz odpowiednie nazwy pol z bazy danych: */
	public $fields = array('id' => 'id',
										'parentId' => 'parentId',
										'url' => 'url'
										);


	/* 
		$list - tablica z rekordami
	*/
	public function __construct($data, $fields='') {
		if (!$data) return;
		$this->data = $data;
		if ($fields) $this->fields = $fields;
		
		foreach ($data as $key => $item) {
			$item['children'] = $this->list[$item[$this->fields['id']]]['children'];
			$this->list[$item[$this->fields['id']]] = $item;
			$this->list[$item[$this->fields['parentId']]]['children'][$item[$this->fields['url']]] = &$this->list[$item[$this->fields['id']]];
		} 	
		// print_r($this->list); exit;
	}


	
	public function dump() {	
		echo '<pre style="font-size: 11px;">';
		print_r($this->get());
		exit;
	}
	
	
	public function get() {
	 return $this->list[0]['children'];
	}


	/* zwraca strone o podanym id */
	public function getPageById($pageId) {
		return $this->list[$pageId];
	}



	/* finds page by url and returns it. does not return false if incorrect url */
	public function getPageByUrl($url) {
		$urlElements = explode('/', $url);
		if (is_array($urlElements)) {
			if ($urlElements[0]==='') array_shift($urlElements);
			//dump($urlElements);
			$page = $this->list[0];
			// print_r($page);
			foreach ($urlElements as $item) {
				if ($page['children'][$item]) {
					$page = $page['children'][$item];
					$page['fullUrl'] = $fullUrl .= '/'.$page[$this->fields['url']]; /* set full url */
				}
				else return false;
			}
			return $page;
		}
	}



	/* zwraca rodzica strony o podanym id */
	public function _parent($pageId) {
		$field = $this->fields['parentId'];
		return $this->list[$this->list[$pageId][$field]];
	} 
	
	
	
	public function childrenIds($pageId) {
		$field = $this->fields['id'];
		if ($children = $this->list[$pageId]['children']) 
			foreach ($children as $child)
				$list[] = $child[$field];
		return $list;
	}
	

	
	/* zwraca tablice z wszystkimi przodkami strony o podanym id */
	public function ancestors($pageId) {
		$field = $this->fields['parentId'];
		while ($pageId = $this->list[$pageId][$field]) 
			$ancestors[] = $this->list[$pageId];
		if ($ancestors) krsort($ancestors);
		return $ancestors;
	}	

	
		
	/* zwraca tablice z id wszystkich przodkow strony o podanym id */
	public function ancestorsIds($pageId) {
		$field = $this->fields['parentId'];
		while ($pageId = $this->list[$pageId][$field]) 
			$ancestors[] = $pageId;
		if ($ancestors) krsort($ancestors);
		return $ancestors;
	}	

	
	
	/* zwraca tablice z wszystkimi potomkami strony o podanym id */
	public function descendants($pageId) {
		return $this->list_($this->list[$pageId]['children']);
	}	
	
	

	/* usuwa galaz z drzewka (tzn strony o podanym id i wszystkich jej potomkow) */
	public function remove($pageId) {
		$field = $this->fields['parentId'];
		$fieldUrl = $this->fields['url'];
		unset($this->list[$this->list[$pageId][$field]]['children'][$this->list[$pageId][$fieldUrl]]);
//		$this->dump();
	}
	
	
			
	/* zwraca tablice z posortowanymi wszystkimi stronami i z dodana wartoscia $rekord['depth'] 
		ktora odpowiada temu jak gleboko dana strona jest w strukturze
	*/
	// to do:
	public function sort() {
		return $this->sort_($this->get(), -1);
	}	
	
	
	

	private function sort_($items, $depth=-1) { 
			++$depth;
			$ret = array();
			if ($items) foreach ($items as $item) {
				$item['depth'] = $depth;
				$ret[] = $item;
				$children = $item['children'];
				if ($item['children']) $ret = array_merge($ret, $this->sort_($item['children'], $depth)); 
			}
			--$depth;
			return $ret;
	}
	
	
	public function fullUrl($pageId) {
		$list = $this->ancestors($pageId);
		$list[] = $this->list[$pageId];
		foreach ($list as $item) $fullUrl .= '/'.$item[$this->fields['url']];
		return $fullUrl;
	}
	
	
	
	public function submenu($pageId) {
		$expandIds = $this->ancestorsIds($pageId);
		$expandIds[] = $pageId;
		$expandIds[] = 0;
		// print_r($expandIds); exit;
		foreach ($this->data as $key => $item) {
			if (!in_array($item[$this->fields['parentId']], $expandIds)) continue;
			$item['children'] = $submenu[$item[$this->fields['id']]]['children'];
			if (in_array($item[$this->fields['id']], $expandIds)) $item['ancestor'] = true;
			$submenu[$item[$this->fields['id']]] = $item;
			$submenu[$item[$this->fields['parentId']]]['children'][$item[$this->fields['url']]] = &$submenu[$item[$this->fields['id']]];
		} 	
		$submenu = $submenu[0]['children'];
		// print_r($submenu); exit;
		return $submenu;
	}
	
}

?>