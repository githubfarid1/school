<style>
    /*carousel2_image.tpl*/
    .cards-wrapper {
        display: flex;
        justify-content: center;
    }

    .card img {
        max-width: 100%;
        max-height: 100%;
    }

    .card {
        margin: 0 0.5em;
        box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
        border: none;
        border-radius: 0;
    }

    .carousel-inner {
        padding: 1em;
    }

    .carousel-control-prev,
    .carousel-control-next {
        background-color: #e1e1e1;
        width: 5vh;
        height: 5vh;
        border-radius: 50%;
        top: 50%;
        transform: translateY(-50%);
    }

    @media (min-width: 768px) {
        .card img {
            height: 11em;
        }
    }
</style>
<?php if (!empty($images)) { ?>
    <div class="row">
        <div class="col-md-<?= $screen_size; ?>">
            <h3><strong><?= $text_header; ?></strong></h3>
            <div id="<?= $div_id; ?>" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <?php
                    $isFirst = true;
                    $isBlock = true;
                    $counter = 0;
                    $check = 0;
                    $wClosed = false;
                    ?>
                    <?php foreach ($images as $image) { ?>
                        <?php
                        $check++;
                        if ($isBlock) {
                            $wClosed = true;
                            echo '<div class="carousel-item' . ($isFirst ? ' active' : '') . '"><div class="cards-wrapper">';
                        }
                        ?>
                        <div class="card <?= $check <> 1 ?  'd-none d-md-block' : ''; ?>">
                            <img src="<?= $image['photo']; ?>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h4 class="card-title"><strong><?= $image['image_name']; ?></strong></h4>
                                <p class="card-text"><small class="text-muted"><?= $image['image_description']; ?></small></p>

                            </div>
                        </div>

                        <?php $counter++;
                        $isFirst = false;
                        $isBlock = false;
                        $countImage = $isMobile ? 1 : 4;
                        if ($check == $countImage) {
                            $isBlock = true;
                            $check = 0;
                            $wClosed = false;
                            echo '</div></div>';
                        } ?>
                    <?php } ?>
                    <?php if ($wClosed) {
                        echo '</div></div>';
                    } ?>

                </div>
                <!--control-->
                <a class="carousel-control-prev" href="#<?= $div_id; ?>" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#<?= $div_id; ?>" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>

            </div>

        </div>

    </div>

<?php } ?>
