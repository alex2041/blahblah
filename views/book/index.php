<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Modal;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Books';
$this->params['breadcrumbs'][] = $this->title;
Url::remember();

$this->registerJsFile('@web/js/main.js', ['depends' => [\yii\web\JqueryAsset::className()]]);

?>
<div class="book-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Book', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <div class="book-form">

        <?php $form = ActiveForm::begin(['method' => 'get', 'action' => '/book/index', 'options' => ['class' => 'form-inline']]); ?>

        <?= $form->field($model, 'author_id')->dropDownList(['' => ''] + ArrayHelper::map($authors, 'id', 'fullname'))->label(false); ?>

        <?= $form->field($model, 'name')->textInput(['maxlength' => true, 'placeholder' => 'название книги'])->label(false) ?>

        <?= $form->field($model, 'date')->widget(DatePicker::classname(), [
            'dateFormat' => 'yyyy-MM-dd',
            'options' => ['class' => 'form-control']
        ])->label('Дата выхода книги: ') ?>

        <?= $form->field($model, 'lastdate')->widget(DatePicker::classname(), [
            'dateFormat' => 'yyyy-MM-dd',
            'options' => ['class' => 'form-control']
        ])->label('до') ?>

        <div class="form-group">
            <?= Html::submitButton('Search', ['class' => 'btn btn-primary', 'style' => 'margin-bottom: 10px;']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

    <?
        Modal::begin([ 'id' => 'modal',]);
        Modal::end();
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'id',
            'name',
            [
                'header'=>'Превью',
                'value'=> function($model) {
                    return  Html::img('@web/img/' . $model->preview, ['alt' => 'book logo', 'height' => '50px', 'class' => 'preview']);
                },
                'format' => 'raw'
            ],
            [
                'attribute' => 'author_id',
                'value' => 'author.fullname'
            ],
            'date',
            'date_create',
            [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {view} {delete}',
                'contentOptions' => ['style'=>'white-space:nowrap'],
                'buttons'=>[
                    'view'=>function ($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-eye-open"></span>',
                            ['book/view','id'=>$model->id], ['class' => 'popupModal']);
                    },
                ],
            ],
        ],
    ]); ?>

</div>