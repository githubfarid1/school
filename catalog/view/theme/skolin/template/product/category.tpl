<?php echo $header; ?>
<div class="container">
    <?= $breadcrumbs; ?>
</div>
<div class="container alert alert-warning">
    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
            <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <h1>
                <?php //echo $heading_title;
                ?>
            </h1>
            <?php if ($thumb || $description) { ?>
                <div class="row">
                    <?php if ($thumb) { ?>
                        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
                    <?php } ?>
                    <?php if ($description) { ?>
                        <div class="col-sm-10">
                            <?php echo $description; ?>
                        </div>
                    <?php } ?>
                </div>
                <hr>
            <?php } ?>
            <?php if ($categories) { ?>
                <h3>
                    <?php //echo $text_refine;
                    ?>
                </h3>
                <div class="d-none d-md-block">
                    <div class="row" style="background: url('image/catalog/front.png'); min-height: 750px;">
                        <div class="col-md-6 mt-5">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>
                                    <h1 style="color: #ffffff;">Cara Mudah</h1>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                </div>
                                <div class="col-md-10">
                                    <h2 style="color: #ffffff;">Mencari Sekolah</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <?php foreach ($categories as $category) { ?>
                                    <div class="col-sm-6" style="margin-top: 35px;">
                                        <!--<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>-->
                                        <div class="card" style="padding: 10px;  background-color: rgba(245, 245, 245, 1);opacity: .5;">
                                            <div class="card-body">
                                                <h3 class="card-title" style="text-align: center;"><a href="<?php echo $category['href']; ?>">
                                                        <?php echo $category['name']; ?>
                                                    </a></h3>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>

                            </div>

                        </div>
                    </div>
                </div>


                <div class="d-sm-block d-md-none">
                    <div class="row">
                        <?php foreach ($categories as $category) { ?>
                            <div class="col-6" style="margin-top: 35px;">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 class="card-title" style="text-align: center;"><a href="<?php echo $category['href']; ?>">
                                                <?php echo $category['name']; ?>
                                            </a></h3>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>

                    </div>

                </div>

            <?php } ?>
            <?php if ($products) { ?>
                <div class="row">
                    <div class="col-md-5 col-sm-12 hidden-xs">
                    </div>
                    <div class="col-md-4 col-xs-6">
                        <div class="form-group input-group input-group-sm">
                            <label class="input-group-addon" for="input-sort">
                                <?php echo $text_sort; ?>
                            </label>
                            <select id="input-sort" class="form-control" onchange="location = this.value;">
                                <?php foreach ($sorts as $sorts) { ?>
                                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                        <option value="<?php echo $sorts['href']; ?>" selected="selected">
                                            <?php echo $sorts['text']; ?>
                                        </option>
                                    <?php } else { ?>
                                        <option value="<?php echo $sorts['href']; ?>">
                                            <?php echo $sorts['text']; ?>
                                        </option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6">
                        <div class="form-group input-group input-group-sm">
                            <label class="input-group-addon" for="input-limit">
                                <?php echo $text_limit; ?>
                            </label>
                            <select id="input-limit" class="form-control" onchange="location = this.value;">
                                <?php foreach ($limits as $limits) { ?>
                                    <?php if ($limits['value'] == $limit) { ?>
                                        <option value="<?php echo $limits['href']; ?>" selected="selected">
                                            <?php echo $limits['text']; ?>
                                        </option>
                                    <?php } else { ?>
                                        <option value="<?php echo $limits['href']; ?>">
                                            <?php echo $limits['text']; ?>
                                        </option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <?= $products; ?>
                </div>
                <div class="row">
                    <div class="col-sm-6 text-left">
                        <?php echo $pagination; ?>
                    </div>
                    <div class="col-sm-6 text-right">
                        <?php echo $results; ?>
                    </div>
                </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
                <p>
                    <?php echo $text_empty; ?>
                </p>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary">
                            <?php echo $button_continue; ?>
                        </a></div>
                </div>
            <?php } ?>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
