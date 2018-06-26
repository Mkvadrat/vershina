<?php echo $header; ?>
    
    <div class="container">
        <div class="row">
            
            <?php echo $column_left; ?>

            <?php if ($column_left) { ?>
            <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            
            <section class="<?php echo $class; ?> contacts">
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
                    <h1 class="title"><?php echo $heading_title; ?></h1>
                    <p><strong><?php echo $text_error; ?></strong></p>
                    <p><a href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a></p>
                </div>
            </section>
        </div>
    </div>
    
<?php echo $footer; ?>
