Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6365269D6
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 21:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383512AbiEMTFX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 15:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381130AbiEMTFV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 15:05:21 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70099.outbound.protection.outlook.com [40.107.7.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C595995DF0;
        Fri, 13 May 2022 12:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNqlKGs2TisjEIHRwdmiVN7f9WqnE6/DtinMmrk1KLvP24I9SP1O3KB2qAJcQnQvn2rRyHZ3CSeVRvDHkAaFN5ulXSSU4lb00Zx2XApnVQfIYQ+tm72HxAKPU8X/Qw2V8N0mTL69BLEqw/ny5IUoZMRe0GHeS7NlFWvsNnJtKMfYXYgQAbcmdR3Knh7hnjNakKLEG0VehBmrhyTGU5AYn+TrgPuUaMpOrKI7eGUDJCp5v/5RhIHYxv+IRdTBWc96XnU9vAo0ZawNECxAtORywqzCOaG8JWUp+PPW2QKXR2WWp+g/3D8U3vanCWm4PvG1zsUZD/7IR2khr30LOEwczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lai4+1cEnbLJXwpAHWLblRsB1VmzR48UTaLI9B45b5M=;
 b=Y2H+1qtDuvWe79cLb4fziXhwRwdk0RlztCE+BfRnVh82ZaqDbdNDsffqWjXaUmfzgKF/qhYVYWre2/3WiCOHL06lElewjEKorN+6fOj8NPzaZkqzQVQ7by1sjRK4DQsMSximicF7UkR9gwx+V5rnw9aa3eM4GVALFGqItMjK4blcWbKBlgXuDr66LjBDd9gcQ7otMg44/VElu4Vz9sG1KbIoUooRjA41kfYcTP7I0JlZkYieoTzZIX2YkV8hWsnt+aBwIoLsGiCQf3NrtbO0KB8iTYkyU2rU8Zx9YHnYRT5UpiQCYfY78UkX8+FvFYpMT5m1zZkOhoilQqY1MryZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lai4+1cEnbLJXwpAHWLblRsB1VmzR48UTaLI9B45b5M=;
 b=h2G0Cvk87O6c+cp9+CBkcF5aPVjB0QzK6HA3u89Zkaw+OXG8n8aq4JXNhUBjjdoDtC73r7NqGIYPP9mtxGSVVVMGNk21UAA6aDWzqF8WS4tleeQ5iF3UXXFrcaNyt9iore3xS504RwxgqcrriC8QTiBI8zCud9oGWhBZ/4xzx3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM (2603:10a6:206:1f::12)
 by VI1P189MB0303.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:33::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 19:05:17 +0000
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e]) by AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e%7]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 19:05:17 +0000
From:   Kyle Swenson <kyle.swenson@est.tech>
To:     pavel@ucw.cz, robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: [PATCH 2/2] dt-bindings: leds: Add aw21024 binding
Date:   Fri, 13 May 2022 13:04:09 -0600
Message-Id: <20220513190409.3682501-2-kyle.swenson@est.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513190409.3682501-1-kyle.swenson@est.tech>
References: <20220513190409.3682501-1-kyle.swenson@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:303:b6::23) To AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:1f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8f750e-f57e-418e-74e4-08da3513849f
X-MS-TrafficTypeDiagnostic: VI1P189MB0303:EE_
X-Microsoft-Antispam-PRVS: <VI1P189MB030315A40E85FB65A6180F56E4CA9@VI1P189MB0303.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eY5eNJUhwrgaoM9vWr78z4SnR/v+rREyobc+w+2kDeXRbWxKSt/x22kTaJT08k9nX+17UyjsCYJU8uk1Jm7URVsbNq0C6m+c9qhwk3jnbea+60eHoROipWcAWL+MqgpgjCP1v2mbldY9M2ZMTGWkpJSg+0i7ISmXsfZCDCSlyWyfE8eJM24WuU1WnU77qHt3l3zwxmBFjGLUwjmPhw0O4JxqUHk99q6P15yamP9cHnGXDvMx1NPJP1q79nf5Ae1JstBFjbj81wWUsLz8TDIe9R6Hc2rbw7vOGNV32bKUc/aYSO5TgQBJhciyHnWoYCIiMnYyJ1J+hLlvOPmfaIF8qH/qtGrvnDWU5oYCqa5milJYfQZX1SfgP5Kl/bU50bY1DRLCOkUi/+7Ie64MIxegPd8mzCDqTJlb/cHHGmEOWbceUmdNbi+W7yfigNoA6oFxeAu16kvhJgheccse9wcIng6jEF3l/7D0/TP9U+cWkRirEdPwxIBcbOhQmDxOnTmGTVQWakn3ifMQ496ykNdo2ETSNZ+A+YobZg2OYTSgnt6CH2NxMUqJht/q+LOykf92HY6OVV4rvSes3jy4Tex7eqfg9a0cmiDuvu0YKcpoNgQrlSNStXzuVJTZAkPfEzO0REI6eOnTDwpxtmP45JlvTv5KymdszdOnsedGvTML81M+MtYZquoejGyAsmu7YMb7iuPtd0XJ8JbfiMlrUXs+/+36vQzo+yffu8mc5YSeHXxgFWThSWFeFKUN2ya0eEGQbn+Ph6ODczwbQQ9B7PnkZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5P189MB0275.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(376002)(346002)(396003)(39840400004)(136003)(366004)(5660300002)(1076003)(36756003)(6512007)(2616005)(4326008)(44832011)(52116002)(6506007)(66946007)(26005)(186003)(6666004)(2906002)(66556008)(66476007)(8676002)(8936002)(6486002)(86362001)(966005)(508600001)(316002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SLOvlfs4DoUxBz3SI/aVaLXH+kCs/tuti7NZUMIEG/Gy/VZ/X5jzR3h9OTLk?=
 =?us-ascii?Q?JqkNuxmV0agh46adS93olRqFo/XQtkLuEjzimhBvIcqa1UVgHSJK4jKvFHGZ?=
 =?us-ascii?Q?O3rRcFmHRymgxDK3ArgZYM2v0quo/1WW/WtwLNE4pyESDwiXsua1ib3xtAN9?=
 =?us-ascii?Q?klQTj0KSQnFB1xVXPcEyDCkZHY1jzcXQZ/EbJ2oPr0t17wSrnjU/1R6gNs6a?=
 =?us-ascii?Q?2hwCQOHCasdDgf6Q/02OwVxFDaEf5DZeFlbn6xo5LReQWEW7Fw0x+vqGroPb?=
 =?us-ascii?Q?OkqGwo1BJqw12mFgK4aHhurI6Ow+G6kzFd2V7q65n4YItT+z8nGarO9O5S88?=
 =?us-ascii?Q?yT2pdPD3hM+HUjNSPsigGIqrSHBOWrqimGW6Py+aMvQYYTj+SA4bd344dgeX?=
 =?us-ascii?Q?bfn2lyZYR0cBeJynKhkzSXXHyOZlFCxcNK8DNOkkBwcy/IztbFq9sGmitipN?=
 =?us-ascii?Q?8fgZqUBPWJx0+nIERTk1M3bwJ9lfLFRVKKagqbvTEis+EJ9enTHapZ6rauz/?=
 =?us-ascii?Q?f0NMqnfuQOpnq7C5qBosd8nrnOtnF5ozkVISUOp292lrd4UqWTgnVHE7dAed?=
 =?us-ascii?Q?0LJcqyvczvfKGnv2CHMh6+EPO0u2QppovuIhosR9wsu7qb5jWaLvqALN3riM?=
 =?us-ascii?Q?zu7gmTnYdPideN+u7jg1XXvQH++3cNXrmj9EiK26fIhPm3oMVKt1wwhh/nuV?=
 =?us-ascii?Q?i2FP8yzxBeUNaBHf0yXF6jxcco4kWLc2SIdBNHmcG+zWpbulZAKZ7ABNeiT/?=
 =?us-ascii?Q?yhq0Cq2F9W5kGWcnWtReW1ehe5T/iogwG8FdN9wHqt5vncSM9bptKOLUX5Ut?=
 =?us-ascii?Q?+frTDSLULoZuf/VASfc7agoR9vm/rXVoiNuAHfj/2fHoCoPW7c02x3m4gO0Y?=
 =?us-ascii?Q?6UHhOjlNx3RlHKsDHCIumje8U1eDRDOfJOunyNTx3q13wDdtFyv61SrIHD22?=
 =?us-ascii?Q?ibwEDOWb1f/wRA1uAPRI9/sbzGj8b8IMsU99q0B75GtndiTWcvNqf9Gty9yC?=
 =?us-ascii?Q?rNw5IE0YeOPGy7qVtU8d6+o0/0nGw83GYY4J4ob66c9rMtiYzj7d3Wjr4fNU?=
 =?us-ascii?Q?0izPpgElMp422rxuyrvM6X4w2t6rPiZYyzViKG3+aEaa5++z3dCEavsLrEFv?=
 =?us-ascii?Q?QJyCtQzhGe3wZZQqhIPHEb9hdHXZYvvH95mPgIsFAXYj+xa3xApms5x1MDub?=
 =?us-ascii?Q?ug1b0hLZTBHZueaZfM5EOiOeY5JXBfkZL01JGP2qbogOOPJN2bveFwTE4bQl?=
 =?us-ascii?Q?wfuC1eY9Bf6slJ5baHbBOfinRl/gYHwz0qK0StNevf2bxEeImmMxONvfESo4?=
 =?us-ascii?Q?fj4ko+M5/a3C+pSLRMi9iqZk++DjPsEr1vlTW2xw9pVaUIjbwQcbY1nK8nap?=
 =?us-ascii?Q?hEITuRiw8cT1StZUdLzqRWQmn2q60Sq0ed72ysHjsZ4NUjeVbB579P14rZMU?=
 =?us-ascii?Q?22YBmGxUEvsGpW9jWuuRcs/B1h8lpz5N53vcQ1HQZZijnfqFUuWOENt9hYhL?=
 =?us-ascii?Q?ffkAnx455/Cd9oZDFipUVFiCx5zA78UQ2kSMXcpAPrQ0b42S+7hdB27kjm7w?=
 =?us-ascii?Q?3PLUqHxXQN4r9F+vbUm6m7mcxTs9nojYnyGZY/hISuxuBa5IHpsB6nZw1coL?=
 =?us-ascii?Q?ga/YoEz3H4tYzbWQk0VxPMv18KP+dW0g7BA8ahkpdY4D6rBfEZ0cn4+YPgpb?=
 =?us-ascii?Q?kJmrjmAyZrm9HJJebFnNLHDJPrIX62E9R4ZrS4iHTrEdbbBJysjY8NlL67iA?=
 =?us-ascii?Q?G4M9jqamiA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8f750e-f57e-418e-74e4-08da3513849f
X-MS-Exchange-CrossTenant-AuthSource: AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 19:05:17.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqcAomwtLUppTAKgAcfkzcnaTbuIZIJeQ4hYF4XUm8SGObUb6nP3Egff4HAzm1s6Ea2LlPyrC/UBoAnrLOwizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P189MB0303
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device-tree bindings for Awinic's aw21024 24 channel RGB LED Driver.

Datasheet:
https://www.awinic.com/Public/Uploads/uploadfile/files/20200511/20200511165751_5eb9138fcd9e3.PDF

Signed-off-by: Kyle Swenson <kyle.swenson@est.tech>
---
 .../bindings/leds/leds-aw21024.yaml           | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aw21024.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-aw21024.yaml b/Documentation/devicetree/bindings/leds/leds-aw21024.yaml
new file mode 100644
index 000000000000..1180c02b5d21
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-aw21024.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-aw21024.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AWINIC AW21024 24-channel LED Driver
+
+maintainers:
+  - Kyle Swenson <kyle.swenson@est.tech>
+
+description: |
+  The AW21024 is a 24-channel LED driver with an I2C interface.
+
+  For more product information please see the link below:
+  https://www.awinic.com/en/index/pageview/catid/19/id/28.html
+
+properties:
+  compatible:
+    const: awinic,aw21024
+
+  reg:
+    maxItems: 1
+    description:
+      I2C peripheral address
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO pin to enable/disable the device.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^multi-led@[0-9a-f]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    properties:
+      reg:
+        minItems: 1
+        maxItems: 24
+        description:
+          Denotes the LED indicies that should be grouped into a
+          single multi-color LED.
+
+    patternProperties:
+      "(^led-[0-9a-f]$|led)":
+        type: object
+        $ref: common.yaml#
+
+patternProperties:
+  "^led@[0-2]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 23
+
+    description:
+      Specifies a single LED at the specified index
+
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   #include <dt-bindings/leds/common.h>
+
+   i2c {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+        led-controller@30 {
+            compatible = "awinic,aw21024";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x30>;
+            enable-gpios = <&gpio1 23>;
+
+            multi-led@1 {
+                #address-cells = <1>;
+                #size-cells = <2>;
+                reg = <0x0 0x1 0x2>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "RGB_LED1";
+
+                led-0 {
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led-1 {
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led-2 {
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+
+            };
+            multi-led@2 {
+                #address-cells = <1>;
+                #size-cells = <3>;
+                reg = <0x3 0x4 0x5 0x6>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "RGBW_LED1";
+
+                led-4 {
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led-5 {
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led-6 {
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+
+                led-7 {
+                    color = <LED_COLOR_ID_WHITE>;
+                };
+            };
+            ready_led@3 {
+                #address-cells = <1>;
+                #size-cells = <1>;
+                reg = <0x7 0x8>;
+                label = "READY";
+                color = <LED_COLOR_ID_MULTI>;
+
+                led-8 {
+                  color = <LED_COLOR_ID_RED>;
+                };
+
+                led-9 {
+                  color = <LED_COLOR_ID_GREEN>;
+                };
+            };
+            connected_led@4 {
+                reg = <0x9>;
+                label = "CONNECTED";
+                color = <LED_COLOR_ID_BLUE>;
+            };
+        };
+    };
+
+...
-- 
2.36.1

