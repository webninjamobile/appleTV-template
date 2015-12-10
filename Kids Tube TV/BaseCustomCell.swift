//
//  BaseCustomCell
//  Kids Tube TV
//
//  Created by keithics on 11/30/15.
//  Copyright © 2015 Web Ninja Technologies. All rights reserved.
//

import UIKit

class BaseCustomCell: UICollectionViewCell {
    
    @IBOutlet var mainText: UILabel!
    @IBOutlet var mainImage: UIImageView!
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    private func commonInit()
    {
        // Initialization code
        
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if (self.focused)
        {
            self.mainImage.adjustsImageWhenAncestorFocused = true
        }
        else
        {
            self.mainImage.adjustsImageWhenAncestorFocused = false
        }
    }
    
    
    
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
