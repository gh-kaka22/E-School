<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class StudentLike extends Model
{
    use HasFactory;

    protected $table = "students_comments";

    protected $guarded =[];


    protected $primaryKey = "id";

    public $timestamps=true ;

    public function student(): BelongsTo
    {

        return $this->belongsTo(Student::class,'student_id');
    }

    public function post(): BelongsTo
    {

        return $this->belongsTo(Post::class,'post_id');
    }
}
