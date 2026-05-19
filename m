Return-Path: <linux-leds+bounces-8204-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJQuHWckDGroXAUAu9opvQ
	(envelope-from <linux-leds+bounces-8204-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:50:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4B57A846
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9582309D957
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 08:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF86E3E7BA8;
	Tue, 19 May 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QswO8Rwi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2353E63AA
	for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180230; cv=none; b=E8m+vhUWAdQWrvuBqKqu2eJb1ce1jQKockjelRv004iMxXoyDKmvwXNRVKYSkz683zFmImWmpYmOCqtwgj/6eW5O+ue1ETRriUFkaZf0o6mAxWr5kmNAgJH85MOuYPvv4FVykKtqubV5glln9vwGh/hIYONTlf/ug/YLzybXL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180230; c=relaxed/simple;
	bh=8cCbXbkb6HowjU8II83CA2d+DXwOgvOAWQTPrH5Iibs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTlBHErt0sdkhApxAWZ7QQfYjlK8UMqeLY4lFS1SPZSX7T9Wl/fuxfZXE3YTohHtZiv5N3IpgpsaCqKRIoE/IHri3mStPqQ8Lc65ArnVj+OHq+cTVoSqq6hFsQ1kP4PK5wFg+zaz9AAB0hKhmfUVl2lAVbVTvzbnTcvQG4nDrEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QswO8Rwi; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so29302595e9.1
        for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779180224; x=1779785024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=QswO8RwiNxHnf+Ko/sHU9mdrH1xZd03JQ2jtagViah/JUdLeUUkHZW5+PKM+Axxw5t
         LsfZRjJOQK7P7CAavirOfUDfpGB2kWrRTZVraeGBj+F5GnLl1xMiXBt0twBjQYmM1ql/
         whDEgOSI6IX3GLIDfLaqm5EmT1Ys3BvEMCIzWRYLE7ROOriYeYBuu9Maqk7ClzDVvPEk
         vluBD/XdkJFx4euTLdJUiSbMc4HoL9P3UVnEqaIxmBFx+/+f0ELz8rEfn4YueTiUEP/T
         upBRC/CnAQ7IA6m2tnVdsbXX6cF4WOKIO2oUIuStt1p8uLkwCJJa8VwecOYM0rxm8ym8
         Icaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180224; x=1779785024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fFOILrRBRgckVtvDGiEi9gDf/W6MgY2gnxmqTdTmRWk=;
        b=RfcVuErV1G81nxdIsSa5W85T28izBzxcIGzwLAAmSweb8HFHRcW30DENAm2uSbVoZn
         Ol6wpsjD6BFJeHDa4oxTdCiH2KnclUMTXSiNDwvjOMKYfVFRfVfFpSW+gfFC5IMoC/vO
         7YuXSkcAgaIFn0ny+LgcSIh9p5sP8A/PJnQ6jl2B4vmG7wMQ0lyv2MtCdvd1S2/+EfEc
         K+f5F4p8NL10CF5v9BJGcQLTJ8HLyIYy1mU+VglJajxj1Hm1KG2RbjiKQGzIMpeDtvUE
         ikQ3ZkfY/MspNwdvncZ1k1BmaaqJCPqQYaqwonLYKeY0RFmolQJ0mgtMKIF5MOdJVotd
         MQlg==
X-Forwarded-Encrypted: i=1; AFNElJ/E5pFZ0pPCjPOnV4qZwxgCNEYUsonBYzBwj+UTCSBQQNZ8H6tvdvr/dF2UiVh0Hd40lbLHy3VUGsi3@vger.kernel.org
X-Gm-Message-State: AOJu0YzAo3dYD3QnqR3yHD/XRc0l5GfTnnYjs9MjTft4cLA+FXTBlL1h
	GMZKv9EVcrhkwK5e5RgDKEATW4unrTWG6b2NhHam9EW4jpathYYvP5bjoe0vNncS1VY=
X-Gm-Gg: Acq92OECZUlO8pc9QHLzvy+xTqPte/VXN3Ec0VtWiqfeQ96qzROBbepy5ddGjIp9+vu
	GJXHhScogvNwIcDhpaqhT1MLWtum/tvw/RX5ZoLZcGtaIib/n4b2xm+IQiTdUoBvbvL5b4k4NL5
	MDGuizlnUYlsqtiZ4KdWMUnehAPtPToSY/I55uzQykX1Dl/U4ySldfMSlWMcWQFCNKr0VPIMMtk
	nW2UBiIeYP4N90nEQfxl9ZndPBupBxDLAeU3Ab8rzZb6hcsW68yrJtIEeIa21j55LCIK/i3fYdy
	v+9g1BgSP0an1hSjLCosTDb698ngXmLW28tJeAdpsUcuFmqKSjfEr7oOYBbJ+rilAUTeP73aCZZ
	bW9H372qxTFICU0295VDAfJPP7hWwBExkqZhkCDfbrryeul0joIZ1VbyY49jEV06m9flMN1yzCr
	dLoE3NByn90imYA/EtU/CHH5E0OgH/Ho/nWgXR7b51jC8s
X-Received: by 2002:a05:600c:8485:b0:486:fa35:aef2 with SMTP id 5b1f17b1804b1-48fe5fcdec2mr293014265e9.4.1779180223901;
        Tue, 19 May 2026 01:43:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm47709855f8f.31.2026.05.19.01.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:43:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 May 2026 10:43:38 +0200
Subject: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDCK96WwH4hgb3wMp/YLCG0boCUSM8fPKp7kUCNHx
 leNu4Y+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwivQAKCRB33NvayMhJ0QArD/
 wNtM06BNVLHlOhCE1L1Qhmq4FyldFL2yOXfAbSOsnHWfnbxsf/NCSW5jx5Mn1yGLM8SYB+oj3Fb1ou
 U0bNBZDCeO6B4P1cI8VhwADxeew7DUQyiqFzuMzzrdgznPwsN4PqmLCXDcHeA0Ue6W3KY5IDYJvgc1
 5ZXU8Z1xY9vK6CXQGnz5FCbonIY5CUsJZWPI6ZdW83trF4lLb5XxC4h3J/xnjpT1Xn/cEvAHgiDfUw
 lsQeAh6cX1APzyzVUWz4esNhKEHkZcKPXrbM67DZpikLNfXbMq2PFodXyiDFf5Wqe2nOb7ZgWVKVym
 yGlgKnKgy1tFeNLrFUKKQpeLiY3x/FooJ8Y3Cc7dDBSe73h+MTWL5lRQnPOtJfMxJ+JwCK4ikJOMOq
 PZ3M0SEpU+IHaxSfo7V7cn0WD3l68dS8dt4S9BSdhbkdTWeFhFFlPpObn5DY4MYOt79OejVmFquhvD
 2iOpSUYFgBjy025KSDSuyL+ankye2q3M/l/PPU2XpvzM2kH9t7zc9wMELyq9XqwfG3WkhsTkPyxg71
 ff8FuNjTVwQH4/YyYmOaH0NX83RS6rHnmdtxpIYje+zu5ah5ea9pvGwtewgmqxIIZxqPg3JUTHn5bn
 RoaSG7rLlGwG5IaeXXCtMMAkWr5Jfy85JvVNmDkjb8VjJmNJJVYwHuXPZ0CA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-8204-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: E1F4B57A846
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


