//
//  SegmentContract.swift
//  CatDogTube
//
//  Created by ken on 2016/12/18.
//  Copyright © 2016 Kenichiro Sato. All rights reserved.
//

import Foundation

/**
These are just a marker interface for View which is
used as a segment of SegmentedVC
*/
public protocol SegmentContract_View {

}

/**
 These are just a marker interface for Presenter which is
 used as a segment of SegmentedVC
 */
public protocol SegmentContract_Presenter {

    func markAsPrimal()
}
