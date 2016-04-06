# Build Docker image

Build a Docker image:

    nvidia-docker build -t chainer-mnist:0.1

# Run

General form: `nvidia-docker run --rm chainer-mnist:0.1 <GPU_ID>`

Add `sudo` in front if required.

## Run on CPU (and measure time)

    time nvidia-docker run --rm chainer-mnist:0.1 -1

## Run on GPU 0 (and measure time)

    time nvidia-docker run --rm chainer-mnist:0.1 0








