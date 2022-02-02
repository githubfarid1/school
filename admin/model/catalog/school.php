<?php
class ModelCatalogSchool extends Model {
	public function addProduct($data) {
		$data['address'] = isset($data['address']) ? $data['address'] : '';
		$data['monthly_cost'] = isset($data['monthly_cost']) ? $data['monthly_cost'] : '';
		$data['first_cost'] = isset($data['first_cost']) ? $data['first_cost'] : '';
		$data['akreditasi'] = isset($data['akreditasi']) ? $data['akreditasi'] : '';
		$data['faq'] = isset($data['faq']) ? $data['faq'] : '';
		$data['isregister'] = isset($data['isregister']) ? $data['isregister'] : '';

		$this->db->query("INSERT INTO " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['school_name']) . "', address = '" . $this->db->escape($data['address']) . "', price = '" . (float)$data['monthly_cost'] . "', price2 = '" . (float)$data['first_cost'] . "', akreditasi = '" . $this->db->escape($data['akreditasi']) . "', status = '" . (int)$data['status'] . "', user_id = '" . (int)$data['user_id'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_closed = '" . $this->db->escape($data['date_closed']) . "', isregister = '" . (int)$data['isregister'] . "', date_added = NOW()");

		$product_id = $this->db->getLastId();

		if (isset($data['photo_main']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['photo_main']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		if (isset($data['brosur_front']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET brosur_front = '" . $this->db->escape($data['brosur_front']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		if (isset($data['brosur_back']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET brosur_back = '" . $this->db->escape($data['brosur_back']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}

		if (isset($data['photo_secondary'])) {
			foreach ($data['photo_secondary'] as $key => $product_image) {
				if (isset($product_image['image']) && $product_image['image'] <> '')
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "', image_name = '" . $this->db->escape($product_image['name']) . "', image_description = '" . $this->db->escape($product_image['description']) . "', sort_order = '" . (int)$key . "'");
			}
		}
		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$langs = $this->db->query("SELECT * FROM " . DB_PREFIX . "language");
		foreach ($langs->rows as $lang) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '" . (int)$lang['language_id'] . "', name = '" . $this->db->escape($data['school_name']) . "', description = '" . $this->db->escape($data['school_profile']) . "', meta_title = '" . $this->db->escape($data['school_name']) . "', meta_description = '" . $this->db->escape($data['school_name']) . "', meta_keyword = '" . $this->db->escape($data['school_name']) . "', faq = '" . $this->db->escape($data['faq']) . "'");

		}

		$seourl = strtolower(trim($data['school_name']));
		$seourl = preg_replace('/[^A-Za-z0-9-]+/', '-', $seourl);
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($seourl) . "'");

		if (isset($data['attribute'])) {
			foreach ($data['attribute'] as $ag) {
				foreach ($ag as $key => $product_attribute) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$key . "'");
					if ($product_attribute) {
						foreach ($langs->rows as $lang) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$key . "', language_id = '" . (int)$lang['language_id'] . "', text = '" .  $this->db->escape($product_attribute) . "'");

						}
					}
				}
			}
		}


		if (isset($data['category_id'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$data['category_id'] . "'");
		}

		if (isset($data['filter'])) {
			foreach ($data['filter'] as $val1) {
				foreach ($val1 as $key => $val2) {
					if ($key == 0) {
						$id = $val2;
					} else {
						$id = $key;
					}
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$id . "'");
				}
			}
		}


		$this->cache->delete('product');

		return $product_id;
	}
	public function editProduct($product_id, $data) {
		$data['address'] = isset($data['address']) ? $data['address'] : '';
		$data['monthly_cost'] = isset($data['monthly_cost']) ? $data['monthly_cost'] : '';
		$data['first_cost'] = isset($data['first_cost']) ? $data['first_cost'] : '';
		$data['akreditasi'] = isset($data['akreditasi']) ? $data['akreditasi'] : '';
		$data['faq'] = isset($data['faq']) ? $data['faq'] : '';
		$data['isregister'] = isset($data['isregister']) ? $data['isregister'] : '';

		$this->db->query("UPDATE " . DB_PREFIX . "product SET model = '" . $this->db->escape($data['school_name']) . "', address = '" . $this->db->escape($data['address']) . "', price = '" . (float)$data['monthly_cost'] . "', price2 = '" . (float)$data['first_cost'] . "', akreditasi = '" . $this->db->escape($data['akreditasi']) . "', status = '" . (int)$data['status'] . "', user_id = '" . (int)$data['user_id'] . "', stock_status_id = '" . (int)$data['stock_status_id'] . "', date_closed = '" . $this->db->escape($data['date_closed']) . "', isregister = '" . (int)$data['isregister'] . "', date_added = NOW()  WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['photo_main']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET image = '" . $this->db->escape($data['photo_main']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		if (isset($data['brosur_front']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET brosur_front = '" . $this->db->escape($data['brosur_front']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}
		if (isset($data['brosur_back']['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "product SET brosur_back = '" . $this->db->escape($data['brosur_back']['image']) . "' WHERE product_id = '" . (int)$product_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		if (isset($data['photo_secondary'])) {
			foreach ($data['photo_secondary'] as $key => $product_image) {
				if (isset($product_image['image']) && $product_image['image'] <> '')
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "', image_name = '" . $this->db->escape($product_image['name']) . "', image_description = '" . $this->db->escape($product_image['description']) . "', sort_order = '" . (int)$key . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");
		$langs = $this->db->query("SELECT * FROM " . DB_PREFIX . "language");
		foreach ($langs->rows as $lang) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "product_description SET product_id = '" . (int)$product_id . "', language_id = '" . (int)$lang['language_id'] . "', name = '" . $this->db->escape($data['school_name']) . "', description = '" . $this->db->escape($data['school_profile']) . "', meta_title = '" . $this->db->escape($data['school_name']) . "', meta_description = '" . $this->db->escape($data['school_name']) . "', meta_keyword = '" . $this->db->escape($data['school_name']) . "', faq = '" . $this->db->escape($data['faq']) . "'");

		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");
		$seourl = strtolower(trim($data['school_name']));
		$seourl = preg_replace('/[^A-Za-z0-9-]+/', '-', $seourl);
		$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($seourl) . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['attribute'])) {
			foreach ($data['attribute'] as $ag) {
				foreach ($ag as $key => $product_attribute) {
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$key . "'");
					if ($product_attribute) {
						foreach ($langs->rows as $lang) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_attribute SET product_id = '" . (int)$product_id . "', attribute_id = '" . (int)$key . "', language_id = '" . (int)$lang['language_id'] . "', text = '" .  $this->db->escape($product_attribute) . "'");

						}
					}
				}
			}
		}



		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");
		if (isset($data['filter'])) {
			foreach ($data['filter'] as $val1) {
				foreach ($val1 as $key => $val2) {
					if ($key == 0) {
						$id = $val2;
					} else {
						$id = $key;
					}
					$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$id . "'");
				}
			}
		}



		$this->cache->delete('product');
	}

	public function getTotalSchools($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category pc ON (p.product_id = pc.product_id)";

		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}


		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (!empty($data['filter_category'])) {
			$sql .= " AND pc.category_id = '" . (int)$data['filter_category'] . "'";
		}
		if (!empty($data['filter_user'])) {
			$sql .= " AND p.user_id = '" . (int)$data['filter_user'] . "'";
		}
        //print_r($sql);
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	public function deleteSchool($product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$product_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$product_id . "'");

		$this->cache->delete('product');
	}

	public function getSchools($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category pc ON (p.product_id = pc.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}
		if (!empty($data['filter_category'])) {
			$sql .= " AND pc.category_id = '" . (int)$data['filter_category'] . "'";
		}
		if (!empty($data['filter_user'])) {
			$sql .= " AND p.user_id = '" . (int)$data['filter_user'] . "'";
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.status',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY pd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	public function getSchool($product_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return array(
			'product_id' => $query->row['product_id'],
			'school_name' => $query->row['name'],
			'school_profile' => $query->row['description'],
			'address' => $query->row['address'],
			'photo_main' => $query->row['image'],
			'brosur_front' => $query->row['brosur_front'],
			'brosur_back' => $query->row['brosur_back'],
			'monthly_cost' => $query->row['price'],
			'first_cost' => $query->row['price2'],
			'akreditasi' => $query->row['akreditasi'],
			'faq' => $query->row['faq'],
			'photo_name' => $query->row['image_name'],
			'photo_description' => $query->row['image_description'],
			'user_id' => $query->row['user_id'],
			'status' => $query->row['status'],
			'stock_status_id' => $query->row['stock_status_id'],
			'date_closed' => $query->row['date_closed'],
			'isregister' => $query->row['isregister'],

		);
	}

	public function getProductImage($product_id, $sort_order) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' AND sort_order ='" . (int)$sort_order . "' LIMIT 1" );
		return $query->row;
	}

	public function getProductFilters($product_id) {
		$product_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_filter_data[] = $result['filter_id'];
		}

		return $product_filter_data;
	}
	public function getProductAttribute($product_id, $attribute_id) {

		$product_attribute = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$attribute_id . "' AND language_id ='" . (int)$this->config->get('config_language_id') . "' LIMIT 1")->row;
		// echo '<pre>' . print_r($product_attribute, true) . '</pre>';
		if($product_attribute) {
			return array(
				'attribute_id' => $product_attribute['attribute_id'],
				'product_attribute_description' => $product_attribute['text']
			);

		} else {
			return array(
				'attribute_id' => null,
				'product_attribute_description' => null
			);

		}

	}

	public function getProductStores($product_id) {
		$product_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_store_data[] = $result['store_id'];
		}

		return $product_store_data;
	}

	public function getProductCategories($product_id) {
		$product_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

		foreach ($query->rows as $result) {
			$product_category_data[] = $result['category_id'];
		}

		return $product_category_data;
	}

}

?>
