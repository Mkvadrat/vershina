            </div>
        </div>
        <footer>
            <div class="container-fluid footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2 menu">
                            <ul>
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
                        
                        <?php if(!empty($footer_categories)){ ?>
                        <?php $sectionsCols = array_chunk($footer_categories, ceil(count($footer_categories) / 3)); ?> 
                        <?php } ?> 
                        <div class="col-md-2 services">
                            <?php if(!empty($sectionsCols[0])){?>		
                                <ul>
                                <?php foreach($sectionsCols[0] as $footer_category){ ?>
                                    <li><a href="<?php echo $footer_category['href']; ?>"><?php echo $footer_category['name']; ?></a></li>
                                <?php } ?> 
                                </ul>
                            <?php } ?>
                        </div>
                        <div class="col-md-2 services">
                            <?php if(!empty($sectionsCols[1])){?>		
                                <ul>
                                <?php foreach($sectionsCols[1] as $footer_category){ ?>
                                    <li><a href="<?php echo $footer_category['href']; ?>"><?php echo $footer_category['name']; ?></a></li>
                                <?php } ?> 
                                </ul>
                            <?php } ?>
                        </div>
                        <div class="col-md-3 services">
                            <?php if(!empty($sectionsCols[2])){?>		
                                <ul>
                                <?php foreach($sectionsCols[2] as $footer_category){ ?>
                                    <li><a href="<?php echo $footer_category['href']; ?>"><?php echo $footer_category['name']; ?></a></li>
                                <?php } ?> 
                                </ul>
                            <?php } ?>
                        </div>
                        <div class="col-md-3 footer-info">
                            <div>
                                <div class="tels">
                                    <p><?php echo $address; ?></p>
                                    <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
                                    <p><?php echo $city; ?></p> <!-- тут тоже должен быть другой город -->
                                    <a href="tel:<?php echo $fax; ?>"><?php echo $fax; ?></a>
                                </div>
                                <p><?php echo $open; ?></p>
                                <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mega-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <?php echo $info_c; ?>
                        </div>
                        <div class="col-md-5">
                            <div class="socials">
                                <?php echo $soc_links; ?>
                            </div>
                            <span class="made-with">Сделано в <a href="#"><img src="catalog/view/theme/vershina/image/m2.png" alt=""></a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="call-to-me">
                <h3>Наши менеджеры свяжутся с Вами в течении 1 часа</h3>
                <div>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                        <label for="name">Имя: <input name="name" value="<?php echo $name; ?>" type="text" placeholder="Введите Ваше имя"></label>
                        <label for="phone">Телефон*: <input name="phone" value="<?php echo $phone; ?>" id="phone" class="phone" type="text" placeholder="+ 7 (___) - ___ - ____"></label>
                        <label for="question">Вопрос: <textarea name="enquiry" cols="30" rows="5" placeholder="Ваш вопрос"></textarea></label>
                        <label class="choose"><span class="check-arrow" style="display: none;"></span><input type="checkbox"> я согласен (согласна) с <a href="#">политикой конфиденциальности</a></label>
                        <button type="submit">Отправить</button>
                    </form>
                </div>
            </div>
        </footer>
        
        <?php if ($buyoneclick_status) { ?>
            <div id="boc_order" class="modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="boc_form" action="" role="form">
                            <fieldset>
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal">×</button>
                            <h2 id="boc_order_title" class="modal-title"><?php echo $buyoneclick_title; ?></h2>
                        </div>
                        <div class="modal-body">
                            <div id="boc_product_field" class="col-xs-12"></div>
                            <div class="col-xs-12"><hr /></div>
                            <div class="col-xs-12">
                                <div style="display:none">
                                    <input id="boc_admin_email" type="text" name="boc_admin_email" value="<?php echo $buyoneclick_admin_email; ?>">
                                </div>
                                <div style="display:none">
                                    <input id="boc_product_id" type="text" name="boc_product_id">
                                </div>
                                <?php if ($buyoneclick_field1_status) { ?>
                                    <div class="input-group<?php if ($buyoneclick_field1_required) { echo ' has-warning';} ?>">
                                        <span class="input-group-addon"><i class="fa fa-fw fa-user" aria-hidden="true"></i></span>
                                        <input id="boc_name" class="form-control<?php if ($buyoneclick_field1_required) { echo ' required';} ?>" type="text" name="boc_name" placeholder="<?php echo $buyoneclick_field1_title; ?>">
                                    </div>
                                    <br />
                                <?php } ?>
                                <?php if ($buyoneclick_field2_status) { ?>
                                    <div class="input-group<?php if ($buyoneclick_field2_required) { echo ' has-warning';} ?>">
                                        <span class="input-group-addon"><i class="fa fa-fw fa-phone-square" aria-hidden="true"></i></span>
                                        <input id="boc_phone" class="form-control<?php if ($buyoneclick_field2_required) { echo ' required';} ?> phone" type="tel" name="boc_phone" placeholder="<?php if ($buyoneclick_validation_status) { echo $buyoneclick_validation_type; } else { echo $buyoneclick_field2_title; } ?>"<?php if ($buyoneclick_validation_status) {echo ' data-pattern="true"';} else {echo ' data-pattern="false"';} ?>>
                                    </div>
                                    <br />
                                <?php } ?>
                                <?php if ($buyoneclick_field3_status) { ?>
                                    <div class="input-group<?php if ($buyoneclick_field3_required) { echo ' has-warning';} ?>">
                                        <span class="input-group-addon"><i class="fa fa-fw fa-envelope" aria-hidden="true"></i></span>
                                        <input id="boc_email" class="form-control<?php if ($buyoneclick_field3_required) { echo ' required';} ?>" type="email" name="boc_email" placeholder="<?php echo $buyoneclick_field3_title; ?>">
                                    </div>
                                    <br />
                                <?php } ?>
                                <?php if ($buyoneclick_field4_status) { ?>
                                    <div class="form-group<?php if ($buyoneclick_field4_required) { echo ' has-warning';} ?>">
                                        <textarea id="boc_message" class="form-control<?php if ($buyoneclick_field4_required) { echo ' required';} ?>" name="boc_message" rows="3" placeholder="<?php echo $buyoneclick_field4_title; ?>" ></textarea>
                                    </div>
                                <?php } ?>
                                <?php if ($buyoneclick_agree_status !=0) { ?>
                                    <div class="checkbox">
                                        <label>
                                            <input id="boc_agree" type="checkbox" name="boc_agree" class="required" value="1"> <?=$buyoneclick_text_agree;?>
                                        </label>
                                    </div>
                                <?php } ?>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-sm-2 hidden-xs">
                            </div>
                            <div class="col-sm-8 col-xs-12">
                                <button type="submit" id="boc_submit" class="btn btn-lg btn-block btn-default"><?php echo $buyoneclick_button_order; ?></button>
                            </div>
                            <div class="col-sm-2 hidden-xs">
                            </div>
                        </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div id="boc_success" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="text-center"><?php echo $buyoneclick_success_field; ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript"><!--
            $('.boc_order_btn').on('click', function() {
                $.ajax({
                    url: 'index.php?route=common/buyoneclick/info',
                    type: 'post',
                    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                    success: function(data) {
                        //console.log(data);
                        $('#boc_product_field').html(data);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });			
            //--></script>
        <?php } ?>
    </div>
</body>
</html>