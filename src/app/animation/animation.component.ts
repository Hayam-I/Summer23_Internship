import { Component } from '@angular/core';
import { trigger, state, style, transition, animate } from '@angular/animations';

@Component({
  selector: 'app-animation',
  templateUrl: './animation.component.html',
  styleUrls: ['./animation.component.css'],
  animations: [
    trigger('fadeInOut', [
      state('void', style({
        opacity: 0
      })),
      transition('void <=> *', animate(1000))
    ]),
    trigger('slideInOut', [
      transition(':enter', [
        style({ transform: 'translateX(-100%)' }),
        animate('0.5s ease-out', style({ transform: 'translateX(0%)' }))
      ]),
      transition(':leave', [
        animate('0.5s ease-out', style({ transform: 'translateX(100%)' }))
      ])
    ]),
    trigger('rotateInOut', [
      state('in', style({ transform: 'rotate(0deg)' })),
      state('out', style({ transform: 'rotate(180deg)' })),
      transition('in <=> out', animate('0.5s ease-out')),
      transition(':enter', [
        style({ transform: 'rotate(180deg)' }),
        animate('0.5s ease-out', style({ transform: 'rotate(0deg)' }))
      ]),
      transition(':leave', [
        animate('0.5s ease-out', style({ transform: 'rotate(180deg)' }))
      ])
    ]),
    trigger('scaleInOut', [
      state('in', style({ transform: 'scale(1)' })),
      state('out', style({ transform: 'scale(1.5)' })),
      transition('in <=> out', animate('0.5s ease-out')),
      transition(':enter', [
        style({ transform: 'scale(1.5)' }),
        animate('0.5s ease-out', style({ transform: 'scale(1)' }))
      ]),
      transition(':leave', [
        animate('0.5s ease-out', style({ transform: 'scale(1.5)' }))
      ])
    ]),
    trigger('colorInOut', [
      state('in', style({ backgroundColor: 'blue' })),
      state('out', style({ backgroundColor: 'red' })),
      transition('in <=> out', animate('0.5s ease-out')),
      transition(':enter', [
        style({ backgroundColor: 'red' }),
        animate('0.5s ease-out', style({ backgroundColor: 'blue' }))
      ]),
      transition(':leave', [
        animate('0.5s ease-out', style({ backgroundColor: 'red' }))
      ])
    ]),
  ]
})
export class AnimationComponent {
  isVisible = true;

  toggle() {
    this.isVisible = !this.isVisible;
  }
}