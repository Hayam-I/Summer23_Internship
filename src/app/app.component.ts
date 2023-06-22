import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { TranslateService } from './services/translate.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {
  title = 'TITLE';
  
  constructor(private translateService: TranslateService, private toastr: ToastrService) {
    console.log(translateService.data);
  }

  setLang(lang: string) {
    this.translateService.use(lang);
    const message2 = lang === 'en' ? 'Language switched to English' : 'Langue changée en français';
    this.toastr.success(message2, 'Success');
  }
}