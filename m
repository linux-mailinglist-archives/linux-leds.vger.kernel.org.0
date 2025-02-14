Return-Path: <linux-leds+bounces-3981-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8ACA3557F
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 05:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A008B3AD28B
	for <lists+linux-leds@lfdr.de>; Fri, 14 Feb 2025 04:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7EA1547D8;
	Fri, 14 Feb 2025 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXqfRRlN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CF2753EA;
	Fri, 14 Feb 2025 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505849; cv=none; b=Tmqg40DYxCA2Zrvuj/uV0sAv3EJ/xifft1GinQ8ZjfC8457dfIKxr4ks0yKhODdbGOYOfBZrMMNc9b2yZQowXyLmTM4ys5PFgGA+KrC+RkvrtXyt//O6mfv1QNvbZa5OtfIJyPEqMUfllsPZr0UVgwMVo5PyXPUlVpU2loI/0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505849; c=relaxed/simple;
	bh=e4LCw8b9TArgBNatCS4iPLDcnxNGjb099gyuFiAoxA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csZECs5wXoQyx/nlHk2X7aS0g6upoDetrPDxJOC8O6yleE0WTZvdR8NkD/cT489dOXIHmv0X7zlA8LE3dzP5QZYoau8ZyRpNTvbbWVmtsCApvOK7TrrctSktmcsaEjXBPfSNHEx7k1NzxGXo7IKaXHAR8cSGqSwej0IMNeQFONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXqfRRlN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so26927185ad.0;
        Thu, 13 Feb 2025 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505847; x=1740110647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=jXqfRRlNvw0YrXRFaduk/yA7CdR/BhvlhjwHxEVkoglL1WoBH9uQtubIMAoMHZlo+w
         yNfkIIHFbCI996bOnmY7wFpWBiiLzAb9/hUMOnysOZ2SNhjKQXWvmingxvDZzyN1KEVj
         aCoo4CpSf/fI8kifzPDlPndTTAkYedrmEMJQBbW10WQQKKHwv4NM3GNCZ7fEXFf/CgQR
         Kcqq6fuc3cZ66zNs1nWAqGwBVgVMOOmLL9a3KY8x6VlmpWxRqDLaaLkF9/9ioSR9x2A4
         08ccpy0S8L3jJd5SgSflHF3GE+kBArSFPaXy2edl4bsHI7PfRGmEeHglMz/w24oDI5+H
         NcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505847; x=1740110647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=KqEqPTTMyxzIJZ28v9m6TMV+1+siqO+GEr6jmVtAvjkT+/PfGqWL+UN+5gVKloSckS
         8mR/c4sCjifrC8vbaINxnTqPLxxVjk6qqDPcFnBBqk2KlGPLfohDYxhSzqAkT7sROsFL
         hrCg8poj2RJBMDrG0OnW/ROmxeQqi2QLAfkkXPUO4Hps8oxkycWQ8w4hklK4C5kra82+
         lZVE9dXbI1PiAmWE2uN32n+sRThMogCMVdPgzTOrzJdsLDLtMFC7PlRu7bRYBZaESgWB
         /o4WseMU6Wd7AaVrVYYDp7hl4I+pRE4zhdOwRS7O2/ETRNu/Y/ZBNntGmT+OVvR5G56t
         dI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1Z57Ks6jYaaBamFF2ujAjSuu8AtatZjsstKkwCdL/Abug37BCnmRlIZ+keDDdgBLclb0dhojpUQk2@vger.kernel.org, AJvYcCWfX0c26+7XoZFPt8jyOZkwbek9ZjRtA/wLnA2NwIn+quq5vjkiXOmbMvnyWmaqFnZDoURVg4se8+4xtdZa@vger.kernel.org, AJvYcCXJOiFhp1HhWiG/WqOS167sXLzy8ogsXIghBMOwet7ucCy92poxkDpvC0Ggj9N6HpNMbb8jJ/LsYWyzbQ==@vger.kernel.org, AJvYcCXkgNfk3ScLX4joIlPvzmXGC39LX03NvkVbFrwb8802+LzsoS5pnwuBV410jmyABvpExlQkbfa40f/BXb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0WTqOF2+gN1deRd9J3SZB0Udb3SaZcZB6rNL/NO7DZX4l+Wy
	NZHVM4RejLwNRp1yO08FA/kgLOyw7x8EtU5aBEiD7vBeo0F5HVhA
X-Gm-Gg: ASbGnct09jQGVuF1lXUqvSdyRsrEx9wIU66R57/hKzHnHh+XFusYjBCmirqx8b5w+6V
	V3KguraXPHU00BSHlx0sKo9yk2UM7Cr/kdGrS/e59d9lFxGZXtMNTOLhNpMgjG7gUPhcVt9wT5M
	8HCqy3pIG1WYctNVmVPJ+bipkLtLt5US4ThycAfZgsm5FwFGMNh11g3rW1Xyez+cqTKHnDoKGvB
	gW4e6WiFBZFbVssTluiDSs93cwLqdTHu1/Pr9CKx421ao7Xs51H+wIaEcl84MMmLG1xdhcI2qso
	KV0sxK6vkJEiDsU=
X-Google-Smtp-Source: AGHT+IGgz94u5dSaKE5PwBYaLjtoVurlg0X6dABIb3PB35R+FknVncdnfvcsPkYesVe9CLDNkNni2w==
X-Received: by 2002:aa7:8894:0:b0:725:9f02:489a with SMTP id d2e1a72fcca58-7322c3f4d96mr13423478b3a.17.1739505847127;
        Thu, 13 Feb 2025 20:04:07 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:04:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Fri, 14 Feb 2025 12:02:12 +0800
Message-ID: <20250214040306.16312-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.48.1


