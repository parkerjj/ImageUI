//
//  IFImage.swift
//
//  Copyright © 2020 ImageUI - Alberto Saltarelli
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Photos
#if canImport(ImageUI)
import UIKit
#endif


public struct IFImage {
    public enum Source {
        case url(_ url: URL)
        case image(UIImage)
        case asset(PHAsset)
    }

    public let title: String?
    public let original: Source
    public let thumbnail: Source?
    public var placeholder: UIImage?
    
    public init(title: String? = nil, original: Source, thumbnail: Source? = nil, placeholder: UIImage? = nil) {
        self.title = title
        self.original = original
        self.thumbnail = thumbnail
        self.placeholder = placeholder
    }
}

public extension IFImage {
    init(title: String? = nil, url: URL, placeholder: UIImage? = nil) {
        self.init(title: title, original: .url(url), placeholder: placeholder)
    }
    
    init(title: String? = nil, path: String, placeholder: UIImage? = nil) {
        self.init(title: title, original: .url(URL(fileURLWithPath: path)), placeholder: placeholder)
    }
    
    init(title: String? = nil, image: UIImage, placeholder: UIImage? = nil) {
        self.init(title: title, original: .image(image), placeholder: placeholder)
    }

    init(title: String? = nil, photoAsset: PHAsset) {
        self.init(title: title, original: .asset(photoAsset))
    }
}
