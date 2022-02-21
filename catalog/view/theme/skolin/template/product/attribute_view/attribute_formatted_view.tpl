<?php if (!empty($attribute)) { ?>
    <div class="row my-5">
        <div class="col-md-<?= $screen_size; ?>">

            <h3><strong><?= $name; ?></strong></h3>
            <div class="row  align-items-center h-100">
                <?php foreach ($attribute as $item) { ?>
                    <div class="col-md-6">
                        <div class="card bg-dark text-white">
                            <div class="row no-gutters align-items-center">
                                <?php if ($item['name'] == 'Web') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto">
                                        <center><i class="fab fa-internet-explorer" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Whatsapp') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fab fa-whatsapp" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="https://wa.me/<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Phone') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fas fa-phone" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="tel:<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Email') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="far fa-envelope" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="mailto:<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Facebook') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fab fa-facebook" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Twitter') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fab fa-twitter" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Instagram') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fab fa-instagram" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } elseif ($item['name'] == 'Tiktok') { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fab fa-tiktok" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <a href="<?= $item['text']; ?>">
                                                <h4 class="card-title"><?= $item['text']; ?></h4>
                                            </a>
                                        </div>
                                    </div>
                                <?php } else { ?>
                                    <div class="col-2 border border-left-0 border-top-0 border-bottom-0 my-auto align-items-center">
                                        <center><i class="fas fa-at" style="<?= isset($iconstyle) ? $iconstyle : ''; ?>"></i></center>&nbsp;
                                    </div>
                                    <div class="col-10">
                                        <div class="card-body">
                                            <h4 class="card-title"><?= $item['name']; ?></h4>
                                            <h5 class="card-text"><?= $item['text']; ?></h5>
                                        </div>
                                    </div>
                                <?php } ?>

                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
<?php } ?>
<p></p>
