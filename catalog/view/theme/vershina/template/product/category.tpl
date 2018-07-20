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
