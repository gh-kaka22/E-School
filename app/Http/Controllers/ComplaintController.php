<?php

namespace App\Http\Controllers;
use App\Models\Complaint;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ComplaintController extends Controller
{
    use ApiResponseTrait;

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'description' => 'required|string'
        ]);

        $complaint = Complaint::create([
            'parent_id' => auth()->user()->id,
            'date' =>  Carbon::now()->toDateString(),
            'description' => $validatedData['description'],
        ]);

        return $this->apiResponse('Complaint submitted successfully',$complaint);

    }


    public function getParentComplaints(Request $request)
    {
        $parent = $request->user();

        $complaints = Complaint::where('parent_id', $parent->id)
            ->orderByDesc('created_at')
            ->get();

        return $this->apiResponse('success',$complaints);
    }





}
