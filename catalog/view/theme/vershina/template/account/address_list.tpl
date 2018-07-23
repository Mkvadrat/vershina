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

                    <?php if ($addresses) { ?>
                    <div class="table-responsive">
                      <table class="table table-bordered table-hover">
                        <?php foreach ($addresses as $result) { ?>
                        <tr>
                          <td class="text-left"><?php echo $result['address']; ?></td>
                          <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
                        </tr>
                        <?php } ?>
                      </table>
                    </div>
                    <?php } else { ?>
                    <p><?php echo $text_empty; ?></p>
                    <?php } ?>
                    <div class="buttons clearfix">
                      <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                      <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
                    </div>
                </div>
            </section>
        </div>
    </div>

<?php echo $footer; ?>