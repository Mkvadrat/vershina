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
<div class="row">
<div class="col-md-6 col-sm-6">
                <p><strong>Офис и склад г. Севастополь</strong></p>
                <p>299053, г. Севастополь, ул. Вакуленчука, 33</p>
                <p><strong>Телефон:</strong> <a href="tel:+79782140140">+7 (978) 2-140-140</a>, <a href="tel:+79782130130">+7-9782-130-130</a></p>
                <p><strong>E-mail:</strong> <a href="mailto:info@vershina92.ru">info@vershina92.ru</a></p>
</div>  
<div class="col-md-6 col-sm-6">
    <div class="map">
        <div id="map-contacts-first" style="width:100%; height:100%"></div>
        <?php if($geocode){ ?>
            <script type="text/javascript">
            var myMap;
            var myMap;
            ymaps.ready(init);
            function init(){
                var myCoords = [<?php echo $geocode; ?>];  
                var myGeocoder = ymaps.geocode(myCoords);
                myGeocoder.then(
                    function (res){
                        var firstGeoObject = res.geoObjects.get(0),
                        myMap = new ymaps.Map ("map-contacts-first",{
                            center: firstGeoObject.geometry.getCoordinates(),
                            zoom: 15
                        });
                        mySecondMap = new ymaps.Map ("map-contacts-second",{
                            center: [44.932689, 34.044011],
                            zoom: 15
                        });
                        var myPlacemark = new ymaps.Placemark(
                            firstGeoObject.geometry.getCoordinates(),
                            {
                                iconContent: ''
                            },
                            {
                                preset: 'twirl#blueStretchyIcon'
                            }
                        );
                        var mySecondPlacemark = new ymaps.Placemark([44.932689, 34.044011],
                            {
                                iconContent: ''
                            },
                            {
                                preset: 'twirl#blueStretchyIcon'
                            }
                        );
                        //myMap.behaviors.disable('scrollZoom');
                        //mySecondMap.behaviors.disable('scrollZoom');
                        myMap.geoObjects.add(myPlacemark);
                        mySecondMap.geoObjects.add(mySecondPlacemark);
                        myMap.controls.add(new ymaps.control.ScaleLine()).add('typeSelector');
                        mySecondMap.controls.add(new ymaps.control.ScaleLine()).add('typeSelector');
                    },
                    function (err){
                    alert(err.message);
                });
            }
            </script>
        <?php } ?>	
    </div>
</div>  
</div>
<div class="row">
<div class="col-md-6 col-sm-6">
                <p><strong>Офис и склад г. Симферополь</strong></p>
                <p>г. Симферополь, ул. Узловая, 20</p>
                <p><strong>Телефон:</strong> <a href="tel:+79780237070">+7 (978) 023-70-70</a></p>
                <p><strong>E-mail:</strong> <a href="mailto:info@vershina92.ru">info@vershina92.ru</a></p>
</div>                  
<div class="col-md-6 col-sm-6">
    <div class="map">
        <div id="map-contacts-second" style="width:100%; height:100%"></div>
        
    </div>
</div>          
</div>       
                <p><strong>Режим работы:</strong> Пн. — Пт.: с 9-00 до 18-00 Сб.: с 9-00 до 15-00</p>
                <br>
                <p class="about-us-txt">Возведение зданий различной этажности и назначения предусматривает использование различных строительных материалов и оборудования. От качества техники во многом зависит процесс проведения работ, а также безопасность рабочих. Принимая это во внимание, компания «Вершина» предлагает купить строительное оборудование высокого качества по доступной цене. Также вы можете взять технику в аренду. Эта услуга очень актуальна в случаях, когда покупка строительного оборудования не рентабельна. Аренда позволит вам существенно сэкономить финансовые средства.</p>
            
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