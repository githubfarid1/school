<?php if (!empty($items)) { ?>
    <h3><strong><?= $text_header; ?></strong></h3>
    <div class="row  align-items-center h-100">
        <?php foreach ($items as $item) { ?>
            <div class="col-md-6">
                <div class="card mb-3 bg-dark text-white">
                    <div class="row no-gutters align-items-center">
                        <?php if ($item['label'] == 'Web') { ?>
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
                        <?php } elseif ($item['label'] == 'Whatsapp') { ?>
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
                        <?php } elseif ($item['label'] == 'Phone') { ?>
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
                        <?php } elseif ($item['label'] == 'Email') { ?>
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
                            <?php } elseif ($item['label'] == 'Facebook') { ?>
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
                            <?php } elseif ($item['label'] == 'Twitter') { ?>
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
                            <?php } elseif ($item['label'] == 'Instagram') { ?>
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
                            <?php } elseif ($item['label'] == 'Tiktok') { ?>
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
                                    <h4 class="card-title"><?= $item['label']; ?></h4>
                                    <h5 class="card-text"><?= $item['text']; ?></h5>
                                </div>
                            </div>
                        <?php } ?>

                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
<?php } ?>
