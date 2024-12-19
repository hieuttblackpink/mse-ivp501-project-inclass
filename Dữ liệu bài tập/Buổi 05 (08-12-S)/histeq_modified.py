import numpy as np
import cv2
from skimage import exposure

def histeq_modified(a, cm=None, hgram=None):
    """
    Perform histogram equalization with optional custom histogram matching.
    
    Parameters:
    - a: Input image (grayscale or indexed image as ndarray).
    - cm: Colormap or scalar value for the number of intensity levels (optional).
    - hgram: Target histogram for custom histogram matching (optional).
    
    Returns:
    - out: Equalized image or adjusted colormap.
    - T: Transformation function.
    """
    # Determine the number of bins based on input type
    if a.dtype == np.uint8:
        npts = 256
    elif a.dtype == np.uint16:
        npts = 65536
    else:
        npts = int(a.max() - a.min() + 1)
    
    if cm is None and hgram is None:
        # Default: Flatten histogram with 64 bins
        hgram = np.ones(64) * (a.size / 64)
    elif isinstance(cm, int):
        # Number of intensity levels specified
        hgram = np.ones(cm) * (a.size / cm)
    elif hgram is not None:
        hgram = np.array(hgram)
        hgram = hgram * (a.size / np.sum(hgram))
    
    # Compute the histogram of the input image
    hist, bins = np.histogram(a.flatten(), bins=npts, range=[0, npts - 1])
    cdf = hist.cumsum()  # Cumulative distribution function
    cdf_normalized = cdf / float(cdf[-1])  # Normalize to [0, 1]

    # Compute the target cumulative distribution
    hgram_cdf = hgram.cumsum()
    hgram_cdf_normalized = hgram_cdf / float(hgram_cdf[-1])

    # Match input CDF to target CDF
    T = np.interp(cdf_normalized, hgram_cdf_normalized, np.linspace(0, 1, len(hgram_cdf_normalized)))

    # Map the image using the transformation T
    out = np.interp(a.flatten(), bins[:-1], T * (npts - 1)).reshape(a.shape).astype(a.dtype)

    return out, T