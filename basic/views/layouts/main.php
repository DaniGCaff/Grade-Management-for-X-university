<?php
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
    <div class="wrap">
        <?php
            NavBar::begin([
                'brandLabel' => 'Universidad Politécnica de Madrid',
                'brandUrl' => "http://upm.es",
                'options' => [
                    'class' => 'navbar-inverse navbar-fixed-top',
                ],
            ]);
            echo Nav::widget([
                'options' => ['class' => 'navbar-nav navbar-right'],
                'items' => [
                    ['label' => 'Inicio', 'url' => ['/site/index']],
                    ['label' => 'Contacto', 'url' => ['/site/contact']],
                    Yii::$app->user->isGuest ?
                        ['label' => 'Acceder', 'url' => ['/site/login']] :
                        ['label' => 'Cerrar sesión (' . Yii::$app->user->identity->user . ')',
                            'url' => ['/site/logout'],
                            'linkOptions' => ['data-method' => 'post']],
                ],
            ]);
            NavBar::end();
        ?>

		<?php if(Yii::$app->user->isGuest == false) { ?>
		<div class="col-sm-3 col-md-2 sidebar">
		  <h3>Perfiles disponibles</h3>
          <ul class="nav nav-sidebar">
            <li><a href="#">Alumno</a></li>
            <li><a href="#">Profesor</a></li>
            <li><a href="#">Gestor</a></li>
            <li><a href="#">Admon.</a></li>
          </ul>
        </div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<?php } else { ?>
			<div class="container">
		<?php } ?>
			<?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>
            <?= $content ?>
		</div>
    </div>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
