<?php
class ControllerCatalogSchool extends Controller
{
    private $error = array();

    public function index()
    {

        $this->load->language('catalog/school');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/school');
        $this->getList();
    }

    public function getList()
    {
        if (isset($this->request->get['category_id'])) {
            $filter_category = $this->request->get['category_id'];
        } else {
            $filter_category = null;
        }

        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }


        if (isset($this->request->get['filter_status'])) {
            $filter_status = $this->request->get['filter_status'];
        } else {
            $filter_status = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'pd.name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';
        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }


        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true)
        );

        $data['add'] = $this->url->link('catalog/school/add&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true);
        $data['copy'] = $this->url->link('catalog/school/copy&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true);
        $data['delete'] = $this->url->link('catalog/school/delete&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true);

        $data['products'] = array();

        $filter_data = array(
            'filter_name'      => $filter_name,
            'filter_status'   => $filter_status,
            'filter_category'   => $filter_category,
            'sort'            => $sort,
            'order'           => $order,
            'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit'           => $this->config->get('config_limit_admin')
        );

        $this->load->model('tool/image');

        $product_total = $this->model_catalog_school->getTotalSchools($filter_data);

        $results = $this->model_catalog_school->getSchools($filter_data);

        foreach ($results as $result) {
            if (is_file(DIR_IMAGE . $result['image'])) {
                $image = $this->model_tool_image->resize($result['image'], 40, 40);
            } else {
                $image = $this->model_tool_image->resize('no_image.png', 40, 40);
            }


            $data['products'][] = array(
                'product_id' => $result['product_id'],
                'image'      => $image,
                'name'       => $result['name'],
                'model'      => $result['model'],
                'price'      => $result['price'],
                'quantity'   => $result['quantity'],
                'address'      => $result['address'],
                'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
                'edit'       => $this->url->link('catalog/school/edit&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, true)
            );
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_list'] = $this->language->get('text_list');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_no_results'] = $this->language->get('text_no_results');
        $data['text_confirm'] = $this->language->get('text_confirm');

        $data['column_image'] = $this->language->get('column_image');
        $data['column_name'] = $this->language->get('column_name');
        $data['column_model'] = $this->language->get('column_model');
        $data['column_price'] = $this->language->get('column_price');
        $data['column_quantity'] = $this->language->get('column_quantity');
        $data['column_status'] = $this->language->get('column_status');
        $data['column_action'] = $this->language->get('column_action');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_model'] = $this->language->get('entry_model');
        $data['entry_price'] = $this->language->get('entry_price');
        $data['entry_quantity'] = $this->language->get('entry_quantity');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_image'] = $this->language->get('entry_image');

        $data['button_copy'] = $this->language->get('button_copy');
        $data['button_add'] = $this->language->get('button_add');
        $data['button_edit'] = $this->language->get('button_edit');
        $data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

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

        if (isset($this->request->post['selected'])) {
            $data['selected'] = (array)$this->request->post['selected'];
        } else {
            $data['selected'] = array();
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }


        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, true);
        $data['sort_status'] = $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, true);
        $data['sort_order'] = $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . '&sort=p.sort_order' . $url, true);

        $url = '';
        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
        }


        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $product_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;
        $data['filter_status'] = $filter_status;

        $data['sort'] = $sort;
        $data['order'] = $order;

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/school_list', $data));
    }

    public function autocomplete()
    {
        $json = array();

        if (isset($this->request->get['filter_name'])) {
            $this->load->model('catalog/school');
            $this->load->model('catalog/option');

            if (isset($this->request->get['filter_name'])) {
                $filter_name = $this->request->get['filter_name'];
            } else {
                $filter_name = '';
            }


            if (isset($this->request->get['limit'])) {
                $limit = $this->request->get['limit'];
            } else {
                $limit = 5;
            }

            $filter_data = array(
                'filter_name'  => $filter_name,
                'start'        => 0,
                'limit'        => $limit
            );

            $results = $this->model_catalog_school->getSchools($filter_data);

            foreach ($results as $result) {
                $option_data = array();

                $product_options = $this->model_catalog_school->getProductOptions($result['product_id']);

                foreach ($product_options as $product_option) {
                    $option_info = $this->model_catalog_option->getOption($product_option['option_id']);

                    if ($option_info) {
                        $product_option_value_data = array();

                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            $option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);

                            if ($option_value_info) {
                                $product_option_value_data[] = array(
                                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                                    'option_value_id'         => $product_option_value['option_value_id'],
                                    'name'                    => $option_value_info['name'],
                                    'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
                                    'price_prefix'            => $product_option_value['price_prefix']
                                );
                            }
                        }

                        $option_data[] = array(
                            'product_option_id'    => $product_option['product_option_id'],
                            'product_option_value' => $product_option_value_data,
                            'option_id'            => $product_option['option_id'],
                            'name'                 => $option_info['name'],
                            'type'                 => $option_info['type'],
                            'value'                => $product_option['value'],
                            'required'             => $product_option['required']
                        );
                    }
                }

                $json[] = array(
                    'product_id' => $result['product_id'],
                    'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
                    'model'      => $result['model'],
                    'option'     => $option_data,
                    'price'      => $result['price']
                );
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function add()
    {
        $this->load->language('catalog/school');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/school');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->request->post['category_id'] = $this->request->get['category_id'];
            // echo "<pre>" . print_r($this->request->post, true) . "</pre>";
            // die;
            $this->model_catalog_school->addProduct($this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }


            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }
    public function edit()
    {
        $this->load->language('catalog/school');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/school');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_school->editProduct($this->request->get['product_id'], $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }


            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getForm();
    }

    public function validateForm()
    {
        return true;
    }
    public function getForm()
    {
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_none'] = $this->language->get('text_none');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_plus'] = $this->language->get('text_plus');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        $data['text_minus'] = $this->language->get('text_minus');
        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_image'] = $this->language->get('tab_image');
        $data['tab_filter'] = 'Filter';
        $data['tab_attribute'] = $this->language->get('tab_attribute');
        $data['tab_authorization'] = 'Authorization';

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = array();
        }

        if (isset($this->error['meta_title'])) {
            $data['error_meta_title'] = $this->error['meta_title'];
        } else {
            $data['error_meta_title'] = array();
        }

        if (isset($this->error['model'])) {
            $data['error_model'] = $this->error['model'];
        } else {
            $data['error_model'] = '';
        }

        if (isset($this->error['keyword'])) {
            $data['error_keyword'] = $this->error['keyword'];
        } else {
            $data['error_keyword'] = '';
        }

        $url = '';

        if (isset($this->request->get['category_id'])) {
            $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_status'])) {
            $url .= '&filter_status=' . $this->request->get['filter_status'];
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true)
        );

        if (!isset($this->request->get['product_id'])) {
            $data['action'] = $this->url->link('catalog/school/add&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true);
        } else {
            $data['action'] = $this->url->link('catalog/school/edit&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, true);
        }

        $data['cancel'] = $this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true);
        $this->load->model('tool/image');

        if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $product_info = $this->model_catalog_school->getSchool($this->request->get['product_id']);
            //echo "<pre>" . print_r($product_info, true) . "</pre>";
            //die;
        }
        $this->load->model('tool/image');
        $edu = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_category WHERE category_id = '" . (int)$this->request->get['category_id'] . "' LIMIT 1");
        $colIds = json_decode($edu->row['column_ids']);
        if (!empty($colIds)) {
            $strIds = implode(", ", $colIds);
            $educols = $this->db->query("SELECT * FROM " . DB_PREFIX . "education_column WHERE education_column_id IN (" . $strIds . ") ORDER BY sort_order");
            foreach ($educols->rows as $col) {
                if ($col['coltype'] <> 'images') {
                    if ($col['coltype'] <> 'image' && $col['coltype'] <> 'brosur') {
                        if (isset($this->request->post[$col['colname']])) {
                            $col['value'] = $this->request->post[$col['colname']];
                        } else {
                            $col['value'] = isset($product_info[$col['colname']]) ? $product_info[$col['colname']] : null;
                        }
                    } else {
                        if (isset($this->request->post[$col['colname']]['image'])) {
                            $col['value'] = $this->request->post[$col['colname']]['image'];
                        } elseif (isset($this->request->get['product_id'])) {
                            $col['value'] = isset($product_info[$col['colname']]) ? $product_info[$col['colname']] : null;
                        } else {
                            $col['value'] = null;
                        }
                        if (isset($col['value']) && is_file(DIR_IMAGE . $col['value'])) {
                            $col['thumb'] = $this->model_tool_image->resize($col['value'], 100, 100);
                        } else {
                            $col['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
                        }
                        $col['photo_name'] = isset($this->request->post[$col['colname']]['name']) ? $this->request->post[$col['colname']]['name'] : (isset($product_info['photo_name']) ? $product_info['photo_name'] : null);

                        $col['photo_description'] = isset($this->request->post[$col['colname']]['description']) ? $this->request->post[$col['colname']]['description'] : (isset($product_info['photo_description']) ? $product_info['photo_description'] : null);
                    }
                } else {
                    $col['value'] = array();
                    $ar = explode("-", $col['length']);
                    $start = (int)$ar[0];
                    $end = (int)$ar[1];
                    if (isset($this->request->post[$col['colname']])) {
                        while ($start <= $end) {
                            $product_image = $this->request->post[$col['colname']][$start];
                            if (is_file(DIR_IMAGE . $product_image['image'])) {
                                $image = $product_image['image'];
                                $thumb = $product_image['image'];
                            } else {
                                $image = '';
                                $thumb = 'no_image.png';
                            }

                            $col['value'][$start] = array(
                                'image' => $image,
                                'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
                                'name' => $product_image['name'],
                                'description' => $product_image['description'],
                            );

                            $start++;
                        }
                    } elseif (isset($this->request->get['product_id'])) {
                        while ($start <= $end) {
                            $product_image = $this->model_catalog_school->getProductImage($this->request->get['product_id'], $start);
                            if ($product_image) {
                                if (is_file(DIR_IMAGE . $product_image['image'])) {
                                    $image = $product_image['image'];
                                    $thumb = $product_image['image'];
                                } else {
                                    $image = '';
                                    $thumb = 'no_image.png';
                                }
                                $col['value'][$start] = array(
                                    'image' => $image,
                                    'thumb' => $this->model_tool_image->resize($thumb, 100, 100),
                                    'name' => $product_image['image_name'],
                                    'description' => $product_image['image_description'],
                                );
                            } else {
                                $col['value'][$start] = array(
                                    'image' => '',
                                    'thumb' => $this->model_tool_image->resize('no_image.png', 100, 100),
                                    'name' => '',
                                    'description' => '',
                                );
                            }
                            $start++;
                        }
                    } else {
                        $col['value'] = null;
                    }
                }
                $data['columns'][] = $col;
            }
        } else {
            $data['columns'] = array();
        }





        // echo "<pre>" . print_r($data['columns'],true) . "</pre>";
        $data['empty_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        $filterIds = json_decode($edu->row['filter_ids']);
        $attributeIds = json_decode($edu->row['attribute_ids']);

        $this->load->model('localisation/language');
        $langCode = $this->config->get('config_admin_language');
        $lang = $this->model_localisation_language->getLanguageByCode($langCode);
        if (!empty($filterIds)) {
            $filters = [];
            if (isset($this->request->get['product_id'])) {
                $filters = $this->model_catalog_school->getProductFilters($this->request->get['product_id']);
            }
            $strIds = implode(", ", $filterIds);
            $educols = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_group WHERE filter_group_id IN (" . $strIds . ") ORDER BY sort_order");
            $data['filters'] = array();
            $ke = 0;
            foreach ($educols->rows as $col) {
                $fg = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_group_description WHERE filter_group_id ='" . (int)$col['filter_group_id'] . "' AND language_id ='" . (int)$lang['language_id'] . "' LIMIT 1");
                $fl = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter WHERE filter_group_id ='" . (int)$col['filter_group_id'] . "'");
                $data['filters'][$ke]['name'] = $fg->row['name'];
                $data['filters'][$ke]['id'] = $fg->row['filter_group_id'];
                $data['filters'][$ke]['checktype'] = $col['checktype'];
                $data['filters'][$ke]['items'] = array();
                // echo '<pre>' . print_r($this->request->post['filter'],true) . '</pre>';
                // die;

                foreach ($fl->rows as $val) {
                    $fd = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_description WHERE filter_id ='" . (int)$val['filter_id'] . "' AND language_id ='" . (int)$lang['language_id'] . "' LIMIT 1");
                    if (isset($this->request->post['filter'])) {
                        if ($col['checktype'] == 'checkbox') {
                            $data['filters'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['filter_id'], 'selected' => isset($this->request->post['filter'][$col['filter_group_id']][$fd->row['filter_id']])  ? true : false);
                        }
                        if ($col['checktype'] == 'select') {
                            $data['filters'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['filter_id'], 'selected' => $this->request->post['filter'][$col['filter_group_id']][0] == $fd->row['filter_id']  ? true : false);
                        }
                    } elseif (isset($this->request->get['product_id'])) {
                        $data['filters'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['filter_id'], 'selected' => in_array($fd->row['filter_id'], $filters) ? true : false);
                    } else {
                        $data['filters'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['filter_id'], 'selected' => false);
                    }
                    //print_r($fd->row['name'] . "<br/>");

                }
                $ke++;
            }
        } else {
            $data['filter'] = array();
        }
        // echo "<pre>" . print_r($data['filters'], true) . "</pre>";
        // die;
        if (!empty($attributeIds)) {
            $strIds = implode(", ", $attributeIds);
            $educols = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_group WHERE attribute_group_id IN (" . $strIds . ") ORDER BY sort_order");
            $data['attributes'] = array();
            $ke = 0;
            foreach ($educols->rows as $col) {
                $fg = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_group_description WHERE attribute_group_id ='" . (int)$col['attribute_group_id'] . "' AND language_id ='" . (int)$lang['language_id'] . "' LIMIT 1");
                $fl = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute WHERE attribute_group_id ='" . (int)$col['attribute_group_id'] . "'");
                $data['attributes'][$ke]['name'] = $fg->row['name'];
                $data['attributes'][$ke]['id'] = $fg->row['attribute_group_id'];
                $data['attributes'][$ke]['showlabel'] = $col['showlabel'];
                $data['attributes'][$ke]['items'] = array();
                foreach ($fl->rows as $val) {
                    $fd = $this->db->query("SELECT * FROM " . DB_PREFIX . "attribute_description WHERE attribute_id ='" . (int)$val['attribute_id'] . "' AND language_id ='" . (int)$lang['language_id'] . "' LIMIT 1");
                    if (isset($this->request->post['attribute'])) {
                        $data['attributes'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['attribute_id'], 'value' => $this->request->post['attribute'][$fg->row['attribute_group_id']][$fd->row['attribute_id']]);
                    } elseif (isset($this->request->get['product_id'])) {
                        $product_attribute = $this->model_catalog_school->getProductAttribute($this->request->get['product_id'], (int)$val['attribute_id']);

                        $data['attributes'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['attribute_id'], 'value' => $product_attribute['product_attribute_description']);
                    } else {
                        $data['attributes'][$ke]['items'][] = array('name' => $fd->row['name'], 'id' => $fd->row['attribute_id'], 'value' => null);
                    }
                }
                $ke++;
            }
        } else {
            $data['attributes'] = array();
        }
        //echo "<pre>" . print_r($data['attributes'], true) . "</pre>";
        $users = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_group_id = 12");
        $data['users'] = $users->rows;
        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($product_info)) {
            $data['status'] = $product_info['status'];
        } else {
            $data['status'] = '';
        }
        if (isset($this->request->post['user_id'])) {
            $data['user_id'] = $this->request->post['user_id'];
        } elseif (!empty($product_info)) {
            $data['user_id'] = $product_info['user_id'];
        } else {
            $data['user_id'] = '';
        }
        $stock_statuses = $this->db->query("SELECT * FROM " . DB_PREFIX . "stock_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
        $data['stock_statuses'] = $stock_statuses->rows;
        if (isset($this->request->post['stock_status_id'])) {
            $data['stock_status_id'] = $this->request->post['stock_status_id'];
        } elseif (!empty($product_info)) {
            $data['stock_status_id'] = $product_info['stock_status_id'];
        } else {
            $data['stock_status_id'] = '';
        }

        if (isset($this->request->post['date_closed'])) {
            $data['date_closed'] = $this->request->post['date_closed'];
        } elseif (!empty($product_info)) {
            $data['date_closed'] = ($product_info['date_closed'] != '0000-00-00') ? $product_info['date_closed'] : '';
        } else {
            $data['date_closed'] = '';//date('Y-m-d');
        }
        $this->load->model('setting/store');
        $data['stores'] = $this->model_setting_store->getStores();

        if (isset($this->request->post['product_store'])) {
            $data['product_store'] = $this->request->post['product_store'];
        } elseif (isset($this->request->get['product_id'])) {
            $data['product_store'] = $this->model_catalog_school->getProductStores($this->request->get['product_id']);
        } else {
            $data['product_store'] = array(0);
        }

        $data['token'] = $this->session->data['token'];

        $this->load->model('localisation/language');

        $data['languages'] = $this->model_localisation_language->getLanguages();
        $data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);


        $this->load->model('design/layout');

        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        // echo "<pre>" . print_r($data, true) . "</pre>";
        // die;
        $this->response->setOutput($this->load->view('catalog/school_form', $data));
    }

    public function delete()
    {
        $this->load->language('catalog/school');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('catalog/school');

        if (isset($this->request->post['selected']) && $this->validateDelete()) {
            foreach ($this->request->post['selected'] as $product_id) {
                $this->model_catalog_school->deleteSchool($product_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['filter_name'])) {
                $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['category_id'])) {
                $url .= '&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8'));
            }

            if (isset($this->request->get['filter_status'])) {
                $url .= '&filter_status=' . $this->request->get['filter_status'];
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

            $this->response->redirect($this->url->link('catalog/school&category_id=' . urlencode(html_entity_decode($this->request->get['category_id'], ENT_QUOTES, 'UTF-8')), 'token=' . $this->session->data['token'] . $url, true));
        }

        $this->getList();
    }
    protected function validateDelete()
    {
        // if (!$this->user->hasPermission('modify', 'catalog/product')) {
        // 	$this->error['warning'] = $this->language->get('error_permission');
        // }

        // return !$this->error;
        return true;
    }
}
