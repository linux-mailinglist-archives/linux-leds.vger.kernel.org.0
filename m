Return-Path: <linux-leds+bounces-8824-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ZEOM1dURWpW+goAu9opvQ
	(envelope-from <linux-leds+bounces-8824-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 19:54:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E01C6F0743
	for <lists+linux-leds@lfdr.de>; Wed, 01 Jul 2026 19:54:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l5EPRrBA;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8824-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8824-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2F793007670
	for <lists+linux-leds@lfdr.de>; Wed,  1 Jul 2026 17:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B734BC028;
	Wed,  1 Jul 2026 17:54:28 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BE391E60
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 17:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782928467; cv=none; b=P0+pvMQkPnpEuYWBg4eLw4So+xXie/GLLvjq7ATj2UbRHh38gIKXBlt/EsK9XJE+TlMjW5+PloqXk45jpPoyTtKz6+KfZXdlJSCH7CQaaFCVGgfvBBUm7Ab2PUvy+0Yq5XJ6SdfGneby1M89jQE/OUxZOa+Vbq/Qvabj3wd5mH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782928467; c=relaxed/simple;
	bh=6E8k5VxwI2VkFCTXdhxoRdw/vQRq40ak4JPvNoCQIsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BHS4Q0vRR2NjZ1qOlFZsLcCEF5fm+WG2QkWv82DUVCehoIittwbvVfy/ye28sT+cJCBV0bmnwgAhxPfz62I4qpuf599PjQcMgoVjqb8tThBamLKBCv6lD+iBdJ3Smgjfsx0rvlGSJ3fupvSKZuL3UbUbZuYcy7EtPiCpCGQzmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5EPRrBA; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37ffdc718f8so636983a91.0
        for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2026 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782928466; x=1783533266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=l5EPRrBADM2k23sL04kQ/Kvhvye6nUBeTWbqShS6yQHnNOpgyy9WJEbRsbGYoodAW2
         exnY2k2VvAgzIMQlsRGi7qST3vUZT5SFOqWF7ty94rm1ussqUdLtGCPnxCyCRrobw5MJ
         u1j8fafxMH3XHu2SdUxLWTnJyzm5aOow0Tb1Bts/yarw+piGzfvTEHLzNMttZ6F0BUmI
         7hZpJ6pPDOkaymF0c9bJ4+miyjA0SfSoc9eow4lzIvKKunaexfCZwigPMh23HvXelyLx
         FzpoQ/4bohAEdUxi7Fdk5CIE+EgP1fapo7j9aIrzrMr2dK37j2OgPFJcb+aZCo2Zwi8n
         3jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782928466; x=1783533266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktY7hjlneyiYSm17AS79Wobub2byOifu7tLzvn5nKtQ=;
        b=C5as62xsNUW3YMxKXqHxdTVWQhZL0Hzo4gEqn165o+bfXHfeeYqs+JC5yILlq5pzDj
         BLuYOdV0EeKgC8N4ReG3HQrkbrjJbh0kDoZEvxgiJgqFRr8HjqOwo/dKL+OBK1BH0o6Q
         M/hcmHYmQHetqa8evjBbRWxgIuzgwhDNDPV8L2SfVrJsHfVSiuFgV3L8I20RyWlfxkOc
         wP9KGYIaoJUbHfzDpWxhx4XGbKiOJ9eVOjTOvbtqqsI5caV5F9+ZtB+XlU/SWEp6D7EG
         vtLz8SMvn6S6TLTszlmjJqhSYs4IIrLiotB6+h8L0nw4plyRQPXfflNGGmy/EwBk8DFJ
         L8BA==
X-Gm-Message-State: AOJu0YyO1GNbPbTiBSBVss21haWAukNgtYns/1jzLYsR/193QRf5EBuU
	RVGMb5L2xSHtifuQb96VwvBcmVNr0HMUHmDWTjDGgPmLR/6RsdtFiS0ZdqkkWDRX
X-Gm-Gg: AfdE7cnGrnYhl4Skt+UlkR/U91R/e9TGNAlbumyDJPwdsWlWfKm4TDK39xvmDEId1AP
	lFB1L2vw0LTXMIxOEM3P7Z2gBCODgYcKLPExqEinMVR4u2IcRtXnD8QGns6lUPCtlSg3xzlTKTY
	rvR/1x+L9gRQY8jXm6Nq8AXJaB/qxpgqZ5K1NtD1T58RZLth4l0ZXuvlbBan6/VDR3Ki5NdWhtl
	Tm+aLr+1T8Y1vxDfiwTSXRel2JdAZ9xZBehMAoxXHuRfgIedSNTkKHjOnAMKywV99rXCkERLHn1
	DLnwaFRl36hnR3y7fVi6eXHTrzbAA93qOsraS/mq7kd7jFfBMKRMFZiitAB5KaXx2NcYOPqkGHm
	qF2XW9gL3BOrjWUhirXFJD0W2osM6bd85Ng46fJN/NvP3gsB583r1k8/OZ2LGEzHUV7O+80W1G0
	wUSy27fKVhhGLyjg1LRmHCl5n/JcCgEd0GpSfo824V8PZz+7tYKykFccEe0mJfvXrzzJz1
X-Received: by 2002:a05:6a20:431c:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3bfed1bfa15mr2855302637.10.1782928465900;
        Wed, 01 Jul 2026 10:54:25 -0700 (PDT)
Received: from fedora ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm82300eec.15.2026.07.01.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:54:23 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Date: Wed,  1 Jul 2026 23:23:30 +0530
Message-ID: <20260701175330.1645927-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8824-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:me@brighamcampbell.com,m:linux-kernel-mentees@lists.linux.dev,m:skhan@linuxfoundation.org,m:ninadnaik07@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,brighamcampbell.com,lists.linux.dev,linuxfoundation.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ninadnaik07@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E01C6F0743

Convert lacie,ns2-leds to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 .../bindings/leds/lacie,ns2-leds.yaml         | 87 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
 2 files changed, 87 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt

diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
new file mode 100644
index 000000000000..679a618906d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-GPIO LEDs found on Network Space v2 (and parents)
+
+maintainers:
+  - Lee Jones <lee@kernel.org>
+  - Pavel Machek <pavel@kernel.org>
+
+description: |
+  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
+  modes are available: off, on and SATA activity blinking. The LED modes are
+  controlled through two GPIOs (command and slow): each combination of values
+  for the command/slow GPIOs corresponds to a LED mode.
+
+properties:
+  compatible:
+    const: lacie,ns2-leds
+
+patternProperties:
+  "^led(-[0-9a-z]+)?$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    description:
+      Each child node represents a single LED
+
+    properties:
+      cmd-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the command LED output
+
+      slow-gpio:
+        maxItems: 1
+        description:
+          GPIO connected to the slow LED output
+
+      modes-map:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          A mapping between LED modes (off, on or SATA activity blinking) and
+          the corresponding cmd-gpio/slow-gpio values. All the GPIO values
+          combinations should be given in order to avoid having an unknown
+          mode at driver probe time.
+
+        items:
+          items:
+            - description: LED mode
+              enum: [0, 1, 2]
+            - description: Command GPIO level
+              enum: [0, 1]
+            - description: Slow GPIO level
+              enum: [0, 1]
+
+    required:
+      - cmd-gpio
+      - slow-gpio
+      - modes-map
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-ns2.h>
+
+    led-controller {
+        compatible = "lacie,ns2-leds";
+
+        led-0 {
+            label = "ns2:blue:sata";
+            slow-gpio = <&gpio0 29 0>;
+            cmd-gpio = <&gpio0 30 0>;
+            modes-map = <NS_V2_LED_OFF  0 1
+                         NS_V2_LED_ON   1 0
+                         NS_V2_LED_ON   0 0
+                         NS_V2_LED_SATA 1 1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/leds/leds-ns2.txt b/Documentation/devicetree/bindings/leds/leds-ns2.txt
deleted file mode 100644
index 9f81258a5b6e..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-ns2.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Binding for dual-GPIO LED found on Network Space v2 (and parents).
-
-Required properties:
-- compatible: "lacie,ns2-leds".
-
-Each LED is represented as a sub-node of the ns2-leds device.
-
-Required sub-node properties:
-- cmd-gpio: Command LED GPIO. See OF device-tree GPIO specification.
-- slow-gpio: Slow LED GPIO. See OF device-tree GPIO specification.
-- modes-map: A mapping between LED modes (off, on or SATA activity blinking) and
-  the corresponding cmd-gpio/slow-gpio values. All the GPIO values combinations
-  should be given in order to avoid having an unknown mode at driver probe time.
-
-Optional sub-node properties:
-- label: Name for this LED. If omitted, the label is taken from the node name.
-- linux,default-trigger: Trigger assigned to the LED.
-
-Example:
-
-#include <dt-bindings/leds/leds-ns2.h>
-
-ns2-leds {
-	compatible = "lacie,ns2-leds";
-
-	blue-sata {
-		label = "ns2:blue:sata";
-		slow-gpio = <&gpio0 29 0>;
-		cmd-gpio = <&gpio0 30 0>;
-		modes-map = <NS_V2_LED_OFF  0 1
-			     NS_V2_LED_ON   1 0
-			     NS_V2_LED_ON   0 0
-			     NS_V2_LED_SATA 1 1>;
-	};
-};
-- 
2.54.0


