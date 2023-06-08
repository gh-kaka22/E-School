<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TeacherLike extends Model
{
    use HasFactory;

    protected $table = "teachers_likes";

    protected $guarded =[];


    protected $primaryKey = "id";

    public $timestamps=true ;

    public function teacher(): BelongsTo
    {

        return $this->belongsTo(Teacher::class,'teacher_id');
    }

    public function post(): BelongsTo
    {

        return $this->belongsTo(Post::class,'post_id');
    }
}
