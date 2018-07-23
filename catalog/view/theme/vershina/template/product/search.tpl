
<?php echo $header; ?>

    <div class="container">
        <div class="row">
        
            <?php echo $column_left; ?>
            
            <section class="col-md-9 contacts">
                <div class="breadcrumbs">
                    <hr>
                    <ul>
                        <?php			
                            $count = count($breadcrumbs);
                            $i=1;
                            foreach ($breadcrumbs as $breadcrumb) {
                                if($i!=$count){
                        ?>
                                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php echo ' ' . $breadcrumb['separator']; ?></li>
                        <?php
                                }else{
                                    echo '<li><span> '.$breadcrumb['text'] . '</span></li>'; 
                                }		
                                $i++;
                            } 
                        ?>
                    </ul>
                    <hr>
                </div>
                <div class="text-page">
                    <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
                    <div class="row">
                      <div class="col-sm-4">
                        <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="search-control" />
                      </div>
                      <div class="col-sm-3">
                        <select name="category_id" class="search-control">
                          <option value="0"><?php echo $text_category; ?></option>
                          <?php foreach ($categories as $category_1) { ?>
                          <?php if ($category_1['category_id'] == $category_id) { ?>
                          <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                          <?php } ?>
                          <?php foreach ($category_1['children'] as $category_2) { ?>
                          <?php if ($category_2['category_id'] == $category_id) { ?>
                          <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                          <?php } ?>
                          <?php foreach ($category_2['children'] as $category_3) { ?>
                          <?php if ($category_3['category_id'] == $category_id) { ?>
                          <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                          <?php } else { ?>
                          <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                          <?php } ?>
                          <?php } ?>
                          <?php } ?>
                          <?php } ?>
                        </select>
                      </div>
                      <div class="col-sm-3">
                      </div>
                    </div>
                        <label class="checkbox-inline">
                            <?php if ($sub_category) { ?>
                            <input type="checkbox" name="sub_category" value="1" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="sub_category" value="1" />
                            <?php } ?>
                            <?php echo $text_sub_category; ?></label>
                        <label class="checkbox-inline">
                            <?php if ($description) { ?>
                            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                            <?php } else { ?>
                            <input type="checkbox" name="description" value="1" id="description" />
                            <?php } ?>
                            <?php echo $entry_description; ?></label>
                    <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="w-button" />
                    <h2><?php echo $text_search; ?></h2>
                    
                    <?php if ($products) { ?>
                    <div class="category-list">
                        <div class="content"></div>
                        <?php foreach ($products as $product) { ?>
                            <div class="popular-item">
                                <a class="img" href="<?php echo $product['href']; ?>">
                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
                                </a>
                                <a class="name" href="<?php echo $product['href']; ?>">
                                    <span>
                                        <?php echo $product['name']; ?>
                                    </span>
                                </a>
                                <span class="price">
                                    <?php if (!$product['special']) { ?>
                                    Цена:
                                    <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                    Цена:
                                    <span><?php echo $product['special']; ?></span> <strike><sup style="font-size: 50%;"><?php echo $product['price']; ?></sup></strike>
                                    <?php } ?>
                                    <?php if ($product['tax']) { ?>
                                    <span><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                    <?php } ?>
                                </span>
                                <a class="more w-button" href="<?php echo $product['href']; ?>">Подробнее</a>
                                <a style="cursor: pointer;" class="add-to-bucket" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fas fa-cart-plus fa-10x"></i></a>
                            </div>
                        <?php } ?>
                        
                    </div>
                    <?php } ?>
                
                    <?php if (!$categories && !$products) { ?>
                    <p><?php echo $text_empty; ?></p>
                    <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                    </div>
                    <?php } ?>
                </div>
            </section>
        </div>
    </div>


<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#input-search').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>