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
        <p><i class="fas fa-thumbs-up"></i> <?=$likes;?> Likes</p>
        <p><i class="fas fa-star"></i> <?=$review;?></p>
      </div>
      <div class="col-md-2">
        <img class="mx-auto d-block" src="<?= $qrcode; ?>" alt="">
      </div>

    </div>
    <div class="row align-items-center mt-2">
      <div class="col-md-8">
        <button type="button" class="btn btn-success btn-lg">Daftar Sekarang</button>
        <button type="button" class="btn btn-secondary btn-lg">Download Brosur</button>
      </div>

    </div>
  </div>
  <div class="d-sm-block d-md-none">
    <div class="row align-items-center">
      <div class="col-3">
        <img src="<?= $logo; ?>" alt="">
      </div>
      <div class="col-9">
        <h3><?= $school_name; ?></h3>
      </div>

    </div>
    <div class="row">
      <div class="col-12">
        <p class="text-center"><i class="fas fa-search-location" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
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
      <div class="col-6">
        <button type="button" class="btn btn-success btn-md">Daftar Sekarang</button>
      </div>
      <div class="col-6">
        <button type="button" class="btn btn-secondary btn-md">Download Brosur</button>
      </div>
    </div>

  </div>
