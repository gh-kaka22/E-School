<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ParentLike extends Model
{
    use HasFactory;

    protected $table = "parents_likes";

    protected $guarded =[];


    protected $primaryKey = "id";

    public $timestamps=true ;

    public function parent(): BelongsTo
    {

        return $this->belongsTo(Parentt::class,'parent_id');
    }

    public function post(): BelongsTo
    {

        return $this->belongsTo(Post::class,'post_id');
    }
}
