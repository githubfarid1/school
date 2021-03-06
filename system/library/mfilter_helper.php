<?php

/**
 * Mega Filter
 * 
 * @license Commercial
 * @author info@ocdemo.eu
 */

class Mfilter_Helper {
	
	private $_ctrl;
	
	private $_cache = array();
	
	private $_hasMFilterPlus = null;
	
	private static $instance;
	
	/**
	 * @return Mfilter Helper
	 */
	public static function create( & $ctrl ) {
		if( ! self::$instance ) {
			self::$instance = new self( $ctrl );
		}
		
		return self::$instance;
	}
	
	/**
	 * @param array $option
	 * @param string $template
	 * @param array $replace
	 * @return string
	 */
	public static function renderValue( $option, $template = ':name', array $replace = array() ) {
		if( $template == ':name' ) {
			$template = $option['name'];
		} else {
			foreach( $option as $name => $value ) {
				$template = str_replace( ':' . $name, $value, $template );
			}
		}
		
		if( $replace ) {
			foreach( $replace as $name => $value ) {
				$template = str_replace( ':' . $name, $value, $template );
			}
		}
		
		if( ! empty( $option['url'] ) ) {			
			return '<a' . self::arrayToHtmlAttribs(array(
				'href' => $option['url'],
				'class' => 'mfp-value-link',
				'data-value' => $option['value'],
			), false) . '>' . $template . '</a>';
		}
		
		return $template;
	}
	
	/**
	 * @param array $attribs
	 * @param bool $skip_empty
	 * @return string
	 */
	public static function arrayToHtmlAttribs( array $attribs, $skip_empty = true ) {
		/* @var $list array */
		$list = array();
		
		foreach( $attribs as $k => $v ) {
			if( ! $skip_empty || $v !== '' ) {
				$list[] = $k . '="' . str_replace( '"', '&qout;', $v ) . '"';
			}
		}
		
		return $list ? ' ' . implode( ' ', $list ) : '';
	}
	
	/**
	 * @return MfilterHelper
	 */
	public static function i() {
		return self::$instance;
	}
	
	private function __construct( & $ctrl ) {
		$this->_ctrl = $ctrl;
	}
	
	public function hasMFilterPlus() {
		if( $this->_hasMFilterPlus === null ) {
			$this->_hasMFilterPlus = file_exists( DIR_SYSTEM . 'library/mfilter_plus.php' );
		}
		
		return $this->_hasMFilterPlus;
	}
	
	protected static function addSeoAlias( $url, $alias ) {
		/* @var $parsed array */
		$parsed = parse_url( $url );
		
		/* @var $out string */
		$out = '';
		
		if( ! empty( $parsed['host'] ) ) {
			$out .= empty( $parsed['scheme'] ) ? '//' : $parsed['scheme'] . '://';
			$out .= $parsed['host'];
		}
		
		$out .= empty( $parsed['path'] ) ? '/' : rtrim( $parsed['path'], '/' ) . '/';
		$out .= $alias;
		
		if( isset( $parsed['query'] ) ) {
			$out .= '?' . $parsed['query'];
		}
		
		return $out;
	}
	
	public static function removeLinksByRel( & $ctrl, $rel ) {
		$ctrl->document->mfp_removeLink( $rel );
	}
	
	public static function createMetaLinks( & $ctrl, $page, $limit, $product_total ) {
		if( empty( $ctrl->request->request['mfp_seo_alias'] ) ) return;
		
		/* @var $alias string */
		$alias = $ctrl->request->request['mfp_seo_alias'];
		
		/* @var $config array */
		$config = (array) $ctrl->config->get( 'mega_filter_seo' );

		if( ! empty( $config['add_slash_at_the_end'] ) ) {
			$alias .= '/';
		}
		
		/* @var $path string */
		$path = $ctrl->request->get['path'];
		
		self::removeLinksByRel( $ctrl, 'canonical' );
		
		$ctrl->document->addLink( self::addSeoAlias( $ctrl->url->link('product/category', 'path=' . $path, true), $alias ), 'canonical');
		
		if( isset( $page ) ) {
			self::removeLinksByRel( $ctrl, 'prev' );
						
			if ($page == 2) {
				$ctrl->document->addLink( self::addSeoAlias( $ctrl->url->link('product/category', 'path=' . $path, true), $alias ), 'prev');
			} else if( $page > 2 ) {
				$ctrl->document->addLink( self::addSeoAlias( $ctrl->url->link('product/category', 'path=' . $path . '&page='. ($page - 1), true), $alias ), 'prev');
			}

			if( ! empty( $limit ) && isset( $product_total ) && ceil($product_total / $limit) > $page ) {
				self::removeLinksByRel( $ctrl, 'next' );
			
				$ctrl->document->addLink( self::addSeoAlias( $ctrl->url->link('product/category', 'path=' . $path . '&page='. ($page + 1), true), $alias ), 'next');
			}
		}
	}
	
	private static function nonLatinChars() {
		return array(
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'???', '???', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'???', '???', '??', '??', '???', '???', '??', '??', '??', '??', '??', '??', '??', '??',
			'??',  '??', '??', '??', '??', '??', 
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'???', '???', '??', '??', '??', '??', '??',
			'???', '???', 
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', 
			'??', '??',
			'???', '???', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', 
			'???', '???', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', 
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', 
			'???', '???', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '???', '???', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '???', '???', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??',
			'???', '???', '???', '???', '??', '??', '???', '???',
			'??', '??',
			'???', '???', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??', '??', '??',
			'??', '??', '??', '??',
		);
	}
	
	private static function latinChars() {
		return array(
			'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a',
			'B', 'b', 'B', 'b',
			'C', 'c', 'C', 'c', 'C', 'c', 'C', 'c', 'C', 'c', 'CH', 'ch', 'CH', 'ch',
			'D', 'd', 'D', 'd', 'D', 'd', 'D', 'd', 'D', 'd', 'D', 'd', 'D', 'd',
			'DZ', 'Dz', 'dz', 'DZ', 'Dz', 'dz',
			'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'e',
			'F', 'f', 'f', 'F', 'f', 'F', 'f',
			'fi', 'fl',
			'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g', 'G', 'g',
			'H', 'h', 'H', 'h', 'ZH', 'zh', 'H', 'h',
			'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i', 'I', 'i',
			'IJ', 'ij',
			'J', 'j',
			'K', 'k', 'K', 'k', 'K', 'k', 'K', 'k', 'K', 'k',
			'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l', 'L', 'l',
			'LJ', 'Lj', 'lj',
			'M', 'm', 'M', 'm', 'M', 'm',
			'N', 'n', 'N', 'n', 'N', 'n', 'N', 'n', 'n', 'N', 'n', 'N', 'n', 'N', 'n',
			'NJ', 'Nj', 'nj',
			'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
			'OE', 'oe',
			'P', 'p', 'P', 'p', 'P', 'p', 'PS', 'ps',
			'R', 'r', 'R', 'r', 'R', 'r', 'R', 'r', 'R', 'r',
			'S', 's', 'S', 's', 'S', 's', 'S', 's', 'S', 's', 's', 'ss', 'S', 's', 'SH', 'sh', 'SHCH', 'shch', 'S', 's', 's',
			'T', 't', 'T', 't', 'T', 't', 'T', 't', 'T', 't', 'T', 't', 'TS', 'ts', 'TH', 'th', 'T', 't',
			'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
			'V', 'v', 'V', 'v',
			'W', 'w', 'W', 'w', 'W', 'w', 'W', 'w',
			'X', 'x',
			'Y', 'y', 'Y', 'y', 'Y', 'y', 'Y', 'y', 'Y', 'y', 'Y', 'y', 'YU', 'yu', 'YA', 'ya', 'Y', 'y',
			'Z', 'z', 'Z', 'z', 'Z', 'z', 'Z', 'z', 'Z', 'z',
			'AE', 'ae', 'AE', 'ae', 'a', 'A',
			'', '', '', '',
		);
	}
	
	public function convertNonLatinToLatin( $str ) {		
		return str_replace( self::nonLatinChars(), self::latinChars(), $str );
	}
	
	public function removeSpecialCharacters( $str ) {
		return str_replace(array(
			' ', '`', '~', '!', '@', '#', '$', '%', '^', '*', '(', ')', '+', '=', '[', '{', ']', '}', '\\', '|', ';', ':', "'", '"', ',', '<', '.', '>', '/', '?'
		), '-', str_replace(array(
			'&'
		), array(
			'and'
		), htmlspecialchars_decode( $str )) );
	}
	
	public function isSeoEnabled() {
		/* @var $settings array */
		$settings = $this->_ctrl->config->get('mega_filter_seo');
		
		return ! empty( $settings['enabled'] );
	}
	
	public function convertValueToSeo( $value, $only_if_enabled = true ) {
		if( ! $this->hasMFilterPlus() ) {
			return $value;
		}
		
		/* @var $settings array */
		$settings = $this->_ctrl->config->get('mega_filter_seo');
		
		if( $only_if_enabled && empty( $settings['enabled'] ) ) {
			return $value;
		}
		
		if( ! empty( $settings['convert_non_to_latin'] ) ) {
			$value = $this->convertNonLatinToLatin( $value );
		}
		
		$value = $this->removeSpecialCharacters( $value );
		
		if( ! empty( $settings['convert_to_lowercase'] ) ) {
			$value = mb_strtolower( $value, 'utf-8' );
		}
		
		return $value;
	}
}
