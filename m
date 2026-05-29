Return-Path: <linux-leds+bounces-8382-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPChGAHpGWpazwgAu9opvQ
	(envelope-from <linux-leds+bounces-8382-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:29:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24024607D86
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F36730C1107
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 19:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55D93AD50E;
	Fri, 29 May 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8mBNurh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A63AC0FA
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082596; cv=none; b=gvKI1ezpB7RN8u6qcsCG1anlg2g2ueHJ+p9PWjLnvpPlfHjOuUzdsfpydnsAph03qLdyoRYjFs4bJtRmzNUXtPNNQI9gah2UX4J5KwwVgulcnYGk1YeBsYIR5ZRYfI2rs1AbZL1heKA/tThTN5j7YDEH/XWgK8+K5baqSOGdfms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082596; c=relaxed/simple;
	bh=1lKQMpd6PjiypUs8OsPV66H2sccTnVhP4zdDuQTSTj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5ZOySNa9wvGV52xFWo/pdA/mkpRx346OE4gCH8jxYlwEU2pkmTwYnKmn1B5IOT5z+M8d7Yt1dVVA6x0gnP5TPFreQK+2s0/ELo52pg0dpe0VApXvyk3SHfK2/cfsFNkbIvKgNhsJMpJcR5Ex5OS1iEK591F/TcI3SEmbfipmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8mBNurh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso74316995e9.2
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082594; x=1780687394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY/pjFoVkR+l6EebkjB4dxdDrLLE9cCLnfyxSl7hmkg=;
        b=f8mBNurhZtCOdMOAUK20Ep8+l5bZaGig9m+PZX4B4+BSRxIfsJMB/gVAEZGcbge0zR
         MWLmpDBWzRRpGMas3vxqkaWoYaxRifKOMRqJqI1Ugqy5MUdcmzDR7AdrDCk8+LQN3ji4
         xclGGUWnfAdV0LBuqSPYlWuNx3rJOcIovZAOfgnuxL+KBrHBo4oLZSAClujUL4pN4UD3
         vJ6TTes+uBXZTN+TQYitRqQv+fTRDdAurYuleOSn2CDI22GS2Wh544NqhGlVASczOuDy
         VOUOlkML7Ly5RbvmI9gGHXSMC1uSa99hDb5YmNsfCgJrS2AurQ5cGR3ZJZpDWWt54veW
         42mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082594; x=1780687394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SY/pjFoVkR+l6EebkjB4dxdDrLLE9cCLnfyxSl7hmkg=;
        b=J3UK+6Jtn3S6erVFUMWcaJVxl1EXXnD36GNv4KWK1vdSJL9aXuuxgriAU3/jW5ZbXu
         92x2OvvTv1+PjuoYlHyRMb6C/xPBT3G4K6HMiv1MG4LJkIE8N74WZBKLKfVkfRxQT9Rw
         tenjQmhr/Rvv12aPPy9NNUnQjf9EmgajtP3tgSyP+yHM/hIgmrpyrd5FdTix4u3XmqHG
         ZPZwp1u/JvCBgBmo+X6bM44RY1UH9eWVx8LcimKeMt8jrHAYGQoOgUZ+hFj+j5WE5WhI
         uTHayPw5Ecna85vc0zV6wrBxAit3R0zJJ+emtdiaok3iQXnf7SxR6RyIMBMl1d/4SGLi
         QfiA==
X-Forwarded-Encrypted: i=1; AFNElJ9qtI/y8pBNpdQBJTbnxH0byfpNC7zm98t9zbXb2uGQcEsRnMPux27Q2Iy+eNGft/NLb40KamWGlfXP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxd42vE5IizHJdP0/2c1OObw8zpKCMDPyWpU9gaFD/aDoVxAHi
	0+4onb9q616Sipn+zAS0wi6Lru0BtpGq9qMYsz742B5aDPaDhSDOyGpax/M1pBQw9Gw=
X-Gm-Gg: Acq92OHtT00Qk64w+SF6Cqsgvyd4JPxtSkiNMmbxxcpSb4+ixXfj5b4pW00iXlPSxJ/
	e6mFIkNdlONhe/UovJIKTPiGFyFt9eL/DNZPH0F7YYdY/HyCtu9kkjbs1Z0js8gzb9o5veLzRhf
	8FdMNAr6LuySdNMdEp5f7KO5CerqvJKpapIRBLeTQmKf0D8MXaZMK0t/23oudAqHDoKNv+YNUBd
	aYL7L1AKqgRLfDi8S3fqYav+1RFNjUian9Zgir7dsevMEWa5f6mB1V2utL6BcIjctF82c9VqBSz
	9qTIxoraza75rGfaq3duK93z2Bi9jPRAETacd01Y+e256fhluH57GJusw20/5ky/IVGyCbNltf6
	TBRQxcbCIWp6taoK2UYqTqcnakoQ/a2jSfzNycotF3/YAmCnv4I/pKTQIlNnqKVZBxvyEu22PS4
	I0PHwoGkDLkIoUYwi5Mjf0ODg9eiMCiFY8/5Kwjt51MxSzu3zj2/YGn04=
X-Received: by 2002:a05:600c:1d11:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-490a291fa6fmr16006735e9.12.1780082593552;
        Fri, 29 May 2026 12:23:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm28692545e9.9.2026.05.29.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 12:23:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 29 May 2026 21:23:08 +0200
Subject: [PATCH v5 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-1-03aacd49747c@linaro.org>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1lKQMpd6PjiypUs8OsPV66H2sccTnVhP4zdDuQTSTj8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqGeed1GduH+zhZEZfWhRDG5HUSICoERZsYkY7py4I
 4iauz6uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahnnnQAKCRB33NvayMhJ0Ux2EA
 C2/rldx7AzNQpSI6oGa6TVKXBueQo7tV06QD4RVu5M7Wh9MF24Se+5JfvyF7UoQJTxxgQK+NtrjfcH
 1FCcYQ2fse8Y/gwVjrPhqu2zJt8Svau12tMdhq5moU2Wd6A3q7O9/NsQYyTNeupEHACebcsaF+YVUY
 gRbQOQUChV30r625YZQwO0pmJ6cBuF78+RkhMtCl7faQTPyKCysz7aZ0DuJBL5fAnfCy+uZDMIGBDV
 HLFFfwK/Y1WSzyYKpJcIgHRmRORYu9LFnFfxaL0hX671eaYbdwBuliSY1yupcFsHV5YEfbc8QZlnU7
 3XI5T6PCmGepKbP0dnsYHoEepvwO/6yOCRHGJWvHYsJTIhIvrtLdF62NVhla/THvFfe5aPu76SYRF/
 ghUz8m3kj/x6AAYEX6jJiwtYBqo91LvdW6YUq9Nze32GU1NIn87YEU/+ZXTqV4QBqGsrmtpAXOm2Rx
 lbsmgfBsQk2tort4Mb/VIfcxfp7/P6ZMeNhfOs5qHhvDAOdvco2UyhzBw90OyHEB/sFkphVKFeQIsh
 XPYf+aLToFFnJyYxDNSmSlxFP/1JYf/YJuXmGkN8Hm3oCEh+7lpe5ywqNl9vGqSRu44ufXoGQwaba0
 ZfYx3+mr/DiaIMm7DGAM2nXygeDCW3eI1c7gbrn7ulkckq9f2RptCQwwCkng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-8382-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,devicetree.org:url]
X-Rspamd-Queue-Id: 24024607D86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/leds/backlight/silergy,sy7758.yaml    | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
new file mode 100644
index 000000000000..64af6b34641a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/silergy,sy7758.yaml
@@ -0,0 +1,52 @@
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
+  vdd-supply: true
+
+  enable-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
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
+            vdd-supply = <&bl_vdd>;
+            enable-gpios = <&gpio 16 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1


