<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "centro".
 *
 * @property integer $id
 * @property string $nombre
 * @property string $localizacion
 */
class Centro extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'centro';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nombre', 'localizacion'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
            'localizacion' => 'Localizacion',
        ];
    }
}
