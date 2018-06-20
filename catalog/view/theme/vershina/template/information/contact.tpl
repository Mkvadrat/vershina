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
                <h1 class="title"><?php echo $heading_title; ?></h1>
                
                <?php echo $contacts; ?>
                
                <h2 class="sub-title">Мы на карте</h2>
                <div class="map">
                    <div id="map-contacts" style="width:100%; height:100%"></div>
                    <?php if($geocode){ ?>
                      <script type="text/javascript">
                        var myMap;
                        ymaps.ready(init);
                        
                        function init(){
                          var myCoords = [<?php echo $geocode; ?>];  
                          var myGeocoder = ymaps.geocode(myCoords);
                          myGeocoder.then(
                          function (res){
                            var firstGeoObject = res.geoObjects.get(0),
                            myMap = new ymaps.Map
                            ("map-contacts",{
                              center: firstGeoObject.geometry.getCoordinates(),
                              zoom: 17
                            });
                            var myPlacemark = new ymaps.Placemark(
                            firstGeoObject.geometry.getCoordinates(),
                            {
                              iconContent: ''
                            },
                            {
                              preset: 'twirl#blueStretchyIcon'
                            });
                              myMap.geoObjects.add(myPlacemark);
                              myMap.controls.add(new ymaps.control.ScaleLine()).add('typeSelector');
                          },
                          function (err){
                            alert(err.message);
                          });
                        }
                      </script>
                    <?php } ?>	
                </div>
                <h2 class="sub-title">Обратная связь</h2>
                <div id="contact-to-me">
                    <div>
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                            <label for="name">Имя: <input name="name" value="<?php echo $name; ?>" type="text" placeholder="Введите Ваше имя"></label>
                            <label for="phone">Телефон*: <input name="phone" value="<?php echo $phone; ?>" class="phone" type="text" placeholder="+ 7 (___) - ___ - __ - __"></label>
                            <label for="phone">Email*: <input  name="email" value="<?php echo $email; ?>" type="text" placeholder="Введите Ваш e-mail"></label>
                            <label for="question">Вопрос: <textarea name="enquiry" cols="30" rows="5" placeholder="Ваш вопрос"></textarea></label>
                            <label><input type="checkbox"> я согласен (согласна) с <a href="#">политикой конфиденциальности</a></label>
                            <button type="submit">Отправить</button>
                        </form>
                    </div>
                    
                </div>
            </section>
        </div>
    </div>
    
<?php echo $footer; ?>
