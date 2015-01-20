<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grado".
 *
 * @property integer $id
 * @property integer $centro_idcentro
 * @property string $nombre_grado
 * @property string $plan_estudio
 */
class Grado extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grado';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['centro_idcentro'], 'required'],
            [['centro_idcentro'], 'integer'],
            [['nombre_grado', 'plan_estudio'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'centro_idcentro' => 'Centro Idcentro',
            'nombre_grado' => 'Nombre Grado',
            'plan_estudio' => 'Plan Estudio',
        ];
    }
}
