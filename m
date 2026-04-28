Return-Path: <linux-leds+bounces-7884-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM9uHBTD8GloYQEAu9opvQ
	(envelope-from <linux-leds+bounces-7884-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:24:20 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C964486DF8
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED78A312ADCA
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5A543CEED;
	Tue, 28 Apr 2026 13:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hebD+Nsx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74E428859
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 13:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384759; cv=none; b=fxMHmwdsihpp7kFQpyAIpUVHB0WzF6wjBns1YreOs/yG2DpzkkUd2EIeH9qlia4auip/a8wm7+EuwxEF/pghwqK4SbhHasOLbBPEv04ooLcoQXPEofnn6/RcKTVTvniWHGNoGTE1b/pCuv0kFCHmkNhWZ8/5nw5SlBe2KS4WjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384759; c=relaxed/simple;
	bh=333uUG2C6Ne2A4QjGhhNw1YJTlVuEP5rcGs1oRWNx80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJ4jUlnV6O8VYvk/YXW1YLcEDIA7DBSSF4sIne5+tkcXdEuD5WGeZmALW5iOizc+O59ROzMw2d8BtHy8dcdLgjGqBRAGP7Dw4VcqlyxEnJ0cu15QA9m+Hrsx48HZZQ3DTQ536rV24OBcLYrTzx7+XGLGIXCnNoJ46ONbg7ZWuZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hebD+Nsx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso87914055e9.2
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384755; x=1777989555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3cNFpNsHWTlH2CArmHKw2g8Cqw++ZFKef2xJKHsmC7s=;
        b=hebD+NsxQMe3x9WYsfNKPvB7pEkhKl/mjUCnQRSq1SRkIaTwLomwxvwkyHj5pop1l6
         hmI/0S3+ftmenuPZnxwc6HtOIxLGB6ptjMVAXUK26jYUlWyxw3ytQ0oAwty9+V6KlhhB
         Mr0vhM3WkIg9jMQl+TvQcNP2q1LI7r6/5tslsX+kb1tUm5peq/ZwAU/8+BvR/zRLHdHj
         mBESegebOBj69QDlR7RBfOKW2nItlj8ooDFcdlu6gSxYt1pUYKG4PUM8/bNCGmEE0VNc
         Jv9hQ5d6rpghI3eGUJiGPFPqWg8lzkrQ9oCClqvQKIUh7pKyJEl2EtSGnUIB4WtaVSOi
         tA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384755; x=1777989555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3cNFpNsHWTlH2CArmHKw2g8Cqw++ZFKef2xJKHsmC7s=;
        b=I5c13BNFmrWFMuB/lc4mgX3l6x1PjzhIdDddKL2xqwg163TRj5C9qIYWKS9Xpbjcu8
         blpevMMv5JLp4PB0ZWPFp7eovknqYilywYITSsofKVIjMdjNxD2VvmssT2z0iEh2OfK1
         hdKFIlxrckWvEt6JGbgEkepo/GcWhpYQXsA8YEcRVIbYlK7iK2fC6oQTvVxYbXgrX0be
         uyFbbSDYTJQvDpt8hfCuToJysxZ0jpyntbx2ZkQkrsVBH4DwzVjnrF00kVZu+s0Q9Noe
         mHKBHXZ5XqJanzywNneHX1wT3E9X0jg2ckPtPgwwjAd8N8AR/3xnyAJ2ASOKschTlaZP
         gzfg==
X-Forwarded-Encrypted: i=1; AFNElJ+bdwIryghRefjEhshMIfnrohUSTR5U9UQJGK6oA3wVGYNalg3SuydtSuBMSzpME5jOkcvDGaj9yBMw@vger.kernel.org
X-Gm-Message-State: AOJu0YzuKBkv6hU1sFSO/Ib9JDSlxb745LiL7OY3MbzxPCPfJyhwoUs2
	CFsLnRK/el100+ppewH2H2jpD2fqFNimlNkQcFz1gLsLrNgOA6BRO8qT/UqYu6V+fiw=
X-Gm-Gg: AeBDiesJN8asw5kUxqAtoI8wT2nGqN7UB7RvHrD5i+Y+4ReabwH9O6lncVX0cvaRpvH
	IeNmKT7j0iJZA3enDlNG6f6Ru0k9WmHCfk0wiXzw9yQgdYTpqKk9Sm9WNq6W0BZaaP/rsdkSyK0
	5CnGKxAqkDWpv5LokvZyfXMywPfCoLvwLS/XUNZPzIoci/C7E4wkkOGJyUfJauLiPGz+zv3DO0A
	N0+KbLE8lfdInKNEuzkBi/x9cC4fpHjboVF05JfRuwWi/Xugv9i5wCDvLUUsxVH41SmgdGz3eqg
	8Fh1bZJD5dPS7oeko2D0cSc+OoklHozKHvb2P7V6e/cM0iUUoiZOzNg3sQ73D5epE2M9ezRtlwm
	D423IxeF/8hCeUEaGBRWUyQooL0fyYSm07hCKJxo2rwmAAVZcb1VtZGmoHon6oSa8oE80sdlb5z
	2eig3vrB/DjcJ+G73PL/haBxIwaH8thHL0V2aG/YIZFBgM/NjT0C1d/0U=
X-Received: by 2002:a05:600c:3507:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-48a77b1db5emr53077915e9.18.1777384755114;
        Tue, 28 Apr 2026 06:59:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773efe04sm60811155e9.12.2026.04.28.06.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:59:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Apr 2026 15:59:11 +0200
Subject: [PATCH 1/2] dt-bindings: regulator: document the SY7758 6-channel
 High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-1-0caade5fdb32@linaro.org>
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=333uUG2C6Ne2A4QjGhhNw1YJTlVuEP5rcGs1oRWNx80=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L0wK6EZCu2c15EL7r3pT23eeIFET1SCFmxKUwzL
 E4ZkWL2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC9MAAKCRB33NvayMhJ0X21D/
 9uPq2s4LaBUNeHgTZA6TA2qn8iA2HAkkGx+vn4HSGvvBXuk7CMpE6eC7Ib+dhvcNT6oN20/7nMCjiA
 l0iU6+x7sItuA8TueTBzkmSb6typOWrxFSMeEDPj7PPhnJNJOQXrEzVR5So4jaiUz19D9NEq+m2+Er
 ztoTSZNaNxbMAilz6bJXtRkhFTgrM7qsic1ZTLJho3d3LH7P0xWMBP2mY3bgw/7lF+pzhtIhYsEBD3
 9lgMXa9sbqm7UHbXePZ7uBDoYwMGeGK83+VC2SOxcTSgMdP4/1ox2BDC5niOpqayIKnfvB16zN873P
 rRKrjQg3aTnTWnoXG2n6eV0wDc/zowYZJg4BjEt/7scw3FqbDhniHS8QaYenAPcEt6VTwZIH6O7DDl
 zPkaa5NVUncIBKso8yhCRzxagqJ1bK9ju1hexM7qw5e4suNM7WBn5N0qKI3ym7Dgh6RbLU7iiVzhbI
 joVAwGp2Z7vBBMVvjV8FElPbXEuigqAp3e+daggvy6fgj6kc4/dYjatMY/EQaCJ7zlEFFZ7iDBiDU8
 9dI2lLspdfVJDk3XFkvsvI7ed1v7xvFc9Yunj4Lw0YGkBk289oBQO8AHgpV66DBkM1iTTs3S9uo5R6
 mJKYMYxqAgXmRILL0dPfslptoi1Iu6xMlinE9V/wBsEYNn1kbD0i5eT57gmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 0C964486DF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-7884-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,devicetree.org:url]

Document the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/leds/backlight/silergy,sy7758.yaml    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
new file mode 100644
index 000000000000..dc44b3b502e2
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
+description: |
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


