<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Post extends Model
{
    use HasFactory;

    protected $table = "posts";

    protected $guarded =[];


    protected $primaryKey = "post_id";

    public $timestamps=true ;

    public function postType(): BelongsTo
    {

        return $this->belongsTo(PostType::class,'type_id');
    }

    public function post_destination() : HasMany
    {
        return $this->hasMany(PostDestination::class,'post_id');

    }

    public function studentLike() : HasMany
    {
        return $this->hasMany(StudentLike::class,'post_id');

    }

    public function studentComment() : HasMany
    {
        return $this->hasMany(StudentComment::class,'post_id');

    }

    public function parentLike() : HasMany
    {
        return $this->hasMany(ParentLike::class,'post_id');

    }

    public function parentComment() : HasMany
    {
        return $this->hasMany(ParentComment::class,'post_id');

    }

    public function teacherLike() : HasMany
    {
        return $this->hasMany(TeacherLike::class,'post_id');

    }

    public function teacherComment() : HasMany
    {
        return $this->hasMany(TeacherComment::class,'post_id');

    }
}
