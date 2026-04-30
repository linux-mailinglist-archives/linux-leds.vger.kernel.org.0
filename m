Return-Path: <linux-leds+bounces-7920-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HA+Ny0n82mZxgEAu9opvQ
	(envelope-from <linux-leds+bounces-7920-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:55:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F384A04DF
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62C830A20AF
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 09:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5481402B97;
	Thu, 30 Apr 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eexJNnp/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50B40245E
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542446; cv=none; b=Ehpov4SDgliWvmQp4E0z62uHDf732uEzDHICoKseE0NkbunU79pcA+n8Wa8ueKm7r2QhcR/3qaPCj9UWrygrqIiJsEAXp4dPGtbAUJZECIqVU5n7Vp6Ep2wJnWyWcOsjxK273Li3skufuBtoIXt9reBMH2hxuPGx3lFj332ZtDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542446; c=relaxed/simple;
	bh=8cCbXbkb6HowjU8II83CA2d+DXwOgvOAWQTPrH5Iibs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5/kNoP6Gy6U6NtQRalAYLw+7YQgvKvdEGN9fQ2Ig6v4S88/vTvUAslaD96lz0cSSFd9itwk/nW2D1pNywrm571Ru8CXRik3tq4oupjjM0dL3bDLNB9g7Tqh51LX8yqHt4UrWDB5ZT6v5+gQIBBTCe6Dm4yCPP4buk52Pwptlgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eexJNnp/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48896199cbaso5953105e9.1
        for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777542443; x=1778147243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=eexJNnp/sIsC/fFZAoNHQobm+uaOSGYKSo0LeSjN3Yj0WNu5kLsD3rMeQwJ8t/N3Qz
         n2sVFDQ0WSZUIesK+vKyO672DN3GIwqNKwGY4v4R0rCOam3T+K1UgyXT6wppn+gBx47T
         +tXuQAipixDw53xTKHWCFuCu8T6sEJgRqKt+uzFRvr0Hfbp1x6nlRyXkI+Q2p+tHsaMa
         A0TRob2QnUpgkiINyoKZKVVlgPqQGCU8rnGhKnhq4r8yYPUnGquXG3RlGAo6mq71qu8K
         wwTE1LNLZ6L72sWQrhejI5QxhxQDENtpq25gSiyO9okuH0KXbc00QyEeZdJJFC6iKnBw
         FGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542443; x=1778147243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=deXs9Vaqf9aqg0cQ06fym2Li0O+N8EhsPaIstNWugpFcqpS3XLfodsObXyySAXJLar
         DO+dXQ+oqL0HCSc0EFeO58XGiNLq0/BeFgh0UG1+X8jxb14dhlRGUbdqmieXzy1mVPdD
         JEduq2hPfOviKahE/vNXE3yYkNqxIiX0QdIkEaibXsFMF8Ca5POrAoZsYc1htETJEd28
         zDiilBWDIepICQTnkzGOlJO+DyUQ8KWALkUD7nXAlbGlW2hl5i6uhpjBDAVM1pvmcGHX
         S5q8Z+0TQwmAvfLB1vw+pYTW5JATl3rr/GCQPZJQPvPNrOOlbvH4ce1S0qcUc3TFFH7k
         A+2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/FnOjrVVFuC0AaS6qEuPFfjiCM2VjfOnTgkSrP6c2n+9GqK3XK0kUvIjgw2mZPJ4L9I4N5TY3DVO6z@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAhSvM4ddN7U9VZvHpbj/3UVAbYI/Z9DiKxEhIC8SaY/4uBh8
	6rS+3SqiA/5LoqtgAFngSGCjFZXsYhkQpH71H3QF6LvUK97h6IwXpKHeHVU2BEEUaDk=
X-Gm-Gg: AeBDietgXXEmgPpe8QNIEJ5gM1BJi6S55BWY+vVjnRwKNi/zwbiQJoSVPSGMHvy2KKg
	tLwZ7p7kyNE6Adg9yyQthD/9hQyS8IPOC7CH3M62Ok7OBvbzjR3ZugxL37JkuEjLm/XVp6JiZS+
	ffS167CfZ2KHSdrFCMX8Gh8dof3iUOOjbAUSJUxJoGBgIGB4ItdxL8Fjz/mI9RSVtkY20fFvKZz
	DKS8lWz6JK9xYLVtx2js9LgTUKmY2tsNYf/jav/sfteZOHMyekTVcXRfd06GKnPWPKTCiaAfc3W
	ajXWi5IzBScX3S9qheWa0j7GYdYeNvqfTgQ74iGCqFhqRZIt/rXQUAGHDtYrjYdqnazbGW+yYRl
	+E0WskfzVDLqF/q5fezib94Z1Da9acRWEmPkJyTrS1QT9SOD/Bt63ZYCYZztn8biE5REkcYm5B7
	EmVLAT7vlw4Gto9u4ob666zOiXJkXk5OV9WedkfQkZJuGjeDfGaeeLPFM=
X-Received: by 2002:a05:600c:1d1a:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48a84458d16mr38530725e9.21.1777542442688;
        Thu, 30 Apr 2026 02:47:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b9493bsm48984745e9.0.2026.04.30.02.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:47:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Apr 2026 11:47:15 +0200
Subject: [PATCH v2 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-1-308140640de9@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8yUnzS9s/rNYIg4dn9FI8VZvUMuIuqoBd+WZtYZI
 QPZ3Z6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMlJwAKCRB33NvayMhJ0eVOD/
 4iGxCE+8I/QFYrllxJKnhUZFHl8HMTtdxoFG7PFzk+6AybCIPeTgtXhV628A+jBtobbwOmpa8lYmTw
 bw5tb0FkOZw/kL6p6ukGxjwco5q5ugX0hz9/FynTkud8ZA9audIzPz71rbv12BYNHSWZ99usLzVm7K
 DGQhfdRnczkmhK9O87HOO/dLd4rk/t6PRwYcy9WIKUawl11vZnvxePmBid56ePdc/JvP5+21nv+QtQ
 b9cH7qagTCEqGjMzbJKXMISqn4yYYQUvVww4UDmuUleN03Fe6F/4xzKK987/Z9+/8fbl2ZG+I39RB6
 wnwXNWQ+jDAU4r7Hv46jh2eriog2NLULu1KmbV5vtc87au1OYzUKjxcRmOPoVZgE8roCwI5apcZQri
 uC709c3kvzNVFIhLHnRomoTHAleHemKFNJobfAOaj0JGZE2FERK443MmcB20oKSNcl4EE8pV7wDpq5
 R9xYgmrskFChg35b6q0CygN7e1AA6Zn0Mnwd8b0NH251vrv8FZFIdMz3jCyUWkN+EtzHKXELoo7Uz6
 9mporJIAv7Sk8deTPHunmWbKkkdfUfFcunUPy3gdhcfFm4cqZhyAXV6oHB0Dra3jIhQqFf1fVK15QQ
 y4bGSD4xh54d5p5ngNo55iIK0Pr9Wao00VF+bLK4PUxzFnWYVVQjXKAxlDfg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 50F384A04DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7920-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,devicetree.org:url,0.0.0.11:email]

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


