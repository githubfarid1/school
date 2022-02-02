<?php if (!empty($attribute)) { ?>

    <style>
        .ticker {
            display: flex;
            flex-wrap: nowrap;
            width: 100%;
            height: 50px;
            margin: 0 auto;
        }

        .news {
            width: 100%;
            padding: 0 2%;
        }


        .title h5 {
            font-size: 18px;
            margin: 8% 0;
        }

        .news marquee {
            font-size: 18px;
            margin-top: 12px;
        }

        .news-content p {
            margin-right: 41px;
            display: inline;
            color: #50bfe2;
        }

        .news-content p:after {
            position: absolute;
            content: "";
            border-left: 13px solid #ffc107;
            border-top: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 10px solid transparent;
            top: 0px
        }
    </style>
    <div class="row">
        <div class="col-md-<?= $screen_size; ?>">

            <div class="ticker mb-3">
                <div class="news">
                    <marquee class="news-content">
                        <?php foreach ($attribute as $item) { ?>
                            <p><?= $item['text']; ?>&nbsp;&nbsp;&nbsp;</p>
                        <?php } ?>
                    </marquee>
                </div>
            </div>
        </div>
    </div>
<?php } ?>
