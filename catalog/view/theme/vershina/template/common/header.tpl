<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<!-- SCRIPTS -->
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.dotdotdot/3.2.2/jquery.dotdotdot.js"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.js"></script>
<script src="catalog/view/theme/vershina/js/common.js" type="text/javascript"></script>
<script src="catalog/view/theme/vershina/js/jquery.inputmask.bundle.min.js" type="text/javascript"></script>

<!-- STYLES -->
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.3.5/jquery.fancybox.min.css" />
<link rel="stylesheet" href="catalog/view/theme/vershina/stylesheet/stylesheet.css">
<link rel="stylesheet" href="catalog/view/theme/vershina/stylesheet/media.css">

<!-- YANDEX MAPS -->
<script src="http://api-maps.yandex.ru/2.1/?lang=ru_RU" type="text/javascript"></script>

<!-- OTHER -->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>
	<header>
        <div class="container-fluid header-top">
            <div class="container-fluid registrate">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
							<?php if ($logged) { ?>
                            <p><?php echo $text_greeting; ?> <span><?php echo $customer; ?></span></p>
                            <div class="autorise">
                                <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                                <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                                <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a>
                                <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
                            </div>
							<?php } else { ?>
							<div class="autorise">
								<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
								<a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
							</div>
							<?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-2 logo">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>">
								<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
								<span><?php echo $slogan; ?></span>
							</a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><?php echo $name; ?><span><?php echo $slogan; ?></span></a>
						<?php } ?>
                    </div>
                    <div class="col-md-2 collback">
                        <a href="#call-to-me" class="w-button">Обратный звонок</a>
                    </div>
                    <div class="col-md-4 header-info">
                        <span><i class="material-icons">domain</i><?php echo $info_a; ?></span>
						<span><i class="material-icons">local_shipping</i><?php echo $info_b; ?></span>
						<p><?php echo $open; ?></p>
                    </div>
                    <div class="col-md-2 header-contacts">
						<span><?php echo $address; ?></span>
						<a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
						<a href="tel:<?php echo $fax; ?>"><?php echo $fax; ?></a>
                    </div>
					
                    <?php echo $cart; ?>
					
                </div>
            </div>
        </div>
        <div class="container-fluid menu">
            <div class="container">
                <div class="row">
                    <ul class="col-md-12">
                       <?php foreach ($categories as $category) { ?>
						<?php if ($category['children']) { ?>
						<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
							<div class="dropdown-menu">
								<div class="dropdown-inner">
									<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
									<ul class="list-unstyled">
										<?php foreach ($children as $child) { ?>
										<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
										<?php } ?>
									</ul>
									<?php } ?>
								</div>
								<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
						</li>
						<?php } else { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
						<?php } ?>
						<?php } ?>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="sticky-bucket">
        <a href="<?php echo $sticky_cart; ?>">
            <i class="material-icons">local_grocery_store</i> <span class="items-cart" id="cart-total"><?php echo $text_items; ?></span>
        </a>
    </div>
	<div class="sticky-contact-us">
        <a href="#call-to-me">
            <img src="catalog/view/theme/vershina/image/contact_us.png">
        </a>
    </div>
    <div class="container">
        <div class="row">