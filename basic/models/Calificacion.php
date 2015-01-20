<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "calificacion".
 *
 * @property integer $alumno_idalumno
 * @property integer $competencia_idcompetencia
 * @property integer $nota
 */
class Calificacion extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'calificacion';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['alumno_idalumno', 'competencia_idcompetencia'], 'required'],
            [['alumno_idalumno', 'competencia_idcompetencia', 'nota'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'alumno_idalumno' => 'Alumno Idalumno',
            'competencia_idcompetencia' => 'Competencia Idcompetencia',
            'nota' => 'Nota',
        ];
    }
}
