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

				

				<div class="content"></div>

				

                <div class="product-card">

					<?php if ($thumb || $images) { ?>

					<div class="photo-gallery">

					<?php if ($thumb) { ?>

					<a data-fancybox="gallery" class="main-photo" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

					<?php } ?>

					<?php if ($images) { ?>

					<?php foreach ($images as $image) { ?>

					<a data-fancybox="gallery" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>

					<?php } ?>

					<?php } ?>

					</div>

					<?php } ?>

                  

                    <div class="product-text">

						

                        <h1 class="title"><?php echo $heading_title; ?></h1>

						

						<ul class="list-unstyled">

							<li><strong><?php echo $text_model; ?></strong> <?php echo $model; ?></li>

							<li><strong><?php echo $text_stock; ?></strong> <?php echo $stock; ?></li>

						</ul>

						

                        <div class="tabs">

                            <button class="desc active"><?php echo $tab_description; ?></button>

							<?php if($rent){ ?>

								<button class="ref"><?php echo $tab_rent; ?></button>

							<?php } ?>

							

							<div class="share">

                                <script src="//yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>

								<script src="//yastatic.net/share2/share.js"></script>

								<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir"></div>

                            </div>

                        </div>

						

                        <div class="product-description active">

                            <?php echo $description; ?>

						</div>

						

						<?php if($rent){ ?>

						<div class="product-refs">

							<?php echo $rent; ?>

                        </div>

						<?php } ?>



                        <div class="to-order">

							<div id="product">

								<label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>

								<input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />

								<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

								

								<?php if ($price) { ?>

								<?php if (!$special) { ?>

								<p class="price">Цена: <span><?php echo $price; ?></span></p>

								<?php } else { ?>

								<p class="price">Цена: <span><?php echo $special; ?></span> <strike><sup style="font-size: 50%;"><?php echo $price; ?></sup></strike></p>

								<?php } ?>

								<?php } ?>

								

								<?php if ($minimum > 1) { ?>

								<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>

								<?php } ?>

	

								<a id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="w-button"><i class="fas fa-cart-plus fa-10x"></i><?php echo $button_cart; ?></a>

								

								<?php if ($buyoneclick_status) { ?>

									<a class="w-button boc_order_btn" data-toggle="modal" data-target="#boc_order" data-backdrop="false" data-product="<?php echo $heading_title; ?>" data-product_id="<?php echo $product_id; ?>"><?php echo $buyoneclick_name; ?></a>

								<?php }	?>



								<?php if($button_rent) { ?>

									<a href="#rent-form" class="w-button rent-form">Арендовать</a>

									

									<div id="rent-form">

										<h3>Наши менеджеры свяжутся с Вами в течение 1 часа</h3>

										<div>

											<form action="<?php echo $rent_form; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">

												<label for="name">Имя: <input name="name" value="<?php echo $name; ?>" type="text" placeholder="Введите Ваше имя"></label>

												<label for="phone">Телефон*: <input name="phone" value="<?php echo $phone; ?>" class="phone" type="text" placeholder="+ 7 (___) - ___ - __ - __"></label>

												<label for="phone">Email*: <input  name="email" value="<?php echo $email; ?>" type="text" placeholder="Введите Ваш e-mail"></label>

												<label for="question">Вопрос: <textarea name="enquiry" cols="30" rows="5" placeholder="Ваш вопрос"></textarea></label>

												<label><input type="checkbox"> я согласен (согласна) с <a href="#">политикой конфиденциальности</a></label>

												<input  name="link" value="<?php echo $link; ?>" type="hidden">

												<input  name="product_name" value="<?php echo $product_name; ?>" type="hidden">

												<button type="submit">Отправить</button>

											</form>

										</div>

									</div>

								<?php } ?>

								

								<a href="<?php echo $delivery; ?>" class="w-button" target="_blank">Условия и стоимость доставки</a>

							</div>

                        </div>

                    </div>

					

					<div class="same-products">

						<?php if ($products) { ?>    

							<h2 class="sub-title"><?php echo $text_related; ?></h2>

	

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

								<a class="add-to-bucket" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fas fa-cart-plus fa-10x"></i></a>

							</div>

							<?php } ?>

						<?php } ?>

					</div>

                </div>

            </section>

        </div>

    </div>

	

	

<script type="text/javascript"><!--

$('#button-cart').on('click', function() {

	$.ajax({

		url: 'index.php?route=checkout/cart/add',

		type: 'post',

		data: $('#product input[type=\'text\'], #product input[type=\'hidden\']'),

		dataType: 'json',

		success: function(json) {

			$('.alert, .text-danger').remove();

			$('.form-group').removeClass('has-error');



			if (json['error']) {

				// Highlight any found errors

				$('.text-danger').parent().addClass('has-error');

			}



			if (json['success']) {

				$('.content').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');



				$('.items-cart').html(json['total']);



				$('html, body').animate({ scrollTop: 0 }, 'slow');

			}

		},

        error: function(xhr, ajaxOptions, thrownError) {

            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);

        }

	});

});

//--></script>

			

<?php echo $footer; ?>

