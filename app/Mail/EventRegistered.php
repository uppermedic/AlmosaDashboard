<?php

namespace App\Mail;

use App\Models\Event;
use App\Models\EventAttendance;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class EventRegistered extends Mailable
{
    use Queueable, SerializesModels;

    protected  $user;


    /**
     * Create a new message instance.
     *
     * @param EventAttendance $user
     *
     */
    public function __construct(EventAttendance $user)
    {
        $this->user = $user;

    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {

        return $this->from('aziz@uppermedic.com')->markdown('emails.events.registered',['user'=>$this->user]);
    }
}
