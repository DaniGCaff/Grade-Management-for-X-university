<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "grado_has_alumno".
 *
 * @property integer $grado_idgrado
 * @property integer $alumno_idalumno
 */
class GradoHasAlumno extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'grado_has_alumno';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['grado_idgrado', 'alumno_idalumno'], 'required'],
            [['grado_idgrado', 'alumno_idalumno'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'grado_idgrado' => 'Grado Idgrado',
            'alumno_idalumno' => 'Alumno Idalumno',
        ];
    }
}
