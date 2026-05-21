Return-Path: <linux-leds+bounces-8272-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AecImm9DmrXBwYAu9opvQ
	(envelope-from <linux-leds+bounces-8272-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:08:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F45A0B3E
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 10:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 910223015718
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C5E3A2E39;
	Thu, 21 May 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tcAE6PJl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E4539FCD7
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350888; cv=none; b=MInZuNP0Ev49ryhydDMKyrP+reKHwetmSUAladZdKA0/vsNDggczjiDdp5WU6pijUMJ92fjwoMBQd5e65fJ1hyyWszXiiv6jkXeY6ahI7fK5eaTF47eopHrNGTraFE7O3Vy3Abm6w7pJKK/nJ+yqkIcw6jqKGDkfXE7blCoxQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350888; c=relaxed/simple;
	bh=8cCbXbkb6HowjU8II83CA2d+DXwOgvOAWQTPrH5Iibs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQbKY6H5ycVVXF5O7mkaKmX8xJ/IkAcdEtvZqdZ8fHJBrJa0jG/iHX8xqzrWHpIe6AYdxOwEQSmFptKMEmDfYNRB+49npRnLezevTtKxG/sXh01S/6YUZB4YSQbIvYcwNq+ayQTFFQTvirPVvkgLTAJQU2tTY6SualmGkdOW730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tcAE6PJl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso2660590f8f.3
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779350885; x=1779955685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=tcAE6PJlXKeamfEINF5lEegA/8W7OmNegkVK9RY1phJHcCo5mXvweTnE00tkGxIhKA
         lUDFeUwF90pXQ0vMJIW9A+45sdfsrIA5kRhuSLxQFN8yv1pXr3xky9WxMePdkXmfOXVH
         6/VsLIvD4ZROpdBF39KRlVB0QbibJ71UV2f2EDk/AU+BVHyhBOE6JcaZQ5xCUXAO0/17
         sAla2WodXasGe01HAh0QTm0ZAw94zA1N4le17B/XUj593yeJ2cr8Immg6wtJKBqHghkl
         aRQ0JiisZPq3pB44/dZPWeIACDByrjSqNx+xjov1P9QUi4fNacs3VNhzjHez2FH4qWvh
         cZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350885; x=1779955685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=cIgDFEBXvAq7ln66K+jvZYQnelhkACbFuEZsrtQoxwcrikZNLq5xWUXZm2ngx2R74M
         VRilfQ9YFDEpDq7rOZeB2SdIgwSpeAmLU+BYE3CWWmzrgtAy6T0ta3hqt/RkB08qKUzY
         5gBo7C6aRy5nQD6BiFe/4V96DR4DPQFVjFOAQSaU0qZRSHHDhhpMWcpRi3Eko8tK86NN
         coilJE75d7yBsPuV+UMRTj3zPnhs36Mle5fW/r2eCj4WpGe2XYryRBoEd+sepyhFbWVo
         4OdYlQNqLzIAVHQwEJ5LtJ0QrolnC9Ws3dYPbKq2T1LRaCpZa7Haw5PBKbDYMWNUGjL7
         Q8XA==
X-Forwarded-Encrypted: i=1; AFNElJ/2nAZTMTs/ZDOv/L3Zb/SCVWG1DLNDnrYqHzQ65t01myq0zNrxTxCYk2slOtkoxBaNKrexEUP93v30@vger.kernel.org
X-Gm-Message-State: AOJu0YwjZElDm132Ah4l5LAKOcSIffXVSPI9GtXI1Mv4FerjVIaptDot
	PYFQQWKPu+w20SgNfalSEfsXbN8GbzSfQXxMoagJEKXzCcWIUEHRdtwxll1DVhX7mxE=
X-Gm-Gg: Acq92OEnl6pWnFphrfuLFAi5VBn5z7XVy9TSrFg4ikMt2y9k+Nz/bNDdIoBKt/bWb5f
	4hYkkMa0wcrLz6VETjgVBZZdAqvXQEg0K7Fcw27LQO+8VwwLI0HJCL/+9ikTIsyseaG15OhCCsy
	7IDq/uBfJ6Lgjp8DS7+/cCj07+yxat7soRzTWCh4twjOJN2YRWGxog2IOeJtG7LD78Qv/JVvdxx
	9CdqHNJVW0NDU3jIE4scX3TL2lAdI/iKbiHC3aTMenjgik2WI9cRWrBwa/4p/lqaGSXQjN3eNQb
	yHP6TyZhMmtCCGsOX2T+maSMCLdqCk85KkpwM+CPXZ401VgJX1ACoAijJW+nhloWqEFDSaeW6bx
	HgGQY8SXvKjgVmzo3GHvaa32GD0EZKeSDw5eSGZJFcJcSPB4vzPsq9UENbfb83PB5fnJSNuQXqO
	mgL9qNjgISGPdTCW+MWk/41aG4QiZ51IhnH97LP97jK0+xIaqAuVB/2eA=
X-Received: by 2002:a05:6000:2908:b0:43d:a37f:8d5c with SMTP id ffacd0b85a97d-45ea38c6abcmr3068464f8f.17.1779350884569;
        Thu, 21 May 2026 01:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca4esm814369f8f.22.2026.05.21.01.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:08:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 10:08:00 +0200
Subject: [PATCH v4 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org>
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8cCbXbkb6HowjU8II83CA2d+DXwOgvOAWQTPrH5Iibs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDr1hbxFzE0LGxpw+DnlzsdozjsO+qCoWZ0ZTpcTy
 q+M/nAeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag69YQAKCRB33NvayMhJ0cCzD/
 9P0KBP/zTJ6nGmlwjWlNwROl2dERvX/SFSbXnIEh2rA1eW3NB/XqDkGznJ1xUIeVRX/PUMAwqYtDhZ
 uFwnR3PQ3qdx2nJ1BopB/+0SkUsN1uqay5VJz7hE61ypR+oKJHcgUxPOlMUlFznO7UgvWzc/x97H7R
 01R3o51yWvAygLpWkS1vbypHAEGZU2C/j4AyQT57b0WuL3f4hEDzM7jWMKJzAqwpDg1EZtdDbTgg3H
 boZhlwfW0zRk3SayixjO2+tLbWLXz16sSo0sRPKxF637WkW+tV13pX8mr0LVnt1zfm1J9WCe0ZKl3N
 24tBVKzXLTWpYVHdozTtdMCdAbSGBE4xdcXtHJrmydWLKI1mBh2/yldsY19AzPYykP4fT7tzabROpu
 f4g4e+fBHtgJXMGmgFoW1vQ7A/oVB/MDSX30VRoLwX4zgBCDvC/pbRcvOrnW3o7v1bGgpsu8IqsglZ
 5n42enEgiWXwE6+j/CxviJ8Zj/d1BQgiZKZFDhPZspOb8e9CxMIE222CSBpHnkKbg/p2ZKd8Fwm1HV
 2ZmBmYMlUIi0wrnBmESs6NBv8ATuYDNPknfM6Uzx59DLTVRcCyP2IOVlHNz9MbXo0ChPa5bJSV/wnW
 Z0ntz2XW9wV3yKoKqwGpfyt+hFq84JqYgXZlM0wUzlrIVr6SPHqtcFk5lr1A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-8272-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 389F45A0B3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/leds/backlight/silergy,sy7758.yaml    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
new file mode 100644
index 000000000000..80e978d691c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/silergy,sy7758.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SY7758 6-channel High Efficiency LED Driver
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  Silergy SY7758 is a high efficiency 6-channels LED backlight
+  driver with I2C brightness control.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: silergy,sy7758
+
+  reg:
+    maxItems: 1
+
+  vddio-supply: true
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@11 {
+            compatible = "silergy,sy7758";
+            reg = <0x11>;
+            vddio-supply = <&bl_vddio>;
+            enable-gpios = <&gpio 16 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1


