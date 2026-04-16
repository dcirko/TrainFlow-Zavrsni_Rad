import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { JwtResponse } from '../domain/jwtResponse';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { environment } from '../environment.prod';


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private loggedIn = new BehaviorSubject<boolean>(this.hasToken());
  isLoggedIn$ = this.loggedIn.asObservable();
  //private readonly authUrl = 'http://46.225.77.181:8080/api/auth';
  private readonly authUrl = `${environment.apiUrl}/auth`;

  httpOptions={
    headers: new HttpHeaders({'Content-Type':'application/json'}),
    withCredentials: true
  };

  constructor(private http: HttpClient) { }

  register(userData: any): Observable<any>{
    //console.log("Register info sent to backend", userData);
    return this.http.post(`${this.authUrl}/register` , userData, this.httpOptions).pipe(
      tap(response => {
        console.log('User registered successfully');
      })
    );
  }

  login(userData: any): Observable<JwtResponse>{
    //console.log("Login info sent to backend", userData);
    return this.http.post<JwtResponse>(`${this.authUrl}/login`, userData, this.httpOptions).pipe(
      tap(response => {
        console.log('User logged in successfully');
        localStorage.setItem('accessToken', response.accessToken);
        //console.log("Access token", response.accessToken);
        this.loggedIn.next(true);
      }
    ));
  }

  refreshToken(): Observable<JwtResponse>{
    console.log("Refresh token called");
    return this.http.post<JwtResponse>(`${this.authUrl}/refreshToken`, this.httpOptions)
  }

  logout(): Observable<any>{
    console.log("Logout called");
    localStorage.removeItem("accessToken");
    this.loggedIn.next(false);

    return this.http.post(`${this.authUrl}/logout`, this.httpOptions);
  }

  getToken(): string{
    if(localStorage.getItem("accessToken")){
      return localStorage.getItem("accessToken")!;
    }else{
      console.log("Token invalid");
      return "";
    }
  }

  private hasToken(): boolean {
    return !!localStorage.getItem('accessToken');
  }

  isLoggedIn(): boolean{
    return this.hasToken();
  }
}

