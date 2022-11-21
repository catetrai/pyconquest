import base64
import io

import matplotlib as plt
from pydicom import Dataset


def create_img_thumbnail(dataset: Dataset) -> str:
    """
    Generate a small thumbnail of a DICOM image encoded as base64 string.

    Parameters
    ----------
    dataset: Dataset
        A ``pydicom.Dataset`` object

    Returns
    -------
    str
        Base64-encoded string of image thumbnail JPEG

    """
    if "PixelData" not in dataset:
        raise ValueError("Image must contain PixelData element to generate "
                         "thumbnail")

    fig, ax = plt.subplots(1, 1, squeeze=False, figsize=(2, 2))
    fig.subplots_adjust(wspace=0.05, hspace=0.05)
    ax[0].imshow(dataset.pixel_array, cmap=plt.cm.bone)
    ax[0].axis("off")
    ax[0].grid(visible=None)

    # Save image to JPEG byte buffer and encode into to Base64 string
    io_bytes = io.BytesIO()
    plt.savefig(io_bytes, format="jpeg", pad_inches=0, bbox_inches="tight")
    plt.close()
    io_bytes.seek(0)
    return base64.b64encode(io_bytes.read()).decode("ascii")
