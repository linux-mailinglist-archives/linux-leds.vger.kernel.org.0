Return-Path: <linux-leds+bounces-8723-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ms5BEdDjPGpvtwgAu9opvQ
	(envelope-from <linux-leds+bounces-8723-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C977F6C39D4
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:16:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M4X0Eotq;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8723-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8723-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE2B230430F2
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC773043CE;
	Thu, 25 Jun 2026 08:16:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E03749EF
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375362; cv=none; b=UpTf1+l1UJT8o4ZkpKbLCxiIAbL5RaOziDMPnrHVj41ACWizsmrlvlr4OUJEmsB7nQt25UeMfToDUB+swDKQwa10oDJe2MF6vkdqqhyIOaeo8XbHwBf/MEBQvC4+UrlY2tZlwNwlchcYxmkvSKpDc+SWA0JAPEy73K/HOPfd7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375362; c=relaxed/simple;
	bh=3FsZ5EOWNSqtTNJo5ZjfqWqOVA1HZTXxoLvf10ooP8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2lNZqFHhrsFyenxfcp6gus1Q4eqOlbITcg48dIrCOPsw+pECnXcH8gGo5aE3kqj6OUO6rHRYa1NcCmRPIepg1TvGUlf7DQ+dgUTqihItFOyHPvc7Qpw7bz/xCYiZLV1s5uCtreRy8HEP02nU5jRJiL5L0tdo38L85fw0ssu1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4X0Eotq; arc=none smtp.client-ip=209.85.208.170
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-396779b9a7fso18540921fa.3
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375358; x=1782980158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AB/lGNPBN5uckN4odzlPN3QWXl6kpX4z3NWF2IlVP4=;
        b=M4X0EotqJ18M8yivbNAFyz8VbH/WXcLy46RK/5+aIMe5oS2C6b2pE8AsgZdaBvC0tJ
         vYJU1vQmD+NUzrygHOjxQYWmPhqtRgToBhbECUOBVkLAXaLtIiMlI8PhWNjqj6hP21it
         8GgygGJSjjLLfyZSFCqp5eWaagSgb/aPBIMQrEelKwgiXRBCPRM82AVeH4if1JTAEWdS
         w3Ya4KEB1NSnw4ewixI8zYivC6299ia/IbXVPY8QdWJJm61oaHJR2Uu9ocPNXn+bjc/Z
         fbHVHzFN8KL0iyRXmQ9T+gHI4sRAG20V4t6s8znBZrYX7KB/LP1d8aVaCV4swE72a2Jz
         d2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375358; x=1782980158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AB/lGNPBN5uckN4odzlPN3QWXl6kpX4z3NWF2IlVP4=;
        b=B3sv5vQ4wPJqTF1p4s1NWvmCPi3QoRd7eYsBuaWurLT1PO7HA1Cmjqh1r8xwloxQnc
         p7gzPPYaVHjEaWsyik0YV31tIt8H3POUvPq8mKjNJUacXqo/IG7EnGxoB4jPsk3yWgLj
         v+qKwsEXVoecX3BnNxsC0od+lmSvgARD4KPHAMfCHZNN4pFujLB1kExbZu2itlQHB/bQ
         YR6SEYwm2ssjhCTQeSZL+rgqKFEKhvAheXMwDJVOOvYSf3Kj61EVl97a/O1T30wRbFmy
         5N8nFIwYLcHdMW/2jdIpRILx0XbqwTPBAXMWksP/CHMN0VSUfhB9nCsa5OxdrXZil7YD
         Zevg==
X-Forwarded-Encrypted: i=1; AHgh+RpZI4OpQcdIOrfKGqmWkrMi5VtgtdLXnhHQ1w5S5NTpRMSyrqQsMuZTMIuaTsq5knmuCz/iJWImJMk+@vger.kernel.org
X-Gm-Message-State: AOJu0YySHGnWmLJYc47N6nUmyR53yfga5lkv13VOWkYKXUjcO68XKZ1F
	z16Po23hedaiJe8U8k6zKMyAEiXeC8GMftDRJM717RN2nP3MBuUHLB1L
X-Gm-Gg: AfdE7cmsC6mQGSK5XI5167vANH4kxaVwqNmwIjEs3Hf/Akis5HmA6Y6/vsq1hRWFyXc
	fXoem/su2qA0xlpg7DIag53cic/nlYWA5+5EBqVuCZ+2l6ZcgWVqjM84o83/aZQeXo5lOv5omB4
	u5fpaXK6yIB5gYcKE68LWxiAxZnL6zcZgriASeubDYsJUWj/0iU8v/TIuDgne/YxbXxDHzUZyxq
	RSxgLU3rpnQjbBQ9+oNKFEOzK1CGdyHuzkUpjnikB71NPxqpiATTZB0yJKp28haB2ZbJsJildc/
	gxu4Loq8a807AGCtqvPQl87gXAOMsVK5gReQBwkE4HEPLX85HVgT/YPNW5nZxgIz9mFNqAIdfpM
	Qtltee7ZSzQbmLI352UAZGFKhlAYhR5OA5PWIph2T0jjjDSxb/rUN81gzypyMRWvghPUCgSPt3s
	JPH02Lx6jURd269MOrkeiJRe7qZ9G2ZtqDKw==
X-Received: by 2002:a2e:9acb:0:b0:38e:d3ec:4f91 with SMTP id 38308e7fff4ca-39acb55f8d6mr2989861fa.8.1782375357649;
        Thu, 25 Jun 2026 01:15:57 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999afce64dsm39162221fa.14.2026.06.25.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:15:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v9 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Thu, 25 Jun 2026 11:15:23 +0300
Message-ID: <20260625081529.22447-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081529.22447-1-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8723-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:sre@kernel.org,m:clamor95@gmail.com,m:ion@agorria.com,m:mirq-linux@rere.qmqm.pl,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C977F6C39D4

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 000000000000..60b6375864aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0


