<?php

namespace app\models;

use Yii;
use yii\base\Model;

class SearchForm extends Model
{
    public $name;
    public $author_id;
    public $date;
    public $lastdate;

    public function rules()
    {
        return [
            [['date', 'lastdate'], 'safe'],
            [['author_id'], 'integer'],
            [['name'], 'string', 'max' => 255]
        ];
    }
}