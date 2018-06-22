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
                    <?php echo $description; ?>
                </div>
            </section>
        </div>
    </div>
    
<?php echo $footer; ?>