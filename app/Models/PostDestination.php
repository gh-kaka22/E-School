<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PostDestination extends Model
{
    use HasFactory;

    protected $table = "posts_destination";

    protected $guarded =[];


    protected $primaryKey = "id";

    public $timestamps = false;

    public function student() : BelongsTo
    {
        return $this->belongsTo(Student::class,'student_id');
    }

    public function post() : BelongsTo
    {
        return $this->belongsTo(Post::class,'Post_id');
    }
}
