Return-Path: <linux-leds+bounces-8049-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOYOOlrh/Wn0jwAAu9opvQ
	(envelope-from <linux-leds+bounces-8049-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:12:58 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB14F6D83
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4FC305D10F
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6E43E0238;
	Fri,  8 May 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDENpBpi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D7D3603DF
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245921; cv=none; b=fX689j6oJCvHkWJBliVQxpug0pd73Lkdeq1yVABMXd5PdNIO6U3e9EN6T7ZEk6/hYwzbuZW38THs6sc/fOqUwqwsqDKf3tCm3i/mnMyANGFI4K8WzXXVAu14q0D956HSevlxXYiYRJoXJOS7sePcC5zYW677KtE70jk0TlqDnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245921; c=relaxed/simple;
	bh=2b0FDpYiUDHYTaTWt/ZYBFR8OZHcqRcI/kgwYOW2JAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8Fn+hgcX9Ka1pU7ynKyWrHgtUuK9w8zSW8UM2kRcE7JkaKRmA5V8MgfD/F7e82IB/menyRBYdBPPiVPzY1ZJ0Pce7XtF2Syh2tATTS9DSrdxwWDTF8sXbMxdcL9qcHrwFeKTKdJ9W47Tb6Yq8z2ZArTzit1htUBhbIJ6maZswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDENpBpi; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso56845eec.0
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245919; x=1778850719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyBJrvlz7Sq+JJiQV9BBY6vFwOZpdmX7IWJeP3gm/zA=;
        b=PDENpBpi6Rc3GurEyP8ei0qRUWEADpLrXVavQi67r8gFi9JgJ63UUtPY7uuEBv2a0r
         aoCMG1CxeW3kZXDNWTn8yffGA9IaHfUo0P+UXAg3k+10MNRWQDuvOQLk1WX2B5FH603Z
         8+HLKXlc/PV7c7FW+G3L7Q7mZmq+evEuqFvakO5iu4XMxA1tvDtWNbR6AkbpMMC5koBM
         Z44Lqu7Y0kQNuN5uNvd+BqQB5Arfem7k3ArpSsGq/UwpBNORyaTm/zfFJHBlJ+kLmTme
         ndLc213LN2vuqV9UYwUkjsVrdajgeSEVn7umjK91iLtd7Ui96+5F6ixLJHqH42oRXlQw
         gz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245919; x=1778850719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PyBJrvlz7Sq+JJiQV9BBY6vFwOZpdmX7IWJeP3gm/zA=;
        b=hXydvkIZT/Zr1YI4ui00djP52BQslcgBhOUABgWpGNI4wtQ6jkuull2II+eTTfec7A
         x16Md+Kve0PGvNLjZQRGZwFqhywkPUN7SkE84kLTlPQVaECmiEkgWCAw8QLKHAiZX+vq
         8LpC2nK64XX7GqZciYfvCXaHDerNkpXNVjRjBw1f/0ZFIASykEQpt20z3vbszpV/2dhU
         9th/Y7P0PX+pSXFUTOMFBP+9jt/JmD7eVTe+y7j64DXJ0k+UFU6ECD7mvzx+guFu/0yo
         Hddfw/wziQHSgnXUCWtnU6COv8oOx/m5ClwouKkBU7oYNQNSceNYBdXzOf93tEir+Ctg
         xQSg==
X-Forwarded-Encrypted: i=1; AFNElJ9qf6cmfJszvKLqoWDjOSkhl08QcdO7qc5eVDoDRDyqO/zmgtG0Woxut/76EwGCLMTWCzvbghJVy4K9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8j6FWIAO5TI3I2n6plYrmemUceuBTqTw4papPBpcaeupxG4Gx
	FVKGvJ20tsKRMLcP62poGwdamIL4WALWP/bUPSwbvfdvT841601QDiv1
X-Gm-Gg: Acq92OFHKq2t6jeBLK/NaH3HJKOzpV/icqtgBFykZPtoQ8DDPMbdTZ+CXa7BuzfvGw5
	+ej0KSEC4bYxGyGBRc9HQqFNYfLQRoqL/jWL71iEp/++wUyJJiItv5rqc8MMTy+zEP2shM/5aRu
	Hazr3B5NSqGJvHtkzTHTEvy/kKUwwDNb75KlTU3ZKK+2RtaAegeT2tgUHj+wZOEh//ZtgwBtlDb
	Y0+M4oRzbRsxi6+EYDdGJWMNEY+zGa7RTuRvXDUtaJyn3rznvjToJ9ASTJgX1t1lR0s/3A/QbBQ
	8h3LZEeTxiHTMGzP22UENJLnxSGekD7SoZGUNwKMNJqhxR2hsekfOJE0LcWD0BB/MF7PRXDsHMp
	zgox84fiFAFJYDkrCK77EzKjA53a0VaLGObnahPKu73WMFYdwwsLAp29rmzFpQzDlGG7VKMvVOT
	lL5MszeFfXJjEng2uz7w==
X-Received: by 2002:a05:7300:7255:b0:2d4:aa5a:391c with SMTP id 5a478bee46e88-2f54869a41bmr6264814eec.12.1778245918854;
        Fri, 08 May 2026 06:11:58 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:58 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v5 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Fri,  8 May 2026 21:11:36 +0800
Message-ID: <20260508131139.1523597-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 46AB14F6D83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8049-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index f4a6ef99b477..a8ed62fd2f35 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
-- 
2.53.0


