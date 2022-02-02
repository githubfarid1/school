<?php
class ControllerCatalogEducationCategoryCatalog extends Controller
{
    public function index()
    {
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            //$this->db->query("TRUNCATE " . DB_PREFIX . "education_category");
            $post = $this->request->post;

            if (isset($post['education_category'])) {
                // echo '<pre>' . print_r($post['education_category'],true) . '</pre>';
                // die;
                foreach ($post['education_category'] as $ekey => $edu) {
                    $columnIds = [];
                    $filterIds = [];
                    $attributeIds = [];

                    if (isset($edu['column'])) {
                        foreach ($edu['column'] as $key => $ec) {
                            if (isset($ec['status'])) {
                                $columnIds[] = array('id' => $key,
                                'column_theme' => $ec['column_theme'],
                                'screen_size' => isset($ec['screen_size']) ? $ec['screen_size'] : '',
                                'sort_order' => $ec['sort_order']);
                            }
                        }
                    }
                    if (isset($edu['attribute'])) {
                        foreach ($edu['attribute'] as $key => $ec) {
                            if (isset($ec['status'])) {
                                $attributeIds[] = array('id' => $key,
                                'attribute_theme' => $ec['attribute_theme'],
                                'screen_size' => $ec['screen_size'],
                                'sort_order' => $ec['sort_order'],
                                'icon' => $ec['icon']);
                            }
                        }
                    }
                    if (isset($edu['filter'])) {
                        foreach ($edu['filter'] as $key => $ec) {
                            if (isset($ec['status'])) {
                                $filterIds[] = array('id' => $key,
                                'filter_theme' => $ec['filter_theme'],
                                'screen_size' => $ec['screen_size'],
                                'sort_order' => $ec['sort_order'],
                                'icon' => $ec['icon']);
                            }
                        }
                    }
                    if (isset($edu['info_detail_theme'])) {
                        $info = $edu['info_detail_theme'];
                    } else {
                        $info = '';
                    }
                    if (isset($edu['registration_theme'])) {
                        $reg = $edu['registration_theme'];
                    } else {
                        $reg = '';
                    }
                    $found = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_category WHERE category_id = '" . (int)$ekey . "' LIMIT 1");
                    if ($found->num_rows == 0) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "education_category SET category_id = '" . (int)$ekey . "',
                        column_json ='" . json_encode($columnIds) . "', filter_json ='" . json_encode($filterIds) . "', attribute_json ='" . json_encode($attributeIds) . "', info_detail_theme = '" . $info . "', registration_theme ='" . $reg . "'");
                    } else {
                        $this->db->query("UPDATE " . DB_PREFIX . "education_category SET category_id = '" . (int)$ekey . "',
                        column_json ='" . json_encode($columnIds) . "', filter_json ='" . json_encode($filterIds) . "', attribute_json ='" . json_encode($attributeIds) . "', info_detail_theme = '" . $info . "', registration_theme ='" . $reg . "' WHERE category_id ='" . (int)$ekey . "'");
                    }
                    $this->session->data['success'] = 'Data Kategori Pendidikan sudah tersimpan !!';
                }
            }

        }
        $educations = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_category");
        $eduarray = [];
        if (isset($educations->rows)) {
            foreach ($educations->rows as $edu) {
                //echo '<pre>' . print_r($edu, true) .'</pre>';
                if ($edu['column_json']) {
                    $jsoncol = json_decode($edu['column_json']);
                    foreach ($jsoncol as $js) {
                        $eduarray[$edu['category_id']]['column'][$js->id]['status'] = 'on';
                        $eduarray[$edu['category_id']]['column'][$js->id]['column_theme'] = $js->column_theme;
                        if (isset($js->screen_size)) {
                            $eduarray[$edu['category_id']]['column'][$js->id]['screen_size'] = $js->screen_size;
                        }
                        $eduarray[$edu['category_id']]['column'][$js->id]['sort_order'] = $js->sort_order;
                    }
                }
                if ($edu['filter_json']) {
                    $jsoncol = json_decode($edu['filter_json']);
                    foreach ($jsoncol as $js) {
                        // echo '<pre>' . print_r($js,true) . '</pre>';
                        $eduarray[$edu['category_id']]['filter'][$js->id]['status'] = 'on';
                        $eduarray[$edu['category_id']]['filter'][$js->id]['filter_theme'] = $js->filter_theme;
                        $eduarray[$edu['category_id']]['filter'][$js->id]['screen_size'] = $js->screen_size;
                        $eduarray[$edu['category_id']]['filter'][$js->id]['sort_order'] = $js->sort_order;
                        $eduarray[$edu['category_id']]['filter'][$js->id]['icon'] = $js->icon;
                    }
                }
                if ($edu['attribute_json']) {
                    $jsoncol = json_decode($edu['attribute_json']);
                    foreach ($jsoncol as $js) {
                        // echo '<pre>' . print_r($js,true) . '</pre>';
                        $eduarray[$edu['category_id']]['attribute'][$js->id]['status'] = 'on';
                        $eduarray[$edu['category_id']]['attribute'][$js->id]['attribute_theme'] = $js->attribute_theme;
                        $eduarray[$edu['category_id']]['attribute'][$js->id]['screen_size'] = $js->screen_size;
                        $eduarray[$edu['category_id']]['attribute'][$js->id]['sort_order'] = $js->sort_order;
                        $eduarray[$edu['category_id']]['attribute'][$js->id]['icon'] = $js->icon;
                    }
                }
                $eduarray[$edu['category_id']]['info_detail_theme'] = $edu['info_detail_theme'];
                $eduarray[$edu['category_id']]['registration_theme'] = $edu['registration_theme'];

                //$eduarray[$edu['category_id']] =
            }
        }
        //echo '<pre>' . print_r($eduarray, true) . '</pre>';
        $data['education_category'] = $eduarray;
        $this->load->language('catalog/education_category_catalog');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_success'] = $this->language->get('text_success');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/education_category_catalog', 'token=' . $this->session->data['token'] /*. $url*/, true)
        );
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        $data['text_education'] = $this->language->get('text_education');
        $data['text_main_field'] = $this->language->get('text_main_field');
        $data['text_filter'] = $this->language->get('text_filter');
        $data['text_attribute'] = $this->language->get('text_attribute');

        $data['text_list'] = $this->language->get('text_list');
        $data['education_list'] = $this->educationList();
        $this->load->model('localisation/language');
        $langCode = $this->config->get('config_admin_language');
        $lang = $this->model_localisation_language->getLanguageByCode($langCode);
        $this->load->model('catalog/filter');

        $data['column_list'] = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE coltype IN ('group','images') ORDER BY sort_order")->rows;
        $data['filter_list'] = $this->model_catalog_filter->getFilterGroups(array('language_id' => $lang['language_id']));
        $this->load->model('catalog/attribute_group');
        $data['attribute_list'] = $this->model_catalog_attribute_group->getAttributeGroups(array('language_id' => $lang['language_id']));
        $data['action'] = $this->url->link('catalog/education_category_catalog', 'token=' . $this->session->data['token'], true);
        $data['token'] = $this->session->data['token'];
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        $data['detail_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/detail'), array('.', '..'));
        $data['registration_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/registration'), array('.', '..'));

        $data['filter_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/filter_view'), array('.', '..'));
        $data['attribute_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/attribute_view'), array('.', '..'));
        // $data['images_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/images_view'), array('.', '..'));
        $data['column_template'] = array_diff(scandir(DIR_CATALOG . '/view/theme/skolin/template/product/column_view'), array('.', '..'));
        $data['screen_size'] = array(12 => 'Penuh', 8 => '3/4', 6 => '1/2');
        $this->response->setOutput($this->load->view('catalog/education_category_catalog', $data));
    }
    public function educationList()
    {
        $categories = $this->db->query("SELECT * FROM " . DB_PREFIX . "category ORDER BY sort_order");
        $categoryIds = [];
        foreach ($categories->rows as $c) {
            $checkparent = $this->db->query("SELECT count(*) AS jml FROM " . DB_PREFIX . "category WHERE parent_id = '" . (int)$c['category_id'] . "'");
            if ($checkparent->row['jml'] == 0) {
                $categoryIds[] = $c['category_id'];
            }
        }
        $this->load->model('catalog/category');
        $list = [];
        foreach ($categoryIds as $category_id) {
            $category_info = $this->model_catalog_category->getCategory($category_id);

            if ($category_info) {
                $list[] = array(
                    'category_id' => $category_info['category_id'],
                    'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name'],
                    'school_list' => $this->url->link('catalog/school&category_id=' . $category_info['category_id'], 'token=' . $this->session->data['token'], true),

                );
            }
        }
        return $list;
    }
}
