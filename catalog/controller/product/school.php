<?php
class ControllerProductSchool extends Controller
{
	private $error = array();
	private $poscard_size = [1300, 700];
	private $thumbposcard_size = [256, 192];
	private $photo_size = [240, 278];


	public function index()
	{

		$this->load->language('product/school');
		$device = new Mobile();
		if ($device->isMobile()) {
			$data['mobile'] = true;
		} else {
			$data['mobile'] = false;
		}
		$this->load->language('catalog/school');


		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$this->load->model('catalog/category');

		if (isset($this->request->get['path'])) {
			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = $path_id;
				} else {
					$path .= '_' . $path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path)
					);
				}
			}

			// Set the last category breadcrumb
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}

				$data['breadcrumbs'][] = array(
					'text' => $category_info['name'],
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url)
				);
			}
		}

		$this->load->model('catalog/manufacturer');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_brand'),
				'href' => $this->url->link('product/manufacturer')
			);

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($this->request->get['manufacturer_id']);

			if ($manufacturer_info) {
				$data['breadcrumbs'][] = array(
					'text' => $manufacturer_info['name'],
					'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url)
				);
			}
		}

		if (isset($this->request->get['search']) || isset($this->request->get['tag'])) {
			$url = '';

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_search'),
				'href' => $this->url->link('product/search', $url)
			);
		}

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/school');

		$product_info = $this->model_catalog_school->getProduct($product_id);

		if ($product_info) {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $product_info['school_name'],
				'href' => $this->url->link('product/school', $url . '&product_id=' . $this->request->get['product_id']),
				'active' => true
			);
			$breadcrumb['breadcrumbs'] = $data['breadcrumbs'];
			$data['breadcrumbs'] = $this->load->view('common/breadcrumb', $breadcrumb);
			//echo '<pre>' . print_r($data['tes'],true) . '</pre>';
			$this->document->setTitle($product_info['meta_title']);
			$this->document->setDescription($product_info['meta_description']);
			$this->document->setKeywords($product_info['meta_keyword']);
			$this->document->addLink($this->url->link('product/school', 'product_id=' . $this->request->get['product_id']), 'canonical');
			$this->document->addScript('catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/magnific/magnific-popup.css');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

			$data['heading_title'] = $product_info['school_name'];

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_write'] = $this->language->get('text_write');
			$data['text_login'] = sprintf($this->language->get('text_login'), $this->url->link('account/login', '', true), $this->url->link('account/register', '', true));
			$data['text_note'] = $this->language->get('text_note');
			$data['text_tags'] = $this->language->get('text_tags');
			$data['text_related'] = $this->language->get('text_related');
			$data['text_payment_recurring'] = $this->language->get('text_payment_recurring');
			$data['text_loading'] = $this->language->get('text_loading');

			$data['entry_qty'] = $this->language->get('entry_qty');
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_review'] = $this->language->get('entry_review');
			$data['entry_rating'] = $this->language->get('entry_rating');
			$data['entry_good'] = $this->language->get('entry_good');
			$data['entry_bad'] = $this->language->get('entry_bad');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_upload'] = $this->language->get('button_upload');
			$data['button_continue'] = $this->language->get('button_continue');

			$this->load->model('catalog/review');

			$data['tab_description'] = $this->language->get('tab_description');
			$data['tab_attribute'] = $this->language->get('tab_attribute');

			$data['product_id'] = (int)$this->request->get['product_id'];

			$data['school_profile'] = html_entity_decode($product_info['school_profile'], ENT_QUOTES, 'UTF-8');


			$identity['school_name'] = $product_info['school_name'];
			$identity['address'] = $product_info['address'];
			$identity['akreditasi'] = $product_info['akreditasi'];
			$identity['likes'] = '210';
			$identity['review'] = '4.0';
			$this->load->model('tool/image');
			if ($product_info['photo_main']) {
				$identity['logo'] = $this->model_tool_image->resize($product_info['photo_main'], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
			} else {
				$identity['logo'] = '';
			}
			/*if ($this->check_brosur(PHOTO_BROSUR_FRONT_ID, $this->request->get['product_id']) <> 0) {
				$filename = strtolower(trim($identity['school_name']) . '-1');
				$filename = preg_replace('/[^A-Za-z0-9-]+/', '-', $filename);
				$identity['download1'] = $this->url->link('product/school/download', 'product_id=' . (int)$this->request->get['product_id'] . '&filename=' . $filename . '&brosur_id=' . PHOTO_BROSUR_FRONT_ID);
			}
			if ($this->check_brosur(PHOTO_BROSUR_BACK_ID, $this->request->get['product_id']) <> 0) {
				$filename = strtolower(trim($identity['school_name']) . '-2');
				$filename = preg_replace('/[^A-Za-z0-9-]+/', '-', $filename);
				$identity['download2'] = $this->url->link('product/school/download', 'product_id=' . (int)$this->request->get['product_id'] . '&filename=' . $filename . '&brosur_id=' . PHOTO_BROSUR_BACK_ID);
			}
			$identity['daftar'] = $this->url->link('product/school/daftar', 'product_id=' . (int)$this->request->get['product_id']);
			$identity['qrcode'] = $this->model_tool_image->resize('catalog/qrcode.png', $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
			$data['identity_view'] = $this->load->view('common/school_identity_view', $identity);
			*/


			//Image gallery
			/*$gallery['images'] = array();
			$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)PHOTO_GALLERY_ID . "' LIMIT 1");
			$index = $edu->row['length'];
			$ar = explode("-", $index);
			$start = (int)$ar[0];
			$end = (int)$ar[1];
			$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);

			foreach ($results as $result) {
				$gallery['images'][] = array(
					//'popup' => $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_popup_width'), $this->config->get($this->config->get('config_theme') . '_image_popup_height')),
					'popup' => $this->model_tool_image->resize($result['image'], 1300, 700),
					'thumb' => $this->model_tool_image->resize($result['image'], 256, 192),
					'image_name' => $result['image_name'],
					'image_description' => html_entity_decode($result['image_description'], ENT_QUOTES, 'UTF-8'),
				);
			}
			$gallery['isMobile'] = $data['mobile'];
			$data['gallery_view'] = $this->load->view('common/carousel1_view', $gallery);


			$promo['images'] = array();

			$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)PHOTO_PROMO_ID . "' LIMIT 1");
			$index = $edu->row['length'];
			$ar = explode("-", $index);
			$start = (int)$ar[0];
			$end = (int)$ar[1];
			$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);

			foreach ($results as $result) {
				$promo['images'][] = array(
					'thumb' => $this->model_tool_image->resize($result['image'], 240, 278),
					'image_name' => $result['image_name'],
					'image_description' => html_entity_decode($result['image_description'], ENT_QUOTES, 'UTF-8'),
				);
			}
			$promo['div_id'] = 'promoCarousel';
			$promo['text_header'] = 'Foto Promo';
			$promo['isMobile'] = $data['mobile'];
			$data['promo_view'] = $this->load->view('common/carousel2_view', $promo);

			$teacher['images'] = array();
			$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)PHOTO_PENGAJAR_ID . "' LIMIT 1");
			$index = $edu->row['length'];
			$ar = explode("-", $index);
			$start = (int)$ar[0];
			$end = (int)$ar[1];
			$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);

			foreach ($results as $result) {
				$teacher['images'][] = array(
					'thumb' => $this->model_tool_image->resize($result['image'], 240, 278),
					'image_name' => $result['image_name'],
					'image_description' => html_entity_decode($result['image_description'], ENT_QUOTES, 'UTF-8'),
				);
			}
			$teacher['div_id'] = 'teacherCarousel';
			$teacher['text_header'] = 'Pengajar';
			$teacher['isMobile'] = $data['mobile'];
			$data['teacher_view'] = $this->load->view('common/carousel2_view', $teacher);

			$itemFilters[FILTER_FASILITAS_SEKOLAH_ID] =
				array(
					'icon' => 'fas fa-landmark',
					'items' => []
				);
			$itemFilters[FILTER_PROGRAM_KEAHLIAN_ID] =
				array(
					'icon' => 'fas fa-graduation-cap',
					'items' => [],
					'iconstyle' => 'font-size: 20px;',
				);

			foreach ($itemFilters as $key => $itemFilter) {
				$filters = $this->model_catalog_school->getProductFilters($this->request->get['product_id']);
				$strIds = implode(", ", $filters);
				$fg = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_group_description WHERE filter_group_id ='" . (int)$key . "' AND language_id ='" . (int)$this->config->get('config_language_id') . "' LIMIT 1");
				if ($fg->num_rows <> 0) {
					$lg = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_description WHERE filter_group_id ='" . (int)$key . "' AND language_id ='" . (int)$this->config->get('config_language_id') . "' AND filter_id IN (" . $strIds . ")");
					$itemFilters[$key]['text_header'] = $fg->row['name'];
					$itemFilters[$key]['items'] = [];
					foreach ($lg->rows as $r) {
						$itemFilters[$key]['items'][] = $r['name'];
					}
				}
			}
			$data['fasilitas_view'] = $this->load->view('common/filter_view', $itemFilters[FILTER_FASILITAS_SEKOLAH_ID]);
			$data['program_keahlian_view'] = $this->load->view('common/filter_view', $itemFilters[FILTER_PROGRAM_KEAHLIAN_ID]);

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['monthly_cost'] = $this->currency->format($product_info['monthly_cost'], $this->session->data['currency']);
			} else {
				$data['monthly_cost'] = false;
			}
			$data['qrcode'] = $this->model_tool_image->resize('catalog/qrcode.png', $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}



			$itemAttributes[ATTRIBUTE_EKSTRAKURIKULER_ID] =
				array(
					'icon' => 'fas fa-history',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_JAM_ID] =
				array(
					'icon' => 'fas fa-history',
					'iconstyle' => 'font-size: 24px;',
					'items' => [],
					'header_itemlabel' => 'Jam',
					'header_itemtext' => 'Hari'
				);
			$itemAttributes[ATTRIBUTE_INFO_ID] =
				array(
					'icon' => 'fas fa-history',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_PROGRAM_KEAHLIAN_ID] =
				array(
					'icon' => 'fas fa-book-open',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);

			$itemAttributes[ATTRIBUTE_VIDEO_ID] =
				array(
					'icon' => 'fas fa-university',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_FASILITAS_ID] =
				array(
					'icon' => 'fas fa-university',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_FASILITAS_ID] =
				array(
					'icon' => 'fas fa-university',
					'iconstyle' => 'font-size: 24px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_CONTACT_ID] =
				array(
					'iconstyle' => 'font-size: 27px;',
					'items' => []
				);
			$itemAttributes[ATTRIBUTE_SOCMED_ID] =
				array(
					'iconstyle' => 'font-size: 27px;',
					'items' => []
				);

			$attributes = $this->model_catalog_school->getProductAttributes($this->request->get['product_id']);
			foreach ($attributes as $atg) {
				foreach ($itemAttributes as $key => $iatt) {
					if ($atg['attribute_group_id'] == $key) {
						$itemAttributes[$key]['text_header'] = $atg['name'];
						$itemAttributes[$key]['showlabel'] = $atg['showlabel'];
						$itemAttributes[$key]['items'] = [];
						if (!empty($atg['attribute'])) {
							foreach ($atg['attribute'] as $att) {
								$itemAttributes[$key]['items'][] = array('label' => $att['name'], 'text' => $att['text']);
							}
						}
					}
				}
			}
			$data['ekstrakur_view'] = $this->load->view('common/attribute_view', $itemAttributes[ATTRIBUTE_EKSTRAKURIKULER_ID]);
			$data['jambelajar_view'] = $this->load->view('common/attribute_table_view', $itemAttributes[ATTRIBUTE_JAM_ID]);
			$data['info_view'] = $this->load->view('common/marquee_view', $itemAttributes[ATTRIBUTE_INFO_ID]);
			// $data['fasilitas_view'] = $this->load->view('common/attribute_view', $itemAttributes[3]);
			$data['prog_view'] = $this->load->view('common/attribute_view', $itemAttributes[ATTRIBUTE_PROGRAM_KEAHLIAN_ID]);
			$data['fasilitas_att_view'] = $this->load->view('common/attribute_view', $itemAttributes[ATTRIBUTE_FASILITAS_ID]);
			$data['contact_view'] = $this->load->view('common/attribute_formatted_view', $itemAttributes[ATTRIBUTE_CONTACT_ID]);
			$data['socmed_view'] = $this->load->view('common/attribute_formatted_view', $itemAttributes[ATTRIBUTE_SOCMED_ID]);

			$itemAttributes[ATTRIBUTE_VIDEO_ID]['div_id'] = 'videoCarousel';
			$itemAttributes[ATTRIBUTE_VIDEO_ID]['isMobile'] = $data['mobile'];
			$data['video_view'] = $this->load->view('common/video_view', $itemAttributes[ATTRIBUTE_VIDEO_ID]);

			*/

			$categories = $this->model_catalog_school->getCategories($product_id);
			//print_r($categories);


			$category_id = $categories[0]['category_id'];
			$builder = array();

			$educat = $this->db->query("SELECT * FROM `" . DB_PREFIX . "education_category` WHERE category_id ='" . (int)$category_id . "' LIMIT 1");
			$attributeJson = json_decode($educat->row['attribute_json']);
			$columnJson = json_decode($educat->row['column_json']);
			$filterJson = json_decode($educat->row['filter_json']);
			// print_r(json_decode($educat->row['column_ids']));
			$divId = 0;
			// echo '<pre>' . print_r($columnJson,true) . '</pre>';
			// die;
			foreach ($columnJson as $value) {
				$divId++;
				$vardata = [];
				$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)$value->id . "' LIMIT 1")->row;
				if ($edu['coltype'] == 'images') {
					$vardata['images'] = array();
					$index = $edu['length'];
					$ar = explode("-", $index);
					$start = (int)$ar[0];
					$end = (int)$ar[1];
					$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);

					foreach ($results as $result) {
						$vardata['images'][] = array(
							'postcard' => $this->model_tool_image->resize($result['image'], $this->poscard_size[0], $this->poscard_size[1]),
							'thumbpostcard' => $this->model_tool_image->resize($result['image'], $this->thumbposcard_size[0], $this->thumbposcard_size[1]),
							'photo' => $this->model_tool_image->resize($result['image'], $this->photo_size[0], $this->photo_size[1]),
							'image_name' => $result['image_name'],
							'image_description' => html_entity_decode($result['image_description'], ENT_QUOTES, 'UTF-8'),
						);
					}
				} elseif ($edu['coltype'] == 'group') {
					$colnames = json_decode($edu['colname']);
					$arraystr = implode(',', $colnames);
					$educol = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id IN (" . $arraystr . ")")->rows;
					foreach ($educol as $col) {
						if ($col['coltype'] == 'text') {
							$vardata[$col['colname']] = $product_info[$col['colname']];
						} elseif ($col['coltype'] == 'image') {
							$vardata[$col['colname']] = $this->model_tool_image->resize($product_info[$col['colname']], $this->config->get($this->config->get('config_theme') . '_image_additional_width'), $this->config->get($this->config->get('config_theme') . '_image_additional_height'));
							//print_r($vardata[$col['colname']]);
						} elseif ($col['coltype'] == 'textarea') {
							$vardata[$col['colname']] = html_entity_decode($product_info[$col['colname']], ENT_QUOTES, 'UTF-8');

						} elseif ($col['coltype'] == 'number') {
							$vardata[$col['colname']] = (int)$product_info[$col['colname']];
						} elseif ($col['coltype'] == 'currency') {
							$vardata[$col['colname']] = $this->currency->format($product_info[$col['colname']], $this->session->data['currency']);
						} elseif ($col['coltype'] == 'date') {
							$vardata[$col['colname']] = date($this->language->get('date_format_short'), strtotime($product_info[$col['colname']]));
						} elseif ($col['coltype'] == 'brosur') {
							//print_r($product_info[$col['colname']]);
							if (!empty($product_info[$col['colname']])) {
								$filename = strtolower(trim($product_info['school_name']) . '-1');
								$filename = preg_replace('/[^A-Za-z0-9-]+/', '-', $filename);
								$vardata[$col['colname']] = $this->url->link('product/school/download', 'product_id=' . (int)$this->request->get['product_id'] . '&filename=' . $filename . '&colname=' . $col['colname']);
							}
						} elseif ($col['coltype'] == 'tinyint') {
							if ($col['colname'] == 'isregister') {
								if ($product_info[$col['colname']] == 1) {
									$vardata['daftar'] = $this->url->link('product/school/daftar', 'product_id=' . (int)$this->request->get['product_id']);
								}
							} else {
								$vardata[$col['colname']] = (int)$product_info[$col['colname']];
							}
						}
					}


					// echo '<pre>' . print_r($vardata,true) . '</pre>';
					// die;
				}
				$vardata['div_id'] = 'divId' . $divId;
				$vardata['isMobile'] = $data['mobile'];
				$vardata['text_header'] = $edu['name'];
				$vardata['screen_size'] = $value->screen_size;

				$view_theme = $value->column_theme == 'default' ? ('product/default_view/' . 'attribute_view') : 'product/column_view/' . $value->column_theme;
				$builder[] = array('sort_order' => $value->sort_order, 'view' => $this->load->view($view_theme, $vardata));
			}
			// echo '<pre>' . print_r($columnJson, true) . '</pre>';
			// die;
			// echo '<pre>' . print_r($attributeJson, true) . '</pre>';
			// $columns = array_column($attributeJson, 'sort_order');
			// array_multisort($columns, SORT_ASC, $attributeJson);
			//$data['views'] = array();
			foreach ($attributeJson as $value) {
				$divId++;
				$vardata = [];
				$vardata = $this->model_catalog_school->getProductAttribute2($this->request->get['product_id'], $value->id);
				// echo '<pre>' . print_r($value,true) . '</pre>';
				// die;
				//echo '<pre>' . print_r($attributes, true) . '</pre>';
				// foreach ($attributes as $atg) {
				// 	foreach ($itemAttributes as $key => $iatt) {
				// 		if ($atg['attribute_group_id'] == $key) {
				// 			$itemAttributes[$key]['text_header'] = $atg['name'];
				// 			$itemAttributes[$key]['showlabel'] = $atg['showlabel'];
				// 			$itemAttributes[$key]['items'] = [];
				// 			if (!empty($atg['attribute'])) {
				// 				foreach ($atg['attribute'] as $att) {
				// 					$itemAttributes[$key]['items'][] = array('label' => $att['name'], 'text' => $att['text']);
				// 				}
				// 			}
				// 		}
				// 	}
				// }
				//$attributes['sort_order'] = $value->sort_order;
				$vardata['div_id'] = 'divId' . $divId;
				$vardata['icon'] = html_entity_decode($value->icon);
				$vardata['isMobile'] = $data['mobile'];
				$vardata['screen_size'] = $value->screen_size;
				$view_theme = $value->attribute_theme == 'default' ? ('product/default_view/' . 'attribute_view') : 'product/attribute_view/' . $value->attribute_theme;
				$builder[] = array('sort_order' => $value->sort_order, 'view' => $this->load->view($view_theme, $vardata));
			}


			foreach ($filterJson as $value) {
				$divId++;
				$vardata = [];
				$vardata = $this->model_catalog_school->getProductFilter($this->request->get['product_id'], $value->id);
				$vardata['div_id'] = 'divId' . $divId;
				$vardata['icon'] = html_entity_decode($value->icon);
				$vardata['isMobile'] = $data['mobile'];
				$vardata['screen_size'] = $value->screen_size;
				$view_theme = $value->filter_theme == 'default' ? ('product/default_view/' . 'filter_view') : 'product/filter_view/' . $value->filter_theme;
				$builder[] = array('sort_order' => $value->sort_order, 'view' => $this->load->view($view_theme, $vardata));
			}


			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['monthly_cost'] = $this->currency->format($product_info['monthly_cost'], $this->session->data['currency']);
			} else {
				$data['monthly_cost'] = false;
			}

			if ($this->customer->isLogged()) {
				$data['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$data['customer_name'] = '';
			}


			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'));
			} else {
				$data['captcha'] = '';
			}

			$data['share'] = $this->url->link('product/school', 'product_id=' . (int)$this->request->get['product_id']);

			$data['attribute_groups'] = $this->model_catalog_school->getProductAttributes($this->request->get['product_id']);

			$data['products'] = array();

			$results = $this->model_catalog_school->getProductRelated($this->request->get['product_id']);

			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_related_width'), $this->config->get($this->config->get('config_theme') . '_image_related_height'));
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $rating,
					'href'        => $this->url->link('product/school', 'product_id=' . $result['product_id'])
				);
			}


			$data['recurrings'] = $this->model_catalog_school->getProfiles($this->request->get['product_id']);

			$this->model_catalog_school->updateViewed($this->request->get['product_id']);

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			// echo '<pre>' . print_r($builder,true) . '</pre>';
			$column = array_column($builder, 'sort_order');
			array_multisort($column, SORT_ASC, $builder);
			$data['views'] = $builder;
			// echo '<pre>' . print_r($data['view'],true) . '</pre>';
			$this->response->setOutput($this->load->view('product/school', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['manufacturer_id'])) {
				$url .= '&manufacturer_id=' . $this->request->get['manufacturer_id'];
			}

			if (isset($this->request->get['search'])) {
				$url .= '&search=' . $this->request->get['search'];
			}

			if (isset($this->request->get['tag'])) {
				$url .= '&tag=' . $this->request->get['tag'];
			}

			if (isset($this->request->get['description'])) {
				$url .= '&description=' . $this->request->get['description'];
			}

			if (isset($this->request->get['category_id'])) {
				$url .= '&category_id=' . $this->request->get['category_id'];
			}

			if (isset($this->request->get['sub_category'])) {
				$url .= '&sub_category=' . $this->request->get['sub_category'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/school', $url . '&product_id=' . $product_id)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}

	public function review()
	{
		$this->load->language('product/school');

		$this->load->model('catalog/review');

		$data['text_no_reviews'] = $this->language->get('text_no_reviews');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['reviews'] = array();

		$review_total = $this->model_catalog_review->getTotalReviewsByProductId($this->request->get['product_id']);

		$results = $this->model_catalog_review->getReviewsByProductId($this->request->get['product_id'], ($page - 1) * 5, 5);

		foreach ($results as $result) {
			$data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => nl2br($result['text']),
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $review_total;
		$pagination->page = $page;
		$pagination->limit = 5;
		$pagination->url = $this->url->link('product/product/review', 'product_id=' . $this->request->get['product_id'] . '&page={page}');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * 5) + 1 : 0, ((($page - 1) * 5) > ($review_total - 5)) ? $review_total : ((($page - 1) * 5) + 5), $review_total, ceil($review_total / 5));

		$this->response->setOutput($this->load->view('product/review', $data));
	}

	public function write()
	{
		$this->load->language('product/school');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating']) || $this->request->post['rating'] < 0 || $this->request->post['rating'] > 5) {
				$json['error'] = $this->language->get('error_rating');
			}

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

				if ($captcha) {
					$json['error'] = $captcha;
				}
			}

			if (!isset($json['error'])) {
				$this->load->model('catalog/review');

				$this->model_catalog_review->addReview($this->request->get['product_id'], $this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function getRecurringDescription()
	{
		$this->load->language('product/school');
		$this->load->model('catalog/school');

		if (isset($this->request->post['product_id'])) {
			$product_id = $this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['recurring_id'])) {
			$recurring_id = $this->request->post['recurring_id'];
		} else {
			$recurring_id = 0;
		}

		if (isset($this->request->post['quantity'])) {
			$quantity = $this->request->post['quantity'];
		} else {
			$quantity = 1;
		}

		$product_info = $this->model_catalog_school->getProduct($product_id);
		$recurring_info = $this->model_catalog_school->getProfile($product_id, $recurring_id);

		$json = array();

		if ($product_info && $recurring_info) {
			if (!$json) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($recurring_info['trial_status'] == 1) {
					$price = $this->currency->format($this->tax->calculate($recurring_info['trial_price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
					$trial_text = sprintf($this->language->get('text_trial_description'), $price, $recurring_info['trial_cycle'], $frequencies[$recurring_info['trial_frequency']], $recurring_info['trial_duration']) . ' ';
				} else {
					$trial_text = '';
				}

				$price = $this->currency->format($this->tax->calculate($recurring_info['price'] * $quantity, $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);

				if ($recurring_info['duration']) {
					$text = $trial_text . sprintf($this->language->get('text_payment_description'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				} else {
					$text = $trial_text . sprintf($this->language->get('text_payment_cancel'), $price, $recurring_info['cycle'], $frequencies[$recurring_info['frequency']], $recurring_info['duration']);
				}

				$json['success'] = $text;
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function download()
	{
		if ($this->customer->isLogged()) {
			$image = $this->db->query("SELECT " . $this->request->get['colname'] . " FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$this->request->get['product_id'] . "' LIMIT 1")->row;
			$original = DIR_IMAGE . $image[$this->request->get['colname']];
			$ext = pathinfo($original, PATHINFO_EXTENSION);
			$filename = $this->request->get['filename'];
			$filename .= '.' . $ext;
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			header('Content-Disposition: attachment; filename="' . basename($filename) . '"');
			header('Expires: 0');
			header('Cache-Control: must-revalidate');
			header('Pragma: public');
			header('Content-Length: ' . filesize($original));
			flush(); // Flush system output buffer
			readfile($original);
		} else {
			$this->session->data['redirect'] = $this->url->link('product/school&product_id=' . $this->request->get['product_id'], '', true);
			$this->response->redirect($this->url->link('account/login', '', true));
		}
	}



	// public function download_old()
	// {
	// 	if ($this->customer->isLogged()) {
	// 		$brosur['images'] = array();
	// 		$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)PHOTO_BROSUR_ID . "' LIMIT 1");
	// 		$index = $edu->row['length'];
	// 		$ar = explode("-", $index);
	// 		$start = (int)$ar[0];
	// 		$end = (int)$ar[1];
	// 		$this->load->model('catalog/school');
	// 		$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);
	// 		if (count($results) <> 0) {
	// 			$tmpfile = tempnam(DIR_IMAGE . "tmp", "pdf");
	// 			rename($tmpfile, $tmpfile .= '.pdf');
	// 			$images = array();
	// 			foreach ($results as $result) {
	// 				$images[] = DIR_IMAGE . $result['image'];
	// 			}
	// 			$pdf = new Imagick($images);
	// 			$pdf->setImageFormat('pdf');
	// 			$pdf->writeImages($tmpfile, true);
	// 			header('Content-Type: application/pdf');
	// 			header('Content-Length: ' . filesize($tmpfile));
	// 			$filename = $this->request->get['filename'];
	// 			$filename .= '.pdf';
	// 			header('Content-Disposition: attachment; filename="' . $filename . '"');
	// 			readfile($tmpfile);
	// 			unlink($tmpfile);
	// 		}
	// 	} else {
	// 		$this->session->data['redirect'] = $this->url->link('product/school&product_id=' . $this->request->get['product_id'], '', true);
	// 		$this->response->redirect($this->url->link('account/login', '', true));
	// 	}
	// }

	// public function download()
	// {
	// 	if ($this->customer->isLogged()) {
	// 		$brosur['images'] = array();
	// 		$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)$this->request->get['brosur_id'] . "' LIMIT 1");
	// 		$index = $edu->row['length'];
	// 		$ar = explode("-", $index);
	// 		$start = (int)$ar[0];
	// 		$end = (int)$ar[1];
	// 		$this->load->model('catalog/school');
	// 		$results = $this->model_catalog_school->getProductImages($this->request->get['product_id'], $start, $end);
	// 		if (count($results) <> 0) {
	// 			foreach ($results as $result) {
	// 				$original = DIR_IMAGE . $result['image'];
	// 				$ext = pathinfo($original, PATHINFO_EXTENSION);
	// 				$filename = $this->request->get['filename'];
	// 				$filename .= '.' . $ext;
	// 				header('Content-Description: File Transfer');
	// 				header('Content-Type: application/octet-stream');
	// 				header('Content-Disposition: attachment; filename="' . basename($filename) . '"');
	// 				header('Expires: 0');
	// 				header('Cache-Control: must-revalidate');
	// 				header('Pragma: public');
	// 				header('Content-Length: ' . filesize($original));
	// 				flush(); // Flush system output buffer
	// 				readfile($original);
	// 			}
	// 		}
	// 	} else {
	// 		$this->session->data['redirect'] = $this->url->link('product/school&product_id=' . $this->request->get['product_id'], '', true);
	// 		$this->response->redirect($this->url->link('account/login', '', true));
	// 	}
	// }


	// public function check_brosur($brosur_id, $product_id)
	// {
	// 	$edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id ='" . (int)$brosur_id . "' LIMIT 1");
	// 	$index = $edu->row['length'];
	// 	$ar = explode("-", $index);
	// 	$start = (int)$ar[0];
	// 	$end = (int)$ar[1];
	// 	$this->load->model('catalog/school');
	// 	$results = $this->model_catalog_school->getProductImages($product_id, $start, $end);
	// 	return count($results);
	// }

	public function daftar()
	{
		$data = array();
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$religions = ['Islam', 'Kristen', 'Protestan', 'Hindu',	'Budha'];
		$ke = 0;
		foreach ($religions as $rel) {
			$ke++;
			$data['religions'][$ke] = $rel;
		}

		$jobs = ['Karyawan Swasta', 'Pekerja Kontrak', 'Serabutan', 'Pedagang', 'Petani', 'PNS', 'TNI/Polri', 'Pengusaha', 'Tidak Bekerja', 'Sudah Meninggal', 'Ojek Online', 'Pensiunan', 'Nelayan', 'Freelance', 'Driver', 'Pilot', 'Pramugari'];
		$ke = 0;
		foreach ($jobs as $rel) {
			$ke++;
			$data['jobs'][$ke] = $rel;
		}
		$salaries = ['Kurang dari 1 Juta', '1 Juta s/d 3 Juta', '3 Juta s/d 5 Juta', '5 Juta s/d 10 Juta', '10 Juta keatas'];
		$ke = 0;
		foreach ($salaries as $rel) {
			$ke++;
			$data['salaries'][$ke] = $rel;
		}
		$educations = ['SD', 'SMP', 'SMA', 'D1', 'D2', 'D3', 'S1', 'S2', 'S3'];
		$ke = 0;
		foreach ($educations as $rel) {
			$ke++;
			$data['educations'][$ke] = $rel;
		}
		$relations = ['Paman', 'Bibi', 'Kakek', 'Nenek', 'Saudara Kandung', 'Lainnya'];
		$ke = 0;
		foreach ($relations as $rel) {
			$ke++;
			$data['relations'][$ke] = $rel;
		}
		$edulevels = ['Preschool', 'Sekolah Dasar', 'SMP', 'SMA', 'SMK'];
		$ke = 0;
		foreach ($edulevels as $rel) {
			$ke++;
			$data['edulevels'][$ke] = $rel;
		}

		$this->response->setOutput($this->load->view('product/registration_form', $data));
	}
}
