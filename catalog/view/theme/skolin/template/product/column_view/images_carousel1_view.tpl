<?php if (!empty($images)) { ?>
    <div class="row">
        <div class="col-md-<?= $screen_size; ?>">
            <div class="carousel-container position-relative">
                <!-- Sorry! Lightbox doesn't work - yet. -->
                <div id="myCarousel<?= $div_id; ?>" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <?php $ke = 0;
                        $isFirst = true; ?>
                        <?php foreach ($images as $image) { ?>
                            <div class="carousel-item <?= $isFirst ? 'active' : ''; ?>" data-slide-number="<?= $ke; ?>">
                                <img src="<?= $image['postcard']; ?>" class="d-block w-100" alt="..." data-remote="<?= $image['postcard']; ?>" data-type="image" data-toggle="lightbox" data-gallery="example-gallery">
                            </div>
                            <?php $ke++;
                            $isFirst = false;
                            ?>
                        <?php } ?>
                    </div>
                </div>

                <!-- Carousel Navigation -->
                <div id="carousel-thumbs" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <?php
                        $ke = 0;
                        $check = 0;
                        $isFirst = true;
                        $carItem = true;
                        $wClosed = false;
                        ?>

                        <?php foreach ($images as $image) { ?>
                            <?php
                            $check++;
                            if ($carItem) {
                                $wClosed = true;
                                echo '<div class="carousel-item ' .  ($isFirst ? 'active' : '') . '">';
                                echo '<div class="row mx-0">';
                            } ?>
                            <div id="carousel-selector-<?= $ke; ?>" class="thumb col-4 col-sm-2 px-1 py-2 <?= isFirst ? 'selected' : ''; ?>" data-target="#myCarousel<?= $div_id; ?>" data-slide-to="<?= $ke; ?>">
                                <img src="<?= $image['thumbpostcard']; ?>" class="img-fluid" alt="...">
                            </div>
                            <?php $ke++;
                            $isFirst = false;
                            $carItem = false;
                            $countImage = $isMobile ? 3 : 6;
                            if ($check == $countImage) {
                                $carItem = true;
                                $check = 0;
                                $wClosed = false;
                                echo '</div></div>';
                            } ?>

                        <?php } ?>
                        <?php if ($wClosed) {
                            echo '</div></div>';
                        } ?>

                        <a class="carousel-control-prev" href="#carousel-thumbs" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carousel-thumbs" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
