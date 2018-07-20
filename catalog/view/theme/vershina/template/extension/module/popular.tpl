<section class="col-md-9">
    <h1 class="title"><?php echo $heading_title; ?></h1>
    <div class="popular-list">
        <?php foreach ($products as $product) { ?>
        <div class="popular-item">
            <a class="img" href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
            </a>
            <a class="name" href="<?php echo $product['href']; ?>">
                <span>
                    <?php echo $product['name']; ?>
                </span>
            </a>
            
            <?php if ($product['price']) { ?>
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
            <?php } ?>

            <a class="more w-button" href="<?php echo $product['href']; ?>">Подробнее</a>
            <a style="cursor: pointer;" class="add-to-bucket" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fas fa-cart-plus fa-10x"></i></a>
        </div>
        <?php } ?>
    </div>
</section>
