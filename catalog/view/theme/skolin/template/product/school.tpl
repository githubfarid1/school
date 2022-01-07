<?php echo $header; ?>
<style>
  .carousel {
    position: relative;
  }

  .carousel-item img {
    object-fit: cover;
  }

  #carousel-thumbs {
    background: rgba(255, 255, 255, .3);
    bottom: 0;
    left: 0;
    padding: 0 50px;
    right: 0;
  }

  #carousel-thumbs img {
    border: 5px solid transparent;
    cursor: pointer;
  }

  #carousel-thumbs img:hover {
    border-color: rgba(255, 255, 255, .3);
  }

  #carousel-thumbs .selected img {
    border-color: #fff;
  }

  .carousel-control-prev,
  .carousel-control-next {
    width: 50px;
  }

  @media all and (max-width: 767px) {
    .carousel-container #carousel-thumbs img {
      border-width: 3px;
    }
  }

  @media all and (min-width: 576px) {
    .carousel-container #carousel-thumbs {
      position: absolute;
    }
  }

  @media all and (max-width: 576px) {
    .carousel-container #carousel-thumbs {
      background: #ccccce;
    }
  }
</style>
<div class="container">
  <!-- <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if (isset($breadcrumb['active']) && $breadcrumb['active']) { ?>
          <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
        <?php } else { ?>
          <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      <?php } ?>
    </ol>
  </nav> -->
  <?=$breadcrumbs;?>
  <div class="row mb-5 mt-4">
    <div class="carousel-container position-relative">
      <!-- Sorry! Lightbox doesn't work - yet. -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <?php $ke = 0;
          $isFirst = true; ?>
          <?php foreach ($images as $image) { ?>
            <div class="carousel-item <?= $isFirst ? 'active' : ''; ?>" data-slide-number="<?= $ke; ?>">
              <img src="<?= $image['popup']; ?>" class="d-block w-100" alt="..." data-remote="<?= $image['popup']; ?>" data-type="image" data-toggle="lightbox" data-gallery="example-gallery">
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
          ?>

          <?php foreach ($images as $image) { ?>
            <?php
            $check++;
            if ($carItem) { ?>
              <div class="carousel-item <?= $isFirst ? 'active' : ''; ?>">
                <div class="row mx-0">
                <?php } ?>
                <div id="carousel-selector-<?= $ke; ?>" class="thumb col-4 col-sm-2 px-1 py-2 <?= isFirst ? 'selected' : ''; ?>" data-target="#myCarousel" data-slide-to="<?= $ke; ?>">
                  <img src="<?= $image['thumb']; ?>" class="img-fluid" alt="...">
                </div>
                <?php $ke++;
                $isFirst = false;
                $carItem = false; ?>
                <?php
                $countImage = 6;
                if ($check == $countImage) {
                  $carItem = true;
                  $check = 0;
                ?>
                </div>
              </div>
            <?php } ?>

          <?php } ?>
        </div>
      </div>
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
<div class="d-none d-md-block">
  <div class="row">
    <div class="col-md-1">
      <img src="<?= $logo; ?>" alt="">
    </div>
    <div class="col-md-11">
      <h3><?= $school_name; ?></h3>
      <p><i class="fas fa-search-location" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
    </div>
  </div>
  <div class="row">
    <div class="col-md-8">
      <button type="button" class="btn btn-success btn-lg">Daftar Sekarang</button>
      <button type="button" class="btn btn-secondary btn-lg">Download Brosur</button>
    </div>
    <div class="col-md-2">
      <p>Akreditasi:<?= $akreditasi; ?></p>
      <p>400 Likes</p>
      <p>9.0</p>
    </div>
    <div class="col-md-2">
      <img src="<?= $qrcode; ?>" alt="">
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
      <p>Akreditasi:<?= $akreditasi; ?></p>
      <p>400 Likes</p>
      <p>9.0</p>
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

<br />
<?php if (!empty($fasilitas['items'])) { ?>
  <h3>Fasilitas Sekolah</h3>
  <div class="row my-3">
    <?php foreach ($fasilitas['items'] as $item) { ?>
      <div class="col-md-4">

        <p><i class="fas fa-star"></i>&nbsp;<?= $item; ?></p>

      </div>
    <?php } ?>
  </div>
<?php } ?>

<?php if (!empty($ekstra['items'])) { ?>
  <h3>Ekstrakurikuler</h3>
  <div class="row my-3">
    <?php foreach ($ekstra['items'] as $item) { ?>
      <div class="col-md-4">
        <p><i class="fas fa-history" style="font-size: 24px;"></i>&nbsp;<?= $item['text']; ?></p>
      </div>
    <?php } ?>
  </div>
<?php } ?>

<?php if (!empty($jam['items'])) { ?>
  <h3>Jam Belajar</h3>
  <div class="row my-3">
    <div class="col-md-10">
      <table class="table table-striped border">
        <th class="table-success">Hari</th>
        <th class="table-success">Waktu</th>
        <?php foreach ($jam['items'] as $item) { ?>
          <tr>
            <td>
              <?= $item['name']; ?>
            </td>
            <td>
              <?= $item['text']; ?>
            </td>
          </tr>
        <?php } ?>
      </table>
    </div>
  </div>
<?php } ?>

<div class="row">
</div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
  var multiplePsCard = document.querySelector(
    "#psControl"
  );
  if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel1 = new bootstrap.Carousel(multiplePsCard, {
      interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#psControl .carousel-control-next").on("click", function() {
      if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#psControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
    $("#psControl .carousel-control-prev").on("click", function() {
      if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#psControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
  } else {
    $(multiplePsCard).addClass("slide");
  }



  var multiTeacherCard = document.querySelector(
    "#teacherControl"
  );
  if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel = new bootstrap.Carousel(multiTeacherCard, {
      interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#teacherControl .carousel-control-next").on("click", function() {
      if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#teacherControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
    $("#teacherControl .carousel-control-prev").on("click", function() {
      if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#teacherControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
  } else {
    $(multiTeacherCard).addClass("slide");
  }
</script>



<script>
  $(document).ready(function() {

    //Show carousel-control

    $("#myCarousel").mouseover(function() {
      $("#myCarousel .carousel-control").show();
    });

    $("#myCarousel").mouseleave(function() {
      $("#myCarousel .carousel-control").hide();
    });

    //Active thumbnail

    $("#thumbCarousel .thumb").on("click", function() {
      $(this).addClass("active");
      $(this).siblings().removeClass("active");

    });

    //When the carousel slides, auto update

    $('#myCarousel').on('slid.bs.carousel', function() {
      var index = $('.carousel-inner2 .item.active').index();
      //console.log(index);
      var thumbnailActive = $('#thumbCarousel .thumb[data-slide-to="' + index + '"]');
      thumbnailActive.addClass('active');
      $(thumbnailActive).siblings().removeClass("active");
      //console.log($(thumbnailActive).siblings());
    });
  });
</script>
<script>
  $('#myCarousel').carousel({
    interval: false
  });
  $('#carousel-thumbs').carousel({
    interval: false
  });

  // handles the carousel thumbnails
  // https://stackoverflow.com/questions/25752187/bootstrap-carousel-with-thumbnails-multiple-carousel
  $('[id^=carousel-selector-]').click(function() {
    var id_selector = $(this).attr('id');
    var id = parseInt(id_selector.substr(id_selector.lastIndexOf('-') + 1));
    $('#myCarousel').carousel(id);
  });
  // Only display 3 items in nav on mobile.
  if ($(window).width() < 575) {
    $('#carousel-thumbs .row div:nth-child(4)').each(function() {
      var rowBoundary = $(this);
      $('<div class="row mx-0">').insertAfter(rowBoundary.parent()).append(rowBoundary.nextAll().addBack());
    });
    $('#carousel-thumbs .carousel-item .row:nth-child(even)').each(function() {
      var boundary = $(this);
      $('<div class="carousel-item">').insertAfter(boundary.parent()).append(boundary.nextAll().addBack());
    });
  }
  // Hide slide arrows if too few items.
  if ($('#carousel-thumbs .carousel-item').length < 2) {
    $('#carousel-thumbs [class^=carousel-control-]').remove();
    $('.machine-carousel-container #carousel-thumbs').css('padding', '0 5px');
  }
  // when the carousel slides, auto update
  $('#myCarousel').on('slide.bs.carousel', function(e) {
    var id = parseInt($(e.relatedTarget).attr('data-slide-number'));
    $('[id^=carousel-selector-]').removeClass('selected');
    $('[id=carousel-selector-' + id + ']').addClass('selected');
  });
  // when user swipes, go next or previous
  $('#myCarousel').swipe({
    fallbackToMouseEvents: true,
    swipeLeft: function(e) {
      $('#myCarousel').carousel('next');
    },
    swipeRight: function(e) {
      $('#myCarousel').carousel('prev');
    },
    allowPageScroll: 'vertical',
    preventDefaultEvents: false,
    threshold: 75
  });
  /*
  $(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
  });
  */

  $('#myCarousel .carousel-item img').on('click', function(e) {
    var src = $(e.target).attr('data-remote');
    if (src) $(this).ekkoLightbox();
  });
</script>
