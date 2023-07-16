<?php

namespace App\Notifications;

use BeyondCode\LaravelWebSockets\WebSockets\Channels\PrivateChannel;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class Attendance_Notification extends Notification implements ShouldQueue
{
    use Queueable;
//////
    /**
     * The name of the student.
     *
     * @var string
     */
    public $first_name;

    /**
     * The name of the student.
     *
     * @var string
     */
    public $last_name;

    /**
     * The date of the attendance.
     *
     * @var string
     */
    public $date;

    /**
     * Create a new notification instance.
     */
    public function __construct($date,$first_name,$last_name)
    {
        $this->date = $date;
        $this->first_name = $first_name;
        $this->last_name = $last_name;

    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database','broadcast'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'first name'=>$this->first_name,
            'last name'=>$this->last_name,
            'text'=>'is absent today',
            'date'=>$this->date,
        ];
    }

    /**
     * Get the broadcastable representation of the notification.
     */
    public function toBroadcast(object $notifiable): BroadcastMessage
    {
        return new BroadcastMessage([
            'first name'=>$this->first_name,
            'last name'=>$this->last_name,
            'text'=>'is absent today',
            'date'=>$this->date,
        ]);
    }

    /*public function broadcastAs()
    {
        return 'my-notification-name';
    }

    public function broadcastWith()
    {
        return [
            'were absent today'
        ];
    }*/


    /*public function toDatabase(object $notifiable): array
    {
        return [
            'name'=>$this->name,
            'text'=>'is absent today',
            'date'=>$this->date,
        ];
    }*/
}
