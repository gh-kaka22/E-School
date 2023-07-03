<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    use ApiResponseTrait;
    public function index(Request $request, $post_id)
    {
        $post = Post::find($post_id);
        $comments = $post->comments;
        return $this->apiResponse('success',$comments);
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
