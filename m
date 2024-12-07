Return-Path: <linux-leds+bounces-3517-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360159E800D
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 14:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54378166ABB
	for <lists+linux-leds@lfdr.de>; Sat,  7 Dec 2024 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6701514F6;
	Sat,  7 Dec 2024 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEKlZ67r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487714F9EB;
	Sat,  7 Dec 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576697; cv=none; b=TmYwZCZs+Uz8xLOJJSmh9zosGCVDepsaMpCDbxCcNhvj+/RA2/ZGm7D1YG4F5P1BESYdAgZ874aX26u3yDKKOWjMiAHnyFfIVXPNsu3J14L3gJWgpkxWQTzjwBjiC2BVGnYcMo75t79Oub5pacQ8Z17YlsYwvnZd54t8Omyp8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576697; c=relaxed/simple;
	bh=a+ffvi8Pvp87P/1lPCLBagqzbCZkXpLPTrqcZ5m6KYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk5txY5DBGBShNmkqQMBipEUTh1oAkHQgGAGo2ArNgL7/x3Bv62eYNKfjPrCxc1maW4iEAbulBcHJ1Akoc/0GZmKOicrJ0VKRlGVqVarewKdVWHYfhu96KZEEzc43iEUFTNLAQ2I+P8C/jszNPFJ4oc4s0hvtLUWl7tHIK9LTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEKlZ67r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215c4000c20so30206425ad.3;
        Sat, 07 Dec 2024 05:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576696; x=1734181496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=mEKlZ67rVyl4WyQgsc+XcXPOZSogLvaY9CaKi+RFYZal57Q5KMZDhZiDxCxAAjOZVU
         +MGFsxPKvDo3BB3d2FibvBS5Wx+ln8G6oEjAAb6jRlz6kqEwugtIJjV7vNEFhszsoImW
         UpT+4Zw7PCNmL7/Wp8Fs5BE83xn5RkRo6Ou2rj+YQoAA2uRPiryjv20CgHk8s/8oS/fj
         iM3NltrexeVIn4nEH8QaKeNVWh2WzHkTNwOEfLOP8vqGgMzoht2bgsCtKp+2d9nJrc/1
         /HR1rlT8CbMAJ7OiC/kjE9K4pLvJJ93mYZu1qbGQCGgEaVJfcPscZ+/mMllo2kKe3CrF
         TqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576696; x=1734181496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI/+h7CCb9MgzwwHAdhpRI41/S9p/ThoHoKHndB4Jrg=;
        b=OSZU7wiw/uY8yWVV9c3JSm/6ON1+dkDyn7SI8eRg3iP05CeMb9iUnvwFLPWfRQkRht
         gpUxPiGsJjXvLZqKwYmDfj7qXvq1wKlco2PAWg31x4PkFUYohaVVj022SwybZcYwFhl9
         npH1WCpBJttFAHAWhAalrTNcgjto0BJg34DnCNPbRtb2Er7TmpdAS+DyytdcmFb7XW87
         XoO+NH1r/a4VZTzucM4KJ7Fl9ro4ugpQguQd7c4FWdprodifMnNFalXBPjVo0sWI4zR4
         SQ6PzSSenVrocehEOY5WIxe//VJGFtdrFCEczy4zJNhB7vSMeAeOPeYD1lDi2GwhkBpx
         6EsA==
X-Forwarded-Encrypted: i=1; AJvYcCViIIjUyX8Mr6Uvx1UAp315M/9zRpVcVNM0DSoH/YwTDHGFzhgU6xm+SFAAMqz+oskyXBy9xMePRNATJaQ=@vger.kernel.org, AJvYcCVs5uwsF/ClRw85yd3sQw7Z+7ENZlzQuJVQEwizNxLiIRM2m/uQL7nYcGgkGg7WSXxbwUFcWDUNYIEB@vger.kernel.org, AJvYcCW4/iao6BM+QM+QL/sUscEN62GBsIWSlmobMMGyBZJfi6QUxgqFLBR332KOq3Xd3LSAa04tSskcD0ehrg==@vger.kernel.org, AJvYcCWEnBrvATl1Pxx2msNmrDPLRHEPvUfSdwNO5nrDydjv17aaAwjkQHxoTyijnHX9ZdqMseDeE9EHdS1zZynx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R27jN5Tj1y9J8Wr5lyt2GrK+peqLEfY5rnlIzspZROmp1XAw
	CnbfOUsiUpbBBvtJqFW9bt6RQ3xolkQQH/KvAn2QsCF9VcLxtwqc
X-Gm-Gg: ASbGncuZPeHG0wOx8XglUN/Oedaqw8B5ExRpn/7hGdF1XZRE2Vwn2U4FsBHH8TZHG3y
	76XhK5drXta3Nkcv6UTXKlj/5D/0gZxjwA6WE05JMvDpA9pki/bVV1MF/F19/I1Hwoq369S/6LQ
	DmQg8wpGii2ypTIZkFT2xENhWumQh/s+1Lamwgc95imTkCYhyM9cQUKe4VtICVtCj9303K6eanz
	KrjNLvjOETvERcMiXKPrKR9+tLz7DVEZZkPmZlbaCwZn64zoiVJNiDFJwuJlhII1Q==
X-Google-Smtp-Source: AGHT+IHSBn/pq77OCjYDKU4tqjEmdqZd8B5Zl+VAbPbKPPsQr8JFMXWjlUkJ7t8BCQ5XsnHByPmm6Q==
X-Received: by 2002:a17:902:c40a:b0:211:ce91:63ea with SMTP id d9443c01a7336-21614d35675mr103444335ad.15.1733576695885;
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:55 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI backlight
Date: Sat,  7 Dec 2024 21:03:14 +0800
Message-ID: <20241207130433.30351-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207130433.30351-1-towinchenmi@gmail.com>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
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
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..9d4aa243f679
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,54 @@
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


