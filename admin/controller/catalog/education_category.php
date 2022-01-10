<?php
class ControllerCatalogEducationCategory extends Controller
{
    public function index()
    {
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            // echo '<pre>';
            // print_r($this->request->post);
            // echo '</pre>';
            // //die;
            $this->db->query("TRUNCATE " . DB_PREFIX . "education_category");
            $post = $this->request->post;

            if (isset($post['education_category'])) {
                foreach ($post['education_category'] as $ekey => $edu) {
                    $columnIds = [];
                    $filterIds = [];
                    $attributeIds = [];

                    if (isset($edu['column'])) {
                        foreach ($edu['column'] as $key => $ec) {
                            $columnIds[] = $key;
                        }
                    }
                    if (isset($edu['filter'])) {
                        foreach ($edu['filter'] as $key => $ec) {
                            $filterIds[] = $key;
                        }
                    }
                    if (isset($edu['attribute'])) {
                        foreach ($edu['attribute'] as $key => $ec) {
                            $attributeIds[] = $key;
                        }
                    }
                    $this->db->query("INSERT INTO " . DB_PREFIX . "education_category SET category_id = '" . (int)$ekey . "',
                        column_ids ='" . json_encode($columnIds) . "', filter_ids ='" . json_encode($filterIds) . "', attribute_ids ='" . json_encode($attributeIds) . "'");
                }
            }
        }
        $educations = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_category");
        $eduarray = [];
        if (isset($educations->rows)) {
            foreach ($educations->rows as $edu) {
                //echo '<pre>' . print_r($edu, true) .'</pre>';
                if ($edu['column_ids']) {
                    $jsoncol = json_decode($edu['column_ids']);
                    foreach ($jsoncol as $js) {
                        $eduarray[$edu['category_id']]['column'][$js] = 'on';
                    }
                }
                if ($edu['filter_ids']) {
                    $jsoncol = json_decode($edu['filter_ids']);
                    foreach ($jsoncol as $js) {
                        $eduarray[$edu['category_id']]['filter'][$js] = 'on';
                    }
                }
                if ($edu['attribute_ids']) {
                    $jsoncol = json_decode($edu['attribute_ids']);
                    foreach ($jsoncol as $js) {
                        $eduarray[$edu['category_id']]['attribute'][$js] = 'on';
                    }
                }

                //$eduarray[$edu['category_id']] =
            }
        }
        //echo '<pre>' . print_r($eduarray, true) . '</pre>';
        $data['education_category'] = $eduarray;
        $this->load->language('catalog/education_category');
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_success'] = $this->language->get('text_success');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/education_category', 'token=' . $this->session->data['token'] /*. $url*/, true)
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

        $data['column_list'] = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column")->rows;
        $data['filter_list'] = $this->model_catalog_filter->getFilterGroups(array('language_id' => $lang['language_id']));
        $this->load->model('catalog/attribute_group');
        $data['attribute_list'] = $this->model_catalog_attribute_group->getAttributeGroups(array('language_id' => $lang['language_id']));
        $data['action'] = $this->url->link('catalog/education_category', 'token=' . $this->session->data['token'], true);

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/education_category', $data));
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
                    'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                );
            }
        }
        return $list;
    }
}
