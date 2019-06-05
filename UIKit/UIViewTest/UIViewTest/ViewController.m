//
//  ViewController.m
//  UIViewTest
//
//  Created by Denis Nesteruk on 2/27/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Is initial View Controller - view controller,который запускается первым
//MVC  - паттерн,model view controller

//View - занимается только тем,что связано с отображением на экране.Никогда не должен хранить данные и делать калькуляции с данными(не считая тех,которые связаны с отображением). Настраиваем наши вьюхи

//Model - данные,которые не связаны  с графической частью
//Controller - обрабатывает данные из model и передаёт их во вью
//Model и controller часто совмещены в одном классе


// ***************ЖИЗНЕННЫЙ ЦИКЛ ВЬЮХИ******************
// !В loadView - создать разные view,заниматься графикой
// В viewDidLoad - инициализировать различные массивы,выполнять базовые калькуляции. . Настраиваем наши вьюхи
// viewWillAppear - вью создана,но ешё не появляется на экране.Можем переопределять какие-либо калькуляции тут
// viewWillLayoutSubviews - добавление и удаление вью из иерархии,addSubView и removeFromSuperView,изменение frame,А ТАКЖЕ ПОВОРОТ УСТРОЙСТВА.  МЕТОДЫ,ГДЕ ПЕРЕРИСОВЫВАЮТСЯ ВЬЮХИ.!Перерисовка происходит до того,как вью выводится на экран в методе viewDidAppear
// viewDidLayoutSubviews - результат нашей willLayout на экране
//viewDidAppear - вью появляется.Анимации делать тут (c)

//viewWillDisappear - вью вот-вот удалится
//viewDidDissapear - вью удаляется

#pragma mark - Loading

-(void) loadView {
    [super loadView];
    
    NSLog(@"loadView");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");
}


#pragma mark - appearance view

//С анимацией или без
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear");
}


-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"viewDidAppear");
}


#pragma mark - reDrawning views

-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"viewWillLayoutSubviews");
}


-(void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"viewDidLayoutSubviews");
}

#pragma mark - orientation

- (BOOL)shouldAutorotate {
    
    return YES;
}

//Поддерживаемые ориентации для viewController! не смотря на те ориентации,которые выбраны в билде проекта
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

/*
//та ориентация,которая будет выбрана тогда,когда view controller будет загружен как модальный
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
}
*/

-(void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
//    before rotation
    [coordinator animateAlongsideTransition:^(id _Nonnull context) {
        //    during rotation:update our image bounds and center for example
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        after rotation
        NSLog(@"viewWillTransitionToSize");
    }];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}





#pragma mark - disappear Views

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear");
}


-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
}



@end
