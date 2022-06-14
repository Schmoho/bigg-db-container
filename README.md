# Why?
I wanted to obtain a recent SQL dump of BiGG, which turned out to require building it.

This builds on [cobradb](https://github.com/Schmoho/cobradb-container).

Note that for it to work, you need to also mount the Genbank data that [this script](https://github.com/Schmoho/bigg_models_data/blob/master/download_genbank) downloads.
This amounts to around 12GB and took around 5 hours on my machine.

Further note that this is not completed. I ended up doing the final steps manually from within the container and couldn't motivate myself to move this towards some kind of "finished" state. Should there be interest in it, I'd be happy to change that.

Anyways, you'll find comments on what to do in the Dockerfile and the entrypoint script, which is not actually included and run yet.
