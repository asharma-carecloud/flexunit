/**
 * Copyright (c) 2009 Digital Primates IT Consulting Group
 * 
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 * 
 * @author     Michael Labriola <labriola@digitalprimates.net>
 * @version    
 **/ 
package org.flexunit.async {
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	
	import org.flexunit.events.AsyncResponseEvent;
	
	[Event(name="responderFired",type="net.digitalprimates.fluint.events.AsyncResponseEvent")]

	public class AsyncTestResponder extends EventDispatcher implements IResponder {
		private var originalResponder:*;		
		
		public function fault( info:Object ):void {
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, originalResponder, 'fault', info ) );
		}

		public function result( data:Object ):void {
			dispatchEvent( new AsyncResponseEvent( AsyncResponseEvent.RESPONDER_FIRED, false, false, originalResponder, 'result', data ) );
		}
		
		public function AsyncTestResponder( originalResponder:* ) {
			this.originalResponder = originalResponder;
		}
	}
}