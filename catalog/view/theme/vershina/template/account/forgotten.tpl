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
                
                <?php if ($error_warning) { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
                <?php } ?>
                
                <div class="text-page">
                    <h1 class="title"><?php echo $heading_title; ?></h1>

                    <p><?php echo $text_email; ?></p>
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                      <fieldset>
                        <legend><?php echo $text_your_email; ?></legend>
                        <div class="form-group required">
                          <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                          <div class="col-sm-10">
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                          </div>
                        </div>
                      </fieldset>
                      <div class="buttons clearfix">
                        <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                        <div class="pull-right">
                          <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                        </div>
                      </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
    
<?php echo $footer; ?>