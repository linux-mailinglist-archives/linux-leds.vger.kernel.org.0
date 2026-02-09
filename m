Return-Path: <linux-leds+bounces-6904-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UATBNVW7iWmEBQUAu9opvQ
	(envelope-from <linux-leds+bounces-6904-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:47:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE0210E521
	for <lists+linux-leds@lfdr.de>; Mon, 09 Feb 2026 11:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B833053769
	for <lists+linux-leds@lfdr.de>; Mon,  9 Feb 2026 10:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11D0369972;
	Mon,  9 Feb 2026 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ndko//IB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61516369218
	for <linux-leds@vger.kernel.org>; Mon,  9 Feb 2026 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633872; cv=none; b=dIwCtZeZIrI+CXFNeNLbyKdsgUIwMCUdTngDvfcGGhGjFlv5i1j3/t3zB2EcpsH+sAT2AbJeEmDw9rbY3KmFOM+44cKiosN0Fpo60+48mnDs+89SRJo0MlrJN7trIgVuF69BEhCJ+gAxod4cZKhWp7uCYLrNZ7nKrqULUqFh7Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633872; c=relaxed/simple;
	bh=LrlW5n+TfvOTYQQ1oHM2HINQqXlrDDVoUzaHz6OuCwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0wuTY0dw/CMe3i9z8FHbLbh820OOJX77WtGjaSkSou7eNT1nV0nc4hcOt4SOl1CVlqtyfsJkfSeZb11MXYmDhMf6xe6Nl5yVApUEqLdciLm250/GNgrzCkAaQBHtL0Q70fF+aHg8wYdBPYRhjo/aLCFbvHQLiBrd2f9EXoxsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ndko//IB; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-59de66fdb53so2584535e87.2
        for <linux-leds@vger.kernel.org>; Mon, 09 Feb 2026 02:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770633871; x=1771238671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRcfAUL2ICmQKvT/5ZV8//xYR9dZpc5jMuyeuAnPWmA=;
        b=Ndko//IB84vUxt8p5uDSr+MrGTrXRXofr0gO4O3a03KH6hQGLMIZKqV2HzU0Pj7P4O
         cKCaSDF4wXfDU4GB1lI7pwWxG4UxPf6ZrzP7oy1MlmjyGdS2ukbzhXNdrZHlwjt3iFqe
         mo1T0i//yefXghYxDk8x0OUGs0AcjCbHLJO3IVT9Bu1PIsDYgNwvNXDxzNYNqFyqFj3s
         aeiga+4Ss4EWtElO1ZGP7Yp6B8U081CKSa7158T2ZdpLqDV1Itbe54C4OxLrAISC9A7X
         9x56CUU4rJWaH55YdWE6tqHZGMh853AB7+cohF6A8hRmqGIJqBPBVCeTiy0VyaohTBrc
         aByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770633871; x=1771238671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRcfAUL2ICmQKvT/5ZV8//xYR9dZpc5jMuyeuAnPWmA=;
        b=bdp7DZWYJ5jwnIZR4FP/mClh0qlIKQ8M6KoOTts8eWw2HWJTsdopU7XgwqSiPvf1kJ
         XT9X5ObNP3BmmoQTebaHHmdR2/KDvwRJ1puX/QVnt+yPMQjSN1B2Il+bbTg4zDimNlfg
         GrSf/OipH2yoaZto5zAA1mQ/sEAIJG/Vk8xgPEcGU9BdSsLh1Cmrg5E6ZP2w8jHGB0O3
         qjmBCK9y3PdLSBMu03wvEYSmdpYXsBMTdmE/joFs7sRD5A17LjjmpHZWWwqMyQl2zZiH
         yd4l0FQ1EL+0aBg/YcDgTtmMdfYVjvGLX7L8kaNc9PNeeqcx933kdxXh6I5TmPgGJxYw
         BvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyAvXd9GT/X6AQ7RIUw9Ol8QpD94eyXns/ZL4PrQESXYrStUU29DRw8NkBsQwmqj/HwM5ZVAsiBokW@vger.kernel.org
X-Gm-Message-State: AOJu0YzCHylNPRep4two35uMeoL1vURW+ysTPfFCfJLGb4gD7ur+yZGL
	SrGBjtziI58TU+J5E/UpYXAYP1qgPSjY00bBD64NvvrtIQQCJ8IhxtcX
X-Gm-Gg: AZuq6aK/qg5HX5FcTnegfoOPjIYyeKs7T+hm7XUvisf8XKjRlkWuSDBKZa86doIjmpI
	0JCETHzWtTSBCUMl9eXM1qy8MwuiYOahcy5L+n/+SabQd7oma+MSdKdXis2knFzE/896JcbM8zn
	33FEKPu5uRWuTaluyWDFRJof9GPqiCxFZvK7oOGKYRKsHD77joRhDorN7LH1tiWwe/foPnq5967
	LiYFlG2F70X6rCpKiX/BgGGIBfMT0vWe67shjdF0LPkWWDt8HvdeiGd0+SQxWDc0m8y7Qb0HiMj
	8nE+jul+comPpcEC5c4HRIUzVxuWI3MamYRZcfsJkBxcjI9G+7XdkgeEohhUck7HBREuQuvP/C1
	k0PGGVW7pYXG3/+Ft6C3UnFehYXshixNhIUphraOaUG3Pi0fXsWQ2j8w7JkBOeFTmU3I8iO40zk
	l3
X-Received: by 2002:a05:6512:3088:b0:59e:4a0:ac5e with SMTP id 2adb3069b0e04-59e451733demr3569115e87.35.1770633870507;
        Mon, 09 Feb 2026 02:44:30 -0800 (PST)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f88sm2501469e87.21.2026.02.09.02.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:44:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/9] dt-bindings: mfd: document ASUS Transformer EC
Date: Mon,  9 Feb 2026 12:44:01 +0200
Message-ID: <20260209104407.116426-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260209104407.116426-1-clamor95@gmail.com>
References: <20260209104407.116426-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6904-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.19:email]
X-Rspamd-Queue-Id: 2CE0210E521
X-Rspamd-Action: no action

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/mfd/asus,ec.yaml      | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/asus,ec.yaml

diff --git a/Documentation/devicetree/bindings/mfd/asus,ec.yaml b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
new file mode 100644
index 000000000000..1d1a62761b71
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/asus,ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controller attached to an I2C bus,
+  running a custom ASUS firmware, specific to the Asus Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - asus,ec-pad  # Pad part of Asus Transformer
+          - asus,ec-dock # Dock part of Asus Transformer
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  request-gpio:
+    maxItems: 1
+
+  asus,dockram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: I2C device used to access power related functions.
+
+  asus,clear-factory-mode:
+    type: boolean
+    description: clear Factory Mode bit in EC control register
+
+  battery:
+    type: object
+    $ref: /schemas/power/supply/power-supply.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-battery
+
+    required:
+      - compatible
+
+  charger:
+    type: object
+    $ref: /schemas/power/supply/power-supply.yaml
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-charger
+
+      monitored-battery: true
+
+    required:
+      - compatible
+
+  keyboard-ext:
+    type: object
+    description: top row of multimedia keys
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-keys
+
+    required:
+      - compatible
+
+  led:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-led
+
+    required:
+      - compatible
+
+  serio:
+    type: object
+    description: keyboard and touchpad
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-kbc
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - request-gpio
+  - asus,dockram
+
+additionalProperties: false
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
+        compatible = "asus,ec-dock";
+        reg = <0x19>;
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpio = <&gpio 134 GPIO_ACTIVE_LOW>;
+        asus,dockram = <&dockram_ec>;
+
+        battery {
+          compatible = "asus,ec-battery";
+          monitored-battery = <&dock_battery>;
+        };
+
+        charger {
+          compatible = "asus,ec-charger";
+          monitored-battery = <&dock_battery>;
+        };
+
+        keyboard-ext {
+          compatible = "asus,ec-keys";
+        };
+
+        led {
+          compatible = "asus,ec-led";
+        };
+
+        serio {
+          compatible = "asus,ec-kbc";
+        };
+      };
+    };
+...
-- 
2.51.0


