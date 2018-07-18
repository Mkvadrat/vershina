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
                
                <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
                <?php } ?>
                
                <div class="text-page">
                    <h1 class="title"><?php echo $heading_title; ?></h1>

                    <ul class="list-unstyled">
                        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                        <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                    </ul>
                    
                    <h2><?php echo $text_my_orders; ?></h2>
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                    </ul>
                    
                    <h2><?php echo $text_my_newsletter; ?></h2>
                    
                    <ul class="list-unstyled">
                        <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
  
<?php echo $footer; ?> 