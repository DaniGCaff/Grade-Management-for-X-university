<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pdi".
 *
 * @property integer $id
 * @property integer $centro_idcentro
 * @property integer $usuario_idusuario
 */
class Pdi extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pdi';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['centro_idcentro', 'usuario_idusuario'], 'required'],
            [['centro_idcentro', 'usuario_idusuario'], 'integer']
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
            'usuario_idusuario' => 'Usuario Idusuario',
        ];
    }
}
