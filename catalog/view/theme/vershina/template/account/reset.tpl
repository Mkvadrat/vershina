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

                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                        <fieldset>
                          <legend><?php echo $text_password; ?></legend>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                            <div class="col-sm-10">
                              <input type="password" name="password" value="<?php echo $password; ?>" id="input-password" class="form-control" />
                              <?php if ($error_password) { ?>
                              <div class="text-danger"><?php echo $error_password; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                            <div class="col-sm-10">
                              <input type="password" name="confirm" value="<?php echo $confirm; ?>" id="input-confirm" class="form-control" />
                              <?php if ($error_confirm) { ?>
                              <div class="text-danger"><?php echo $error_confirm; ?></div>
                              <?php } ?>
                            </div>
                          </div>
                        </fieldset>
                        <div class="buttons clearfix">
                          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                          <div class="pull-right"><button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> <?php echo $button_continue; ?></button></div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
     
<?php echo $footer; ?>