Return-Path: <linux-leds+bounces-8240-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMIJGXP9DWok5QUAu9opvQ
	(envelope-from <linux-leds+bounces-8240-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:29:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8695964D5
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14A7D304CF55
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A831B3FC5D4;
	Wed, 20 May 2026 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZPLR0ee"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976C3FB7D2
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 18:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301401; cv=none; b=PyLiUSp3otOLuIJ1CFbltBBOgG0Lxj7WgvU/p6umBYIqPvSLXytODZAx7TESTuSM+75sJVXAKugxqHz+y8KWDlcPVPVCng4WiEcs6fxGAcEt3NTfv9OnkVRz51qAti//wTFYKXk0Fm3TZlzNjQYC+wZtk4dvjhQmB6F9aQR5CrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301401; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTNCZpLD12LQ05oTNV5zdFwVJip8xjtYiTUUeMZZhiS0LnbNYm9LLA8sfQDL75LPasn7nmczpQ4r4h41uiHZ5WL1PRtapLCt8L2Hcz2NyCt564gnnQ0wXx1ajj9of94iYfGKtpFpeigV0CcNfM7BG2PwgDopiBjx5VQL4bl8ppY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZPLR0ee; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891b0786beso36402255e9.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301398; x=1779906198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=rZPLR0eepIKcHVu7bhWkEfBnwl+1KMWEJjyfELBDkkHOv0mMQs04Tg08BdXAYVS4xh
         vkyfnxjKSALPjSDU+AZ67oj2541mnHaj0ElEK2aFS7egIj6lAn/NupggxKQSLqLi1/tQ
         Ep+0lXInLFI2pwT03sHEmvoQqNkoDbIbB3Ss/iUQ7iHgM9X9RXckgh5ONKbM0lM9rYLk
         9Rz3gLn4MQteOfSL4TmENtwsY9H5ss/J5IJ3BNiS5St/kKmzHfBDQUAifN4ZPaJINYtU
         sXWCJWjrG5SL4DNaUo6xrHRUXfXzi5bvdNc7w2eRkHBCdxE12ayxymd0Ej2FPACo0dB8
         MunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301398; x=1779906198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=fKlD9hj6v7yV+YmZY6l5m4rhA2AGrj55yn2JEWxhI13wdOypdb8GxerpBAcSdJKcjx
         LcHHAgjjcqpWY+nkVDboPOgf/eQEGsxoA+p2Gudaag3fLC+EvlWn1mCx1GrOKYwEE120
         O+Ao/D5ygA7CndcGt4mZGu1NTpirnPHy6hLug58ehU+lFO4oP5zhPpoQDR3EAK/l9MBE
         T5B/P1+5/Hs9K3g8PTVXrtGHjbnLT2SuUG9NtQupnMoCwP3UKG7V1i2qZ9FyAOAqM+TJ
         ilzRnzETrfUNXCo8ScQOcs1fqcEUnB3yWQuZn37xWHlZ+zHJ9SjKO1IIg0oambyb9mTe
         bejQ==
X-Forwarded-Encrypted: i=1; AFNElJ9z7zcZX+SG1H48XNgkTaJfHu0aYCHBIbXSzx/toDpHYdNBEmYKlwlCu5vTQQTIG7NKkClV7ugwuRi+@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgO+U5n11l3IyBY0UXx4ntmC7hcm1QBwcYa/qyUJeSUS37DCJ
	7n6Qrs871FxiOP2wOwaHYxlVZg7pCuQb9FvnCsQa51i+nz5FVXAXwTsK
X-Gm-Gg: Acq92OGFvz1LzLqvR3LHjEbLSMMeiTsA3Zplz2stqvVOBaqoLhcrQYXsIsuu1r75HN8
	3QqWWHnWeP4XfqaB6F5lLtc1IlLlmp7MeLsvog+du3YBypDgv/msHoGLnRlDX2ObhjsxmaVtwVu
	K0x5DP6EyULvX71NOz9GM8AGVHpTVR7oRYUqtrDkFS/ZuQAb4b7zVUaJP+NF57n7hm0lj6ssJXL
	Kr+S29ZM55FG80ohWGNNG5f1TY3dhm4hMQrYGakas9CRj8nSXqce2gWDLFMjx/8u5a6jhyJsUow
	2BgvtiYWBO0X5NkNdi97CH22Cyghs1NhS24b28wAWRj8DPIprD1AHuP55O3g4xb0nVq+FW1rHx2
	/nXIcn0Zoz4wOu2+S0mdj0RP9Fu6eXpk9m33N0b/xHKEYvlGjMUJPMQe0ipayvaZ/KR651HALt7
	nVxW4E4I45XBc4x6hdBu1coIk=
X-Received: by 2002:a05:600c:c494:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-48fe60ed839mr370183445e9.11.1779301397887;
        Wed, 20 May 2026 11:23:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Wed, 20 May 2026 21:21:20 +0300
Message-ID: <20260520182124.117863-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260520182124.117863-1-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-8240-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EC8695964D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 000000000000..77a3e5a47d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    items:
+      - description: CPCAP's ON interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.51.0


