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
                    <h1 class="title"><?php echo $heading_title; ?></h1>
                    
                    <?php if ($orders) { ?>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td class="text-right"><?php echo $column_order_id; ?></td>
                                    <td class="text-left"><?php echo $column_customer; ?></td>
                                    <td class="text-right"><?php echo $column_product; ?></td>
                                    <td class="text-left"><?php echo $column_status; ?></td>
                                    <td class="text-right"><?php echo $column_total; ?></td>
                                    <td class="text-left"><?php echo $column_date_added; ?></td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($orders as $order) { ?>
                                <tr>
                                    <td class="text-right">#<?php echo $order['order_id']; ?></td>
                                    <td class="text-left"><?php echo $order['name']; ?></td>
                                    <td class="text-right"><?php echo $order['products']; ?></td>
                                    <td class="text-left"><?php echo $order['status']; ?></td>
                                    <td class="text-right"><?php echo $order['total']; ?></td>
                                    <td class="text-left"><?php echo $order['date_added']; ?></td>
                                    <td class="text-right"><a href="<?php echo $order['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                    </div>
                    <?php } else { ?>
                        <p><?php echo $text_empty; ?></p>
                    <?php } ?>
                    <div class="buttons clearfix">
                        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                    </div>        
                </div>
            </section>
        </div>
    </div>
        
<?php echo $footer; ?>
