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

    </footer>
</body>
</html>