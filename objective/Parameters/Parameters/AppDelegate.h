//
//  AppDelegate.h
//  Parameters
//
//  Created by Denis Nesteruk on 1/29/19.
//  Copyright © 2019 Denis Nesteruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Object;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//Atomic - потоконезависимо,nonatomic - потоконезащищены

//readonly - доступ к сеттерам закрыт, readwrite - доступ к геттерам и сеттерам открыт

//если работаем с проперти объекта  - используем weak
@property (copy, nonatomic, readwrite) Object* object;

@end

