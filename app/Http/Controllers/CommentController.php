<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request, $post_id)
    {
        $post = Post::find($post_id);
        if(!$post)
            return $this->apiResponse('no post found',null,false);
        $comments = $post->comments;
        $res=array();

        foreach($comments as $comment){
            $user = User::find($comment->user_id);
            $role = $user->role;
            if($role == 0){
            $comment->publisher = "E-School";
            array_push($res,$comment);
            }

            if($role == 1){
                $comment->publisher = "E-School";
                array_push($res,$comment);
            }

            if($role == 2){
                $student = DB::table('students')->where('user_id','=',$user->id)->first();
                $comment->publisher = $student->first_name . " " . $student->last_name;
                array_push($res,$comment);
            }

            if($role == 3){
                $parent = DB::table('parents')->where('user_id','=',$user->id)->first();
                $comment->publisher = $parent->father_first_name . " " . $parent->father_last_name;
                array_push($res,$comment);
            }

            if($role == 4){
                $teacher = DB::table('teachers')->where('user_id','=',$user->id)->first();
                $comment->publisher = $teacher->first_name . " " . $teacher->last_name;
                array_push($res,$comment);
            }

        }
        return $this->apiResponse('success',$res);
    }

    public function store(Request $request)
    {

        $request->validate([
            'post_id'=>['required', 'integer'],
            'body' => ['required', 'string', 'min:1', 'max:400']

        ]);
        $post_id=$request->post_id;

        $post = Post::find($post_id);
        if (!$post) {
            return $this->apiResponse('Post not found',null,false);
        }
        $comment = $post->comments()->create([
            'body' => $request->body,
            'post_id' => $post_id,
            'user_id' => Auth::id(),
        ]);
        return $this->apiResponse('success',$comment);
    }

    public function update(Request $request)
    {


        $request->validate([
            'post_id'=>['required', 'integer'],
            'comment_id'=>['required', 'integer'],
            'body' => ['required', 'string', 'min:1', 'max:400']

        ]);
        $post_id=$request->post_id;
        $comment_id=$request->comment_id;

        $post = Post::find($post_id);
        if (!$post) {
            return $this->apiResponse('Post not found',null,false);
        }
        $comment = Comment::find($comment_id);
        if (!$comment) {
            return $this->apiResponse('Comment not found',null,false);
        }

        $comment->update([
            'body' => $request->body,
            'post_id' => $post_id,
            'user_id' => Auth::id(),
        ]);

        return $this->apiResponse('updated successfully',$comment);
    }

    public function destroy($comment_id)
    {

//        $request->validate([
//            'post_id'=>['required', 'integer'],
//            'comment_id'=>['required', 'integer'],
//
//        ]);
//
//        $post_id=$request->post_id;
//        $comment_id=$request->comment_id;


//
//        $post = Post::find($post_id);
//        if (!$post) {
//            return $this->apiResponse('Post not found',null,false);
//        }
        $comment = Comment::find($comment_id);
        if (!$comment) {
            return $this->apiResponse('Comment not found',null,false);
        }
        $comment->delete($comment_id);
        if ($comment) {
            return $this->apiResponse('Comment was deleted');
        }
    }
}
