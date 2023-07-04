<?php

namespace App\Events;

use App\Models\Student;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AttendanceEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public $student;
    public $parent;


    /**
     * Create a new event instance.
     */
    public function __construct($student,$parent)
    {
        $this->student = $student;
        $this->parent = $parent;

        //$this->eventName = $eventName;
        //$this->data = $data;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('AttendanceEvent'),
        ];
    }

    public function broadcastAs()
    {
        return "Attendance Notification";
    }


    public function broadcastWith()
    {
        return [
            'were absent today'
        ];
    }



}


