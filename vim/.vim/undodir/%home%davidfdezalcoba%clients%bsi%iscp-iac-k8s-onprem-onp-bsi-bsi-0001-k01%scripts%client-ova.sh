Vim�UnDo� 7*I���y_�=��h�08�0�Nq�y�؜x�^1�   �   �  until govc vm.ip -v4 -wait 1m "${CLIENT_VMS_NAME[$i]}" &>/dev/null || (( countIP++ >= 15 )); do echo "Retrying ($countIP/15)..."; sleep 10; done   c                          c=/�    _�                     c       ����                                                                                                                                                                                                                                                                                                                                                             c;�    �   b   d   �      �  until govc vm.ip -v4 -wait 1m "${CLIENT_VMS_NAME[$i]}" &>/dev/null || (( countIP++ >= 15 )); do echo "Retrying ($countIP/15)..."; sleep 10; done5��    b                    �	                    5�_�                     c       ����                                                                                                                                                                                                                                                                                                                                                             c=/�    �   b   d   �      �  until govc vm.ip -v4 -wait 10m "${CLIENT_VMS_NAME[$i]}" &>/dev/null || (( countIP++ >= 15 )); do echo "Retrying ($countIP/15)..."; sleep 10; done5��    b                    �	                    5��