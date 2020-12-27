<?php

namespace App\Http\Middleware;

use App\Models\Event;
use Closure;
use Illuminate\Http\Request;

class checkEvent
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if (empty(Event::find($request->get('event_id')))) {
            return response(['message'=>'Oops,some data missing!','errors'=>'the event you register to Not exist.','success'=>false],404);
        }
        return $next($request);
    }
}
