Return-Path: <linux-leds+bounces-3870-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BFBA25894
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 12:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D751655B5
	for <lists+linux-leds@lfdr.de>; Mon,  3 Feb 2025 11:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A82040AE;
	Mon,  3 Feb 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzMV41dr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0C520409E;
	Mon,  3 Feb 2025 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583551; cv=none; b=mHxFnvu4dA/C/8LDdq7HWwF2lp328osDqhd6NTg1T0zctQEW+4pnygueovMeZY+flflKbnHKWpDjAsfCef232MiQ8ZcQ5eEYeO3M6VmLzXiPitKefpTTIppUM9O2HHGJC9aXZWVS9hK1qhaCNesh8fECMRr/H/YYNQI7EwUdK5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583551; c=relaxed/simple;
	bh=e4LCw8b9TArgBNatCS4iPLDcnxNGjb099gyuFiAoxA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaWNlhg9TCFCvLwjy9IwsNeYZsPam+2+0pv5T8YNPfh8FdTSZztO+dtxYFwUIFDD+Cx960AVaOq1CbONlDcPe2LHVh/ezm07/bLKXgxu0545/wR0OIXsc5t19NoF9Z5cqxanpnJrZa71b7soLyN809hpVQdb6ZsYKSlakCVhkr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzMV41dr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165cb60719so74877545ad.0;
        Mon, 03 Feb 2025 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583549; x=1739188349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=AzMV41driRrt6qX3d4c/qcWdEoxbKX8ervDbKuFYvx7LpIxi/tt1ffKbl1L4XdcRJv
         fincyGI5Ui7PIex4H93Z+wUl3gOm5MivINZwQpY4hcESyIL1zucSfktBkYC2amjkRyZ2
         MoimKUsRx7zBcu8jsCv426J2Bj7CTgYgawHzO/bG/bVYZq9lWsiKkDq3CHaS0Ar9oft3
         QETp7pRm7Ar6xE8DPS7Wnfa6LaeJVZW+3nnL5E+fFaqj8XX9JNX6phEMs/VNNy5uiwiU
         TH4+0avftPd8ExvnW+mxbM6LXpunuSA53IQlfgyWuAFvt4zhSIpTbSOsZUC3Gdro2Rv2
         6COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583549; x=1739188349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvsk07Lzw6XdWgB2cdXk97Y7I1cSDuStLmoSGezH+tI=;
        b=IWKTliu+e7xaR59dE9olOkYKBp9pEDCzPUlqBPtsH4hKj0DNKF11nwjs3S29/PLoEh
         9PeOu7Uqv1t1KRcSxUBLMYtvAZzsIQYbLhG8wo9T2ncD12ZSzlKBOtxnHIcpSlYhyCx/
         tROAMuMuepF9hyioAErmO1+qrJPhYIR0PDlahmEapHShspLAN1OlyC+EPnRzhxnP+VYw
         he43jj6TNWlhcIG2Uuns4TjeUtGQXH/7x8ivF3V4TFevLUDoqt5KLIIqrBsqJLIRO4W/
         XUjcvNqkQDfNef9HDS8x0uDTJCStTsGAYHTWmxvnoVqJ6t3zdqxNi94f9unugejDLacF
         65Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU4h8g04K6cSnsqXUz2jrS+lYQiyc1oRuoiNSozf4gouNAEKl36G/Bq7LFQs6VwVyp/8g4SciyX87N2Tg==@vger.kernel.org, AJvYcCUDAR3HtL+0NKeDA5aOOOY7qw/twvFSN7+/y22I9mhzuJRH3TCoFDl6/2G0Xeyy6eZ69szb6D/rZVjC80RK@vger.kernel.org, AJvYcCVWx2ZjoRpk/uO5Kiu6t5SPIrj/INVILvox2Mov4JVy1x5uu/B5vYcRNavugl+wGgja76FRpITw/Bsg@vger.kernel.org, AJvYcCXOOFsjFvZLktpu0QUz2T4nLkN31fgVIu6UJT5xKc3g18kdZs8+OfDvEwj+5cic3WRWy2aa4dkKHwM/I7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXH+5Gs8lHKsYjWyBdFSGZJNdfoaFNmwDnythqNaSKRj8MFJ1A
	M7z78haAjl2AgbJN5Lm7z9XiqjNtCflQNpLkZYxWdps4yAmrHPAy
X-Gm-Gg: ASbGnctUHVcqYSXo564HbJ8sfHNMBGFLAiTQGMY6GvQhgtauAod3aF1p/nzMhNAm9yN
	YBdRBpKFetXDnjwn6cSmYUi5pJPoJo6HowSenKj4FI5k0TnXVuN+Vk5gPZ6S4C5AXKbhRVT7ccl
	zbhlj24oBrpzjrkXe71UDuGk8FtjCqr69aGkaflsFTA81gGLm6KsHC0QSBSQmqR9wwxUltvWF1W
	QBY4pfHNIky6w+JjIpB56s4K+j16yJHnGGWGlOwH3hkyBxfRv93kzMxot1SuB9udaTgyNFq+7y5
	KQjqiWoVPW0T6X7d
X-Google-Smtp-Source: AGHT+IH1MtQsv7n9+03TmRQLhZL0KNOrrS14baU7/DtFKLh1qhS09XchSBq/EFGuV307S9+ypU09rw==
X-Received: by 2002:a05:6a20:cd93:b0:1e1:afa9:d38a with SMTP id adf61e73a8af0-1ed7a48c85cmr32676039637.1.1738583549287;
        Mon, 03 Feb 2025 03:52:29 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
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
Subject: [PATCH v5 RESEND 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Mon,  3 Feb 2025 19:50:32 +0800
Message-ID: <20250203115156.28174-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
References: <20250203115156.28174-1-towinchenmi@gmail.com>
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


