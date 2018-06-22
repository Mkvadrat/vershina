<?php
// *	@copyright	OPENCART.PRO 2011 - 2017.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerCommonFooter extends Controller {
	public function index() {
		// BuyOneClick
		$this->load->model('setting/setting');
		$current_language_id = $this->config->get('config_language_id');
		$data['buyoneclick_success_field'] = htmlspecialchars_decode($this->config->get('buyoneclick_success_field_'.$current_language_id));
		$data['buyoneclick_status'] = $this->config->get('buyoneclick_status');
		$data['buyoneclick_status_category'] = $this->config->get('buyoneclick_status_category');
		$data['buyoneclick_field1_status'] = $this->config->get('buyoneclick_field1_status');
		$data['buyoneclick_field1_required'] = $this->config->get('buyoneclick_field1_required');
		$data['buyoneclick_field2_status'] = $this->config->get('buyoneclick_field2_status');
		$data['buyoneclick_field2_required'] = $this->config->get('buyoneclick_field2_required');
		$data['buyoneclick_field3_status'] = $this->config->get('buyoneclick_field3_status');
		$data['buyoneclick_field3_required'] = $this->config->get('buyoneclick_field3_required');
		$data['buyoneclick_field4_status'] = $this->config->get('buyoneclick_field4_status');
		$data['buyoneclick_field4_required'] = $this->config->get('buyoneclick_field4_required');
		$data['buyoneclick_validation_status'] = $this->config->get('buyoneclick_validation_status');
		$data['buyoneclick_validation_type'] = $this->config->get('buyoneclick_validation_type');

		$data['buyoneclick_admin_email'] = $this->config->get('config_email');

		$this->load->language('extension/module/buyoneclick');
		$data['buyoneclick_title'] = $this->language->get('buyoneclick_title');
		$data['buyoneclick_button'] = $this->language->get('buyoneclick_button');
		if ($data['buyoneclick_success_field'] == '') {
			$data['buyoneclick_success_field'] = $this->language->get('buyoneclick_success');
		}
		$data['buyoneclick_field1_title'] = $this->language->get('buyoneclick_field1_title');
		$data['buyoneclick_field2_title'] = $this->language->get('buyoneclick_field2_title');
		$data['buyoneclick_field3_title'] = $this->language->get('buyoneclick_field3_title');
		$data['buyoneclick_field4_title'] = $this->language->get('buyoneclick_field4_title');
		$data['buyoneclick_button_order'] = $this->language->get('buyoneclick_button_order');
		$data['buyoneclick_required_text'] = $this->language->get('buyoneclick_required_text');
		$data['buyoneclick_error_required'] = $this->language->get('buyoneclick_error_required');
		$data['buyoneclick_error_sending'] = $this->language->get('buyoneclick_error_sending');

		$data['buyoneclick_agree_status'] = $this->config->get('buyoneclick_agree_status');
		if ($this->config->get('buyoneclick_agree_status')) {
			$this->load->model('catalog/information');
			$information_info = $this->model_catalog_information->getInformation($this->config->get('buyoneclick_agree_status'));
			if ($information_info) {
				$data['buyoneclick_text_agree'] = sprintf($this->language->get('buyoneclick_text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('buyoneclick_agree_status'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$data['buyoneclick_text_agree'] = '';
			}
		} else {
			$data['buyoneclick_text_agree'] = '';
		}
		// BuyOneClickEnd
		
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');
		
		$data['telephone'] = $this->config->get('config_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['slogan'] = $this->config->get('config_slogan');
		$data['open'] = $this->config->get('config_open');
		$data['address'] = $this->config->get('config_address');
		$data['info_a'] = $this->config->get('config_information_a');
		$data['info_b'] = $this->config->get('config_information_b');
		$data['info_c'] = htmlspecialchars_decode($this->config->get('config_information_c'));
		$data['soc_links'] = htmlspecialchars_decode($this->config->get('config_soc_links'));
		$data['email'] = $this->config->get('config_email');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_bestseller'] = $this->language->get('text_bestseller');
		$data['text_mostviewed'] = $this->language->get('text_mostviewed');
		$data['text_latest'] = $this->language->get('text_latest');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');
		
		$data['action'] = $this->url->link('common/footer/sendmail', '', true);

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['phone'])) {
			$data['phone'] = $this->request->post['phone'];
		} else {
			$data['phone'] = $this->customer->getTelephone();
		}

		if (isset($this->request->post['enquiry'])) {
			$data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$data['enquiry'] = '';
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['bestseller'] = $this->url->link('product/bestseller');
		$data['mostviewed'] = $this->url->link('product/mostviewed');
		$data['latest'] = $this->url->link('product/latest');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		// Menu
		$this->load->model('design/custommenu');
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();
		
		if ($this->config->get('configcustommenu_custommenu')) {
		$custommenus = $this->model_design_custommenu->getcustommenus();
        $custommenu_child = $this->model_design_custommenu->getChildcustommenus();

        foreach($custommenus as $id => $custommenu) {
			$children_data = array();
        
			foreach($custommenu_child as $child_id => $child_custommenu) {
                if (($custommenu['custommenu_id'] != $child_custommenu['custommenu_id']) or !is_numeric($child_id)) {
                    continue;
                }

                $child_name = '';

                if (($custommenu['custommenu_type'] == 'category') and ($child_custommenu['custommenu_type'] == 'category')){
                    $filter_data = array(
                        'filter_category_id'  => $child_custommenu['link'],
                        'filter_sub_category' => true
                    );

                    $child_name = ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : '');
                }

                $children_data[] = array(
                    'name' => $child_custommenu['name'] . $child_name,
                    'href' => $this->getcustommenuLink($custommenu, $child_custommenu)
                );
            }

			$data['categories'][] = array(
				'name'     => $custommenu['name'] ,
				'children' => $children_data,
				'column'   => $custommenu['columns'] ? $custommenu['columns'] : 1,
				'href'     => $this->getcustommenuLink($custommenu)
			);
        }
		
		} else {

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		
		}
		
		//Second Menu
		$data['footer_categories'] = array();
		
		$footer_categories = $this->model_catalog_category->getCategories(0);

		foreach ($footer_categories as $category) {
			if ($category['top']) {
				// Level 1
				$data['footer_categories'][] = array(
					'name'     => $category['name'],
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
	
	public function getcustommenuLink($parent, $child = null) {
		 if ($this->config->get('configcustommenu_custommenu')) {
        $item = empty($child) ? $parent : $child;

        switch ($item['custommenu_type']) {
            case 'category':
                $route = 'product/category';

                if (!empty($child)) {
                    $args = 'path=' . $parent['link'] . '_' . $item['link'];
                } else {
                    $args = 'path='.$item['link'];
                }
                break;
            case 'product':
                $route = 'product/product';
                $args = 'product_id='.$item['link'];
                break;
            case 'manufacturer':
                $route = 'product/manufacturer/info';
                $args = 'manufacturer_id='.$item['link'];
                break;
            case 'information':
                $route = 'information/information';
                $args = 'information_id='.$item['link'];
                break;
            default:
                $tmp = explode('&', str_replace('index.php?route=', '', $item['link']));

                if (!empty($tmp)) {
                    $route = $tmp[0];
                    unset($tmp[0]);
                    $args = (!empty($tmp)) ? implode('&', $tmp) : '';
                }
                else {
                    $route = $item['link'];
                    $args = '';
                }

                break;
        }

        $check = stripos($item['link'], 'http');
        $checkbase = strpos($item['link'], '/');
        if ( $check === 0 || $checkbase === 0 ) {
			$link = $item['link'];
        } else {
            $link = $this->url->link($route, $args);
        }
        return $link;
    }
	}
	
	public function sendMail(){
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->load->language('information/contact');
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->request->post['phone']);
			$mail->setSender(html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
						
			$mail->setHtml('Имя: ' . $this->request->post['name'] . '<br>Телефон: ' . $this->request->post['phone'] . '<br>Сообщение: ' . $this->request->post['enquiry']);
			$mail->send();

			$this->response->redirect($this->url->link('information/contact/success'));
		}
	}
}
