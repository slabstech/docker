

## Build Base Images
* docker build --rm . -t slabstech/base_ms_index_java_alpine  --file .\dockerfiles\base\base_ms_index_java_alpine

* docker build --rm . -t slabstech/base_ms_index_node_alpine  --file .\dockerfiles\base\base_ms_index_node_alpine

* docker build --rm . -t slabstech/base_ms_index_python_debian  --file .\dockerfiles\base\base_ms_index_python_debian

## Store Base images
* docker push slabstech/base_ms_index_java_alpine

* docker push slabstech/base_ms_index_node_alpine                                                                    

* docker push slabstech/base_ms_index_python_debian
