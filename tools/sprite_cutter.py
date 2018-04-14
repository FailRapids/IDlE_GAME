
import os
import glob

from PIL import Image

    
def cut(args=["./icon.png","./",10,10]):
    
    src_img = args[0]
    dst_path = args[1]
    w, h = int(args[2]), int(args[3])
    im = Image.open(src_img,"r")
    im_w, im_h = im.size
    
    w_num, h_num = int(im_w/w), int(im_h/h)
    
    for wi in range(0, w_num):
        for hi in range(0, h_num):
            box = (wi*w, hi*h, (wi+1)*w, (hi+1)*h)
            piece = im.crop(box)
            tmp_img = Image.new("RGBA", (w, h),0)
            tmp_img.paste(piece)
            img_path = os.path.join(dst_path, "%d_%d.png" % (wi, hi))
            tmp_img.save(img_path)
