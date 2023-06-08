<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class PostType extends Model
{
    use HasFactory;

    protected $table = "posts_type";

    protected $guarded =[];


    protected $primaryKey = "type_id";

    public $timestamps=true ;


    public function post() : HasMany
    {
        return $this->hasMany(Post::class,'type_id');

    }
}
