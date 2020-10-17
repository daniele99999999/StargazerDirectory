//
//  CommonTypes.swift
//  Common
//
//  Created by daniele on 17/10/2020.
//  Copyright © 2020 DeeplyMadStudio. All rights reserved.
//

import Foundation

public typealias VoidClosure = () -> Void
public typealias VoidInputClosure<O> = () -> O
public typealias VoidOutputClosure<I> = (I) -> Void
public typealias Closure<I, O> = (I) -> O
