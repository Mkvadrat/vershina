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

                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                  <td class="text-left" colspan="2"><?php echo $text_return_detail; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
                                  <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
                                <td class="text-left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
                                  <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3><?php echo $text_product; ?></h3>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_product; ?></td>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_model; ?></td>
                                <td class="text-right" style="width: 33.3%;"><?php echo $column_quantity; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                              <td class="text-left"><?php echo $product; ?></td>
                              <td class="text-left"><?php echo $model; ?></td>
                              <td class="text-right"><?php echo $quantity; ?></td>
                          </tr>
                        </tbody>
                    </table>
                    </div>
                    <h3><?php echo $text_reason; ?></h3>
                    <div class="table-responsive">
                    <table class="list table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_reason; ?></td>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_opened; ?></td>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_action; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-left"><?php echo $reason; ?></td>
                                <td class="text-left"><?php echo $opened; ?></td>
                                <td class="text-left"><?php echo $action; ?></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <?php if ($comment) { ?>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td class="text-left"><?php echo $text_comment; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-left"><?php echo $comment; ?></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>
                    <?php } ?>
                    <h3><?php echo $text_history; ?></h3>
                    <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_date_added; ?></td>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_status; ?></td>
                                <td class="text-left" style="width: 33.3%;"><?php echo $column_comment; ?></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($histories) { ?>
                            <?php foreach ($histories as $history) { ?>
                            <tr>
                                <td class="text-left"><?php echo $history['date_added']; ?></td>
                                <td class="text-left"><?php echo $history['status']; ?></td>
                                <td class="text-left"><?php echo $history['comment']; ?></td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td colspan="3" class="text-center"><?php echo $text_no_results; ?></td>
                            </tr>
                          <?php } ?>
                        </tbody>
                      </table>
                    </div>
                    <div class="buttons clearfix">
                        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    
<?php echo $footer; ?>
