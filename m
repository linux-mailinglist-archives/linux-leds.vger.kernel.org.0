Return-Path: <linux-leds+bounces-5513-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D347CB594A6
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 431681BC73D5
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12602C031B;
	Tue, 16 Sep 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS8CSB2E"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5F2C2361
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020560; cv=none; b=A5S4aXYlDhxropx8OuIwcgjyMppsb7cKH0W7DANC3MZ7j7PE8PEuTPzrUzwToKpNjQKLRe+yQgMvtGmnl8LZ8fbVWfYk2qX1tv0dRDUYoKxQeZkRsMytLOSRZBv2Krlo+M2yvVq3px4FW1C5blcjTS4Kq3p3lraSr2NmPFBhYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020560; c=relaxed/simple;
	bh=y9jnqLmE0N2IfF6Kb1ZTaozI7fYb0EitahVJY1Lv5CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWvnII+YhBdQ2Pvr99zYVSmWYwz0NTroAC+nOEELyTM0wwq1QkCSwn3fKannvUCCuwmpSTyqneygjKVepROTrmV79cuqn2TJ+el6UqlfYCPif3xaTzyg+U7eX2ZMK2S4mmLwDxxPhkHsR1qU7RlcpV5rX/04ukg7s/qxcHfg5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS8CSB2E; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-26763bb9a92so16547285ad.2
        for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 04:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758020558; x=1758625358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnhnAohADwwgLMymLFupZmG/k4zaXDapUOznK23UZtA=;
        b=TS8CSB2EIikax9/hAOi/dx3Ta3VjgucC6rMWgdRSjS5gDUy3mJmVet77u8PhLeB+r5
         YJetb+7BcI37dPFn3issqmxZaPfEv2STwW1pSYotBggX0InhprTsSUkohT8tmNdYSDUK
         mR+E2IqdwI51A1aju6xUAgMNrQbokYbRdq0hi5QsvChBmjRq2U22SmkIf6GlBdIWLaQ3
         N2xwZUnzsNipod1YTXAW55bBNCREiZaq7dO2klG3YgxVszOrtiyH0updYW7QnYkNp+yb
         wq2zy5XeWYSRRoNfRi5yKY0FJCbmuBaLDoeJj54Ea9i8wv8yv3cHddNk2+tMSctBUQG/
         uLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020558; x=1758625358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnhnAohADwwgLMymLFupZmG/k4zaXDapUOznK23UZtA=;
        b=FpeDyiXUapq9bOp2dUuanObYs8Ed82p7jex+T2tkAf0jmXsA6BD3qN063FH1Phn2v6
         7bypeSjJDCn74f08AqYShtAHm32sZExbC54xi0mx52WMCLv67sMLa5gQHGXdKeLWGZCQ
         q7OP4k14qGIJDms7Lgj3JVECBzIUimcqjAo7UQBoUyr8coIhKP07io/oEThbsxAtSwgf
         WLpzp83GuWOjpGSeOgwRgFOmiFl/u0Fq6LZNR3WoaFiKPkhUc/5zuwp2p043GtIcmJ3p
         LC+J+ol1GYjFviNGRhMBo2ueQZaPfEinlE28y2z9sRWNDd9//DiNg8PP18NvB37w1aLN
         IM3A==
X-Forwarded-Encrypted: i=1; AJvYcCX7DIc/yJbSSI8ozUxYOqQzX/u3UhSDF803fJMJcka23y9snqBRYcx/mRgflMXHZhfwRCO+rp42KU6M@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbd286AXVFFORp93eFD8jdnFBmfunc/QLzXqfsfk4FRjM9MDVh
	AE7IM6f0uLdExXp4VK8vlREsryG/MVrW+LxPNrEr9aC6obawkPqZQ3i+
X-Gm-Gg: ASbGncvOs1vfZ04aA6FWvJt0r8VlGbxj3whzyu64/0mEcMeDEqSWMUYEmZyByqYDikg
	dQqoJwQFOwpRD067o69MrlRrbJ1CPKW73JS4TTz2+/8/UnqdjqKYs2qlB2zcyUAxudEk8s3U5hp
	qK8y7NWasYGpzW4CxQloXvwMRwPID6htCIP6heGpUtZ2LGdakyW1ze0yObfFergz1AYI2Mlkgvf
	BYpaF8l+KdRVrFCgqPT2cqzgFhCJa1V5+kp2ttnilGFkF3/8q3Gl5Xbnt/GBU8THShTLNtUGXrN
	JkYC9FYhpSBWs3SiIBOkl3/aM5efhOGbfr2Dx8cUkv4hbNGsrllAPXtLGMTpkh4jcm7CX7Op4yK
	7xw7crVcb+gKyMS532n6o0WY4KV7cYroIvpD6aFluXPe0
X-Google-Smtp-Source: AGHT+IFx+My0FmYEI7yM3GGPS1Qs9nZQxJH6ip07Fyet0g7/yxeKatQnAkiffmCmgeNC9lyoW5P2eQ==
X-Received: by 2002:a17:902:d58a:b0:264:c48:9cae with SMTP id d9443c01a7336-2640c489f42mr124067255ad.38.1758020558299;
        Tue, 16 Sep 2025 04:02:38 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304ce8sm158761725ad.128.2025.09.16.04.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:02:38 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: leds: Add YAML bindings for Virtual Color LED Group driver
Date: Tue, 16 Sep 2025 23:02:15 +1200
Message-ID: <20250916110217.45894-3-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916110217.45894-1-professorjonny98@gmail.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Document Virtual Color device tree bindings.

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../leds/leds-group-virtualcolor.yaml         | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
new file mode 100644
index 000000000..945058415
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/leds/leds-group-virtualcolor.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+title: Virtual LED Group with Priority Control
+
+maintainers:
+  - Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+
+description: |
+  Virtual LED group driver that combines multiple monochromatic LEDs into logical
+  groups with priority-based control. The driver ensures only the highest-priority
+  LED state is active at any given time.
+
+allOf:
+  - $ref: leds.yaml#
+
+properties:
+  compatible:
+    const: leds-group-virtualcolor
+
+required:
+  - compatible
+
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: leds.yaml#
+    properties:
+      reg:
+        maxItems: 1
+      monochromatic-leds:
+        type: array
+        items:
+          maxItems: 1
+          $ref: /schemas/types.yaml#/definitions/phandle
+        minItems: 1
+        description: List of phandles to the monochromatic LEDs to group
+      priority:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Priority level for LED activation (higher value means higher priority)
+      blink-delay-on:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Time in milliseconds the LED is on during blink
+      blink-delay-off:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Time in milliseconds the LED is off during blink
+
+    required:
+      - reg
+      - monochromatic-leds
+
+additionalProperties: false
+
+examples:
+  - |
+    leds {
+        compatible = "leds-group-virtualcolor";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+            reg = <0>;
+            label = "status:red";
+            monochromatic-leds = <&led_red>;
+            priority = <2>;
+            blink-delay-on = <500>;
+            blink-delay-off = <500>;
+        };
+
+        led@1 {
+            reg = <1>;
+            label = "status:green";
+            monochromatic-leds = <&led_green>;
+            priority = <1>;
+        };
+    };
\ No newline at end of file
-- 
2.43.0


