Return-Path: <linux-leds+bounces-3499-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2A9E772C
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28E2E1886DEC
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF062206AD;
	Fri,  6 Dec 2024 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POcMJzxI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7A8220687;
	Fri,  6 Dec 2024 17:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506092; cv=none; b=mXby3TUWhEHdiqP3jISZgIgbWGvxjbdlxQfF7yPZQAyG65ycTCKyPVC/SjAshA0JRCWnrH4TEqhTm7ivlFOgeXhhb86uCDNorczW5IRhefkdLMTvJCdLr9QSKmEV1PrCbMQNeJ/LetghJWs3baG9w/2D1psoYkih/G6boRTffow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506092; c=relaxed/simple;
	bh=qfw9yW8p9gRYkvburwWaazwJ4STlL9xuMWKwEqIvHLo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7jan5WIzn4N7r4pO9gBvxlAy8NihyHVgCQq7NkXA67kdN6LnzNPex+cFQy62/5w5IuKjVhaRClCJ/pj8eX3YjUAHhgeAX3EHkCUiubeSycADvaS/1q533wZsA3h2J66lVGT1kPguSkZ85soTnAUKHW4ie/CQjIvfIJtdoEeqP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POcMJzxI; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1511423a12.1;
        Fri, 06 Dec 2024 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506090; x=1734110890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=POcMJzxIvcfoGrN8zKdef/n3w2NAzCc8ki6Se9DO16m+bDuaMEN+QAFyn10UrSeSVW
         Jjw3+D6NYwlTOFee3koOFeOriUmQlJGutAib41aHCMtNr7srLS1cry1Z34I2QAUGwOxi
         7Iaeg2NCxV/QuBJ90iRs+n7nDYL3tcdDt8rRG7AcI3qcqi9gsMqyPvJaTfwbGvXUxO71
         XSafberT0vMe2JgEOJrXiFlEtDM2MCHGA5c+LYVA8KlZ09b3h5cL83H5wAkwdlwa2hWr
         mDxnWXgop3U60N1EvgtCX87RwDQ3Sv4n53n7bVqt4SqWmGDV4KZFGc7RlopyyjRFcHiu
         Db0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506090; x=1734110890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKs6SqWvOBPQFDy0xdKVrrMMEBXzqiAL0Gp7ECA7uFA=;
        b=cCwmUhk8yd7daJK/IVC1eU8l8iACVsQQYbAMpc6Y87jT0ehwdn+2HUROUplr7wIrdo
         DJmkzMvRkqhlwuf14DF1Dgw3coF4AhBsRKrdOVYMg7nNggJAlX4sKsUTAC+c/A+XyRpo
         PovACcdPtSYNCxHYs2ZeRa4WEChqwhJxzzd8eKnTybCxm2M7U6k+ic792gmh6xvoVGzR
         Q1s0hoHbJvHSct5P3dqKJqnBVpnG4dnv9FLYGfckSql5pRlP0I18As6w3ZGBB+cqT6eB
         Xis+RwIxQC2c3rd/ilyQUdlPi++PCQEg9ejjHZ/CBfVHZPe32qMsHzWvspWm4VoIG/Qm
         6S/w==
X-Forwarded-Encrypted: i=1; AJvYcCV0DF5QpAD07oH2ZbM/i58ndqUxtwP9TYulzESqcMTXHrD2EShLgol0k4wyHtgH+WVeeSiMnfZkzWztrDs=@vger.kernel.org, AJvYcCVg8xm/beJOaOG/Lgi++KAb5jxdpJkwArFfJ8bcrbUB4tOCu7zeqbMSnGypowLErFdps/t0/bVFEWm6/g==@vger.kernel.org, AJvYcCWsJOQbClYYF0wY/D6UvMt/6CxxYel3DGuE60blhbGHjtLplAnOt5qvZ0fl4mEO/NzbD9zzx5AqZiqt2Cpm@vger.kernel.org, AJvYcCX8Vm7fzzoV3e1p7MwZGPNOTVbiFEfQQyNYHp7LLu23jdBy9R0+Zb5oVEK0U9dgCwacCvXl8NaiSpxa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nikhLJpvdGRmhlMkRf6IMZP5RvFldlbKdsN1bUB75krG3RAy
	MJotByq+cQoUpcBaHH27ouX2Qn1bDNZW3CX0Hw1XjHp5s67s738E
X-Gm-Gg: ASbGncsvm0YN5NJmK35OTmUrxIrmkbmbu1hyzby2vLM89/jVQhKCNXtpjMEf4rXUUj3
	0PFMH9Tb8VfQlxsjrkrcjP47YtkD4Lhb8GGeO2PTo1e+pObMAc6jVWDXU/w8zWWn0HoXFb0tM0w
	i/uqLMhJFGMyxWxAvAXJqRZm9x6xeJLMnePF1jX/8la0tXkhd3cESfqqK3GfQN6UZfmrUdLrbJu
	EgHACcnpBXtPrRJnV8EzrWz0Fk2kFcdPtHfuck5v7E2PJb3z4L1mH9FRXNiT+n9
X-Google-Smtp-Source: AGHT+IHkO1RmdNJpR/98buAGJm0YvKeK4V7vOM0AkKSIB8tDWbwjkVo05dKTym9p80CfxeZrKTxMuw==
X-Received: by 2002:a05:6a21:9a01:b0:1e0:cc8c:acc4 with SMTP id adf61e73a8af0-1e187136d40mr5795557637.37.1733506089650;
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:09 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 01:24:33 +0800
Message-ID: <20241206172735.4310-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206172735.4310-1-towinchenmi@gmail.com>
References: <20241206172735.4310-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree bindings for backlight controllers attached via Apple
DWI 2-wire interface.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..fa3789b0b043
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description: |
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
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
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0 8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


