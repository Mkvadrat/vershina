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
                                <a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a>
                                <a href="tel:<?php echo $fax; ?>"><?php echo $fax; ?></a>
                            </div>
                            <p><?php echo $open; ?></p>
                            <a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a>
                            <p><?php echo $address; ?></p>
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
                    <label for="phone">Телефон*: <input name="phone" value="<?php echo $phone; ?>" id="phone" class="phone" type="text" placeholder="+ 7 (___) - ___ - __ - __"></label>
                    <label for="question">Вопрос: <textarea name="enquiry" cols="30" rows="5" placeholder="Ваш вопрос"></textarea></label>
                    <label><input type="checkbox"> я согласен (согласна) с <a href="#">политикой конфиденциальности</a></label>
                    <button type="submit">Отправить</button>
                </form>
            </div>
            
        </div>
    </footer>
</body>
</html>