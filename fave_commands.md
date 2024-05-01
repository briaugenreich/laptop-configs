```shell
 k get hbaseclusters -o yaml | yq '.items[] | select(.spec.backupSettings.enabled == true )| .metadata.name'
 k get jobs -A -lapp=hbase-backup -o yaml --sort-by='{.metadata.creationTimestamp}' | yq '.items[] | select(.status.failed==1 and .status.startTime == "2024-04-26*") | .status.startTime + " hbase-" + .spec.template.metadata.annotations."dimension.sfx.hubspot.com/cluster" + " " + .metadata.name'
➜  2024-03-07 14:02:41Z iad03: hbase-dr-test-hb2-a ~ k get hbaseclusters -o yaml | yq '.items[] | select(.spec.backupSettings.enabled == false )| .metadata.name' | xargs -n1 -I{} hs-kubectl patch hbasecluster {} -nhbase-{}  --type=merge -p '{"spec":{"backupSettings":{"enabled":true}}}'
➜  2024-03-07 14:02:41Z iad03: hbase-dr-test-hb2-a ~ k get hbaseclusters -o yaml | yq '.items[] | select(.spec.backupSettings.enabled == false )| .metadata.name' | xargs -n1 -I{} hs-kubectl patch hbasecluster {} -nhbase-{}  --type=merge -p '{"spec":{"backupSettings":{"enabled":true}}}'
k get hbaseclusters -o yaml | yq '.items[] | select(.spec.hfileCleanerSettings.largeThreadCount < 2 )| .metadata.name' | xargs -n1 -I{} echo "hs-kubectl patch hbasecluster {} -nhbase-{} --dry-run='server' -p '{"spec":{"hfileCleanerSettings":{"largeThreadCount":"2", "smallThreadCount": "2"}}}'"
 k get hbaseclusters -oyaml | yq '.items[] | select(.translation.riskLevel == "EXPERIMENTAL") | .metadata.name' | xargs -n1 -I{} echo "k patch hbasecluster {} -nhbase-{} --dry-run='server' -p '{"spec":{"bootstrapTranquility":"false"}}'"
k get  cm -A  -oyaml | yq '.items[] | select(.metadata.name == "kube-managed-tables") | select((.data.kubeManagedTablesCsv != "") or (.data.clusterEntirelyKubeManaged == "true")) |  .metadata.namespace' | xargs -n1 -I{} echo "hs-kubectl patch cm kube-managed-tables -n{} --patch '{"data":{"kubeManagedTablesCsv": "","clusterEntirelyKubeManaged": "false" }}'"
k get hbaseclusters -o custom-columns=':metadata.name-oyaml | xargs -n1 -I{} k get pods -lapp=hbase-uptime -n hbase-{} -lapp=hbase-uptime -o yaml | yq '.items[] | [.metadata.annotations."hubspot.com/availability-zone"] | join(";")'
 k get hbaseclusters -o custom-columns=':metadata.name' | xargs -n1 -I{}  hs-kubectl get pods -lapp=hbase-uptime -n hbase-{} -o yaml | yq '.items[] | [.metadata.annotations."hubspot.com/availability-zone"] | join(";")'
 k get hbasetable -A --no-headers | awk '{print $1,$2}' | xargs -n2  bash -c  'echo "hs-kubectl delete hbasetable $1 -n$0" '
` for n in profiler-out{3,4,5,6,7,8}.html; do echo mv $n  ~/src/thanatos-balancer-profiling/$n; done` 
``` 
