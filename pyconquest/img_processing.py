import base64
import io

import matplotlib.pyplot as plt
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

    fig = plt.figure(figsize=(2, 2))
    ax = fig.add_subplot()
    ax.imshow(dataset.pixel_array, cmap=plt.cm.bone)
    ax.axis("off")
    ax.grid(visible=None)

    # Save image to JPEG byte buffer and encode into to Base64 string
    io_bytes = io.BytesIO()
    plt.savefig(io_bytes, format="jpeg", pad_inches=0, bbox_inches="tight")
    plt.close()
    io_bytes.seek(0)
    return base64.b64encode(io_bytes.read()).decode("ascii")
