Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83CC05ED31C
	for <lists+linux-leds@lfdr.de>; Wed, 28 Sep 2022 04:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232823AbiI1Cnj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Sep 2022 22:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiI1Cnh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Sep 2022 22:43:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21CE10B5AF;
        Tue, 27 Sep 2022 19:43:35 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S0DaQh028294;
        Wed, 28 Sep 2022 02:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=WAV2Vg7f6CUq/WnEQZXIQKXJMUc1AhCzxB0OWsDh3RQ=;
 b=FlouJ/E2BEmfD3sjQj5qHcqkx36V6u+vVwNt6J0rVMytK3KhCasOWdX89foZmugM6IP4
 /jk3liRZU1h5IwSR++1L70MB4kJ3Kw7EjJpgOYMPuXzaWTT9SS67JAK2dY3RvfAsEP3w
 uQogYp9jRCZVX3iUC+9YfD8vkcbw4KZt3q5k25LjjTNUD0nVUdnDKP+n14C1xA5oyJR6
 YjPYpo+nrafeeDjowOT4tiYALtaOR4G04Og0empZowT0l4y7TDZUVP3ecoD1v/rzcgg3
 AvJEP/GQQgMfC7rA0fjD3tladW/Cz9V7vfNVWyNHfpvJfOGPQ5DFfEv315bJDb/hi8n7 VQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3juw51ke70-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 02:43:29 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28S2hSwG018236
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 28 Sep 2022 02:43:28 GMT
Received: from fenglinw2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 27 Sep 2022 19:43:26 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>
Subject: [PATCH v1 2/2] dt-bindings: add bindings for QCOM flash LED
Date:   Wed, 28 Sep 2022 10:42:39 +0800
Message-ID: <20220928024239.3843909-3-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220928024239.3843909-1-quic_fenglinw@quicinc.com>
References: <20220928024239.3843909-1-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0loG-lmSJcDsbykBWY2Et9QT5LgU33J6
X-Proofpoint-GUID: 0loG-lmSJcDsbykBWY2Et9QT5LgU33J6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_12,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxlogscore=932 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209280015
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add binding document for flash LED module inside Qualcomm Technologies,
Inc. PMICs.

Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 .../bindings/leds/leds-qcom-flash.yaml        | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-flash.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-flash.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-flash.yaml
new file mode 100644
index 000000000000..52a99182961b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-flash.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-qcom-flash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED device inside Qualcomm Technologies, Inc. PMICs
+
+maintainers:
+  - Fenglin Wu <quic_fenglinw@quicinc.com>
+
+description: |
+  Flash LED controller is present inside some Qualcomm Technologies, Inc. PMICs.
+  The flash LED module can have different number of LED channels supported
+  e.g. 3 or 4. There are some different registers between them but they can
+  both support maximum current up to 1.5 A per channel and they can also support
+  ganging 2 channels together to supply maximum current up to 2 A. The current
+  will be split symmetrically on each channel and they will be enabled and
+  disabled at the same time.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,spmi-flash-led
+          - qcom,pm8150c-flash-led
+          - qcom,pm8150l-flash-led
+          - qcom,pm8350c-flash-led
+
+  reg:
+    description: address offset of the flash LED controller
+    maxItems: 1
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+    description:
+      Represents the physical LED components which are connected to the flash LED channels' output.
+
+    properties:
+      led-sources:
+        description: The HW indices of the flash LED channels that connect to the physical LED
+        allOf:
+          - minItems: 1
+            maxItems: 2
+            items:
+              enum: [1, 2, 3, 4]
+
+      led-max-microamp:
+        description: |
+          The maximum current value when LED is not operating in flash mode (i.e. torch mode)
+          Valid values when an LED is connected to one flash LED channel:
+            5000 - 500000, step by 5000
+          Valid values when an LED is connected to two flash LED channels:
+            10000 - 1000000, step by 10000
+
+      flash-max-microamp:
+        description: |
+          The maximum current value when LED is operating in flash mode.
+          Valid values when an LED is connected to one flash LED channel:
+            12500 - 1500000, step by 12500
+          Valid values when an LED is connected to two flash LED channels:
+            25000 - 2000000, step by 12500
+
+      flash-max-timeout-us:
+        description: |
+          The maximum timeout value when LED is operating in flash mode.
+          Valid values: 10000 - 1280000, step by 10000
+
+    required:
+      - led-sources
+      - led-max-microamp
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    flash-led@ee00 {
+            compatible = "qcom,spmi-flash-led";
+            reg = <0xee00>;
+
+            led@0 {
+                    function = LED_FUNCTION_FLASH;
+                    color = <LED_COLOR_ID_WHITE>;
+                    led-sources = <1>, <4>;
+                    led-max-microamp = <300000>;
+                    flash-max-microamp = <2000000>;
+                    flash-max-timeout-us = <1280000>;
+                    function-enumerator = <0>;
+            };
+
+            led@1 {
+                    function = LED_FUNCTION_FLASH;
+                    color = <LED_COLOR_ID_YELLOW>;
+                    led-sources = <2>, <3>;
+                    led-max-microamp = <300000>;
+                    flash-max-microamp = <2000000>;
+                    flash-max-timeout-us = <1280000>;
+                    function-enumerator = <1>;
+            };
+    };
-- 
2.25.1

