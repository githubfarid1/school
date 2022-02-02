<div class="d-none d-md-block mt-5">
    <div class="row  align-items-center">
        <div class="col-md-1">
            <img class="mx-auto d-block" src="<?= $logo; ?>" alt="">
        </div>
        <div class="col-md-7">
            <h3><?= $school_name; ?></h3>
            <p><i class="fas fa-map-marker-alt" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
        </div>
        <div class="col-md-2">
            <p><i class="fas fa-medal"></i> Akreditasi: <?= $akreditasi; ?></p>
            <p><i class="fas fa-thumbs-up"></i> <?= $likes; ?> Likes</p>
            <p><i class="fas fa-star"></i> <?= $review; ?></p>
        </div>
        <div class="col-md-2">
            <img class="mx-auto d-block" src="<?= $qrcode; ?>" alt="">
        </div>

    </div>
    <div class="row align-items-center mt-2">

        <div class="col-md-8">
            <a href="<?= $daftar;?>"><button type="button" class="btn btn-success btn-lg">Daftar</button></a>
            <?php if (isset($download1)) { ?>
                <a href="<?= $download1; ?>" target="_new"><button type="button" class="btn btn-primary btn-lg"><?= isset($download2) ? 'Brosur Depan' : 'Download Brosur'; ?></button></a>
            <?php } ?>
            <?php if (isset($download2)) { ?>
                <a href="<?= $download2; ?>" target="_new"><button type="button" class="btn btn-primary btn-lg">Brosur Belakang</button></a>
            <?php } ?>

        </div>
    </div>
</div>
<div class="d-sm-block d-md-none">
    <div class="row align-items-center">
        <div class="col-3">
            <img src="<?= $logo; ?>" alt="" class="img-fluid">
        </div>
        <div class="col-9">
            <h3><?= $school_name; ?></h3>
        </div>

    </div>
    <div class="row mt-1">
        <div class="col-12">
        <i class="fas fa-search-location" style="font-size: 24px;"></i><p class="text-center font-italic">&nbsp;<?= $address; ?></p>
        </div>

    </div>
    <div class="row">
        <div class="col-6">
            <p><i class="fas fa-medal"></i> Akreditasi:<?= $akreditasi; ?></p>
            <p><i class="fas fa-thumbs-up"></i> 400 Likes</p>
            <p><i class="fas fa-star"></i> 9.0</p>
        </div>
        <div class="col-6">
            <img src="<?= $qrcode; ?>" alt="">
        </div>

    </div>
    <div class="row">
        <div class="col-12">
            <a href="<?= $daftar;?>"><button type="button" class="btn btn-success btn-sm">Daftar</button></a>
            <?php if (isset($download1)) { ?>
                <a href="<?= $download1; ?>" target="_new"><button type="button" class="btn btn-primary btn-sm"><?= isset($download2) ? 'Brosur Depan' : 'Download Brosur'; ?></button></a>
            <?php } ?>
            <?php if (isset($download2)) { ?>
                <a href="<?= $download2; ?>" target="_new"><button type="button" class="btn btn-primary btn-sm">Brosur Belakang</button></a>
            <?php } ?>
        </div>

    </div>
</div>
