import { Injectable } from '@angular/core';
import { Http, Response, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { ISession } from './session';
//import 'rxjs/add/operator/do';  // for debugging

/**
 * This class provides the NameList service with methods to read names and add names.
 */
@Injectable()
export class SessionService {

  constructor(private http: Http) {}

  /**
   * Returns an Observable for the HTTP GET request for the JSON resource.
   * @return {any} The Observable for the HTTP request.
   */
  getSessions(): Observable<any> {
    return this.http.get('http://localhost:3000/sessions')
                    .map((res: Response) => res.json())
                    //.do(data => console.log('server data:', data))  // debug
                    .catch(this.handleError);
  }

  getSession(id: number): Observable<ISession> {
    return this.http.get('http://localhost:3000/sessions/' + id.toString())
                    .map((res: Response) => <ISession>res.json())
                    .catch(this.handleError);
  }

  saveSession(session: ISession) : Observable<any> { 
    console.log("session is " + session);
    let options = new RequestOptions({ headers: { 'Content-Type': 'application/json' } });
    let data = JSON.stringify(session);
    return this.http.post('http://localhost:3000/sessions/save', data, options)
                    .map((res: Response) => <ISession>res.json())
                    .catch(this.handleError);
  }

  /**
    * Handle HTTP error
    */
  private handleError (error: any) {
    // In a real world app, we might use a remote logging infrastructure
    // We'd also dig deeper into the error to get a better message
    let errMsg = (error.message) ? error.message :
      error.status ? `${error.status} - ${error.statusText}` : 'Server error';
    console.error(errMsg); // log to console instead
    return Observable.throw(errMsg);
  }
}

