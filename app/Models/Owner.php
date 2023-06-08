<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Owner extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;


    protected $fillable = [
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
//        'remember_token',
    ];


    protected $table = "owners";


    protected $primaryKey = "id";

    public $timestamps = true;


}

