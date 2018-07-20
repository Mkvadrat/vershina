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

                              zoom: 8

                            });

                            var myPlacemark = new ymaps.Placemark(

                            firstGeoObject.geometry.getCoordinates(),

                            {

                              iconContent: ''

                            },

                            {

                              preset: 'twirl#blueStretchyIcon'

                            });

                            var mySecondPlacemark = new ymaps.Placemark([44.932689, 34.044011],
                            {
                              iconContent: ''
                            },
                            {
                              preset: 'twirl#blueStretchyIcon'
                            });

                              myMap.behaviors.disable('scrollZoom');

                              myMap.geoObjects.add(myPlacemark);
                              myMap.geoObjects.add(mySecondPlacemark);

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

                            <label for="phone">Телефон*: <input name="phone" value="<?php echo $phone; ?>" class="phone" type="text" placeholder="+ 7 (___) - ___ - ____"></label>

                            <label for="phone">Email*: <input  name="email" value="<?php echo $email; ?>" type="text" placeholder="Введите Ваш e-mail"></label>

                            <label for="question">Вопрос: <textarea name="enquiry" cols="30" rows="5" placeholder="Ваш вопрос"></textarea></label>

                            <label><span class="check-arrow" style="display: none;"></span><input type="checkbox"> я согласен (согласна) с <a href="/index.php?route=information/information&information_id=3">политикой конфиденциальности</a></label>

                            <button type="submit">Отправить</button>

                        </form>

                    </div>

                    

                </div>

            </section>

        </div>

    </div>

    

<?php echo $footer; ?>

