<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "asignatura_has_competencia".
 *
 * @property integer $asignatura_idasignatura
 * @property integer $competencia_idcompetencia
 */
class AsignaturaHasCompetencia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'asignatura_has_competencia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['asignatura_idasignatura', 'competencia_idcompetencia'], 'required'],
            [['asignatura_idasignatura', 'competencia_idcompetencia'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'asignatura_idasignatura' => 'Asignatura Idasignatura',
            'competencia_idcompetencia' => 'Competencia Idcompetencia',
        ];
    }
}
