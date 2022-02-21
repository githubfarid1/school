<?php echo $header; ?>
<div class="container">
  <?= $breadcrumbs; ?>
  <div class="container alert alert-light">
    <?php foreach ($views as $view) { ?>
      <?php if (!empty($view['view'])) {?>
        <?= $view['view']; ?>
      <?php } ?>
    <?php } ?>
  </div>
</div>
<?php echo $footer; ?>
