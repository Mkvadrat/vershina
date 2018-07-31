<?php echo $header; ?>

	<div class="container">
        <div class="row">
            
            <?php echo $column_left; ?>
            
            <section class="col-md-9">
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
				
                <h1 class="title"><?php echo $heading_title; ?></h1>
                
                <?php if ($description) { ?>
                <div class="seo-text">
                    <?php echo $description; ?>
                </div>
                <?php } ?>
				
				<?php if ($categories) { ?>
					<?php //if (count($categories) <= 5) { ?>
					<!--	<div class="row">
							<div class="col-sm-3"> -->
                            <div class="category-of-category">
								<ul>
								  <?php foreach ($categories as $category) { ?>
								  <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>"><?php echo $category['name']; ?></a></li>
								  <?php } ?>
								</ul>
					<!--	</div> -->
						</div>
					<?php /*} else { ?>
						<div class="row">
							<?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
								<div class="col-sm-3">
									<ul>
									  <?php foreach ($categories as $category) { ?>
									  <li><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['image']; ?>"><?php echo $category['name']; ?></a></li>
									  <?php } ?>
									</ul>
								</div>
							<?php } ?>
						</div>
					<?php }*/ ?>
				<?php } ?>
				
                <?php if ($products) { ?>
					<div class="form-group input-group input-group-sm">
						<label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
						<select id="input-sort" class="form-control" onchange="location = this.value;">
							<?php foreach ($sorts as $sorts) { ?>
							<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
							<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
					<div class="form-group input-group input-group-sm">
						<label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
						<select id="input-limit" class="form-control" onchange="location = this.value;">
							<?php foreach ($limits as $limits) { ?>
							<?php if ($limits['value'] == $limit) { ?>
							<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
				
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
                
                <?php echo $pagination; ?>
                                    
                <?php if ($description_bottom) { ?>
                <div class="seo-text">
                    <?php echo $description_bottom; ?>
                </div>
                <?php } ?>
                
            </section>
        </div>
    </div>
	
<?php echo $footer; ?>
