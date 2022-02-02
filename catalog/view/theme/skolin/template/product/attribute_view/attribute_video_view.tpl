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

    video {
        opacity: 0.5;
    }
</style>
<?php if (!empty($items)) { ?>
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
            <?php foreach ($items as $item) { ?>
                <?php
                $check++;
                if ($isBlock) {
                    $wClosed = true;
                    echo '<div class="carousel-item' . ($isFirst ? ' active' : '') . '"><div class="cards-wrapper">';
                }
                ?>
                <div class="card <?= $check <> 1 ?  'd-none d-md-block' : ''; ?>" style="max-width: 250px;">
                    <?php
                    // get title
                    $url = explode("|", $item['text']);
                    if (isset($url[1])) {
                        $title = $url[1];
                    } else {
                        $title = '';
                    }
                    $utube = preg_match('/[\\?\\&]v=([^\\?\\&]+)/', $url[0], $url_match); // code to convert video url into embed code
                    //print_r($url_match);

                    $embed_url = 'https://www.youtube.com/embed/' . $url_match[1];
                    ?>
                    <iframe class="card-img-top" src="<?php echo $embed_url; ?>" allowfullscreen></iframe>
                    <div class="card-body">
                        <h4 class="card-title"><center><?php echo $title; ?></center></h4>

                    </div>
                </div>

                <?php $counter++;
                $isFirst = false;
                $isBlock = false;
                $countImage = $isMobile ? 1 : 3;
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

<?php } ?>
