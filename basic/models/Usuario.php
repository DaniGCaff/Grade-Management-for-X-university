<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuario".
 *
 * @property integer $idusuario
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{

	public static function validateData($username, $password)
    {
		$usuario = Usuario::find()->where("user LIKE '".$username."' AND password LIKE '".$password."'")->one();
		if($usuario != null) {
			return $usuario;
		}

		return null;
	}

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne(['access_token' => $token]);
    }

    public function getId()
    {
        return $this->idusuario;
    }

    public function getAuthKey()
    {
        return $this->authKey;
    }

    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param  string  $password password to validate
     * @return boolean if password provided is valid for current user
     */


	//------- generado por el generador

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['idusuario'], 'required'],
            [['idusuario'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'idusuario' => 'Idusuario',
        ];
    }
}
