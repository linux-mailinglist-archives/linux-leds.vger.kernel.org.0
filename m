Return-Path: <linux-leds+bounces-7862-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHIUDr4A8GnYNAEAu9opvQ
	(envelope-from <linux-leds+bounces-7862-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:35:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CEE47C288
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0953A300FA09
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 00:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1681A2417D1;
	Tue, 28 Apr 2026 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/MPEg8v"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFC23AE62
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336498; cv=none; b=K0xXrWtxXBR26LzJ6XBTTdG8xuvDT/n0GfmJd1NTTzjwu73JremkSWzr/289hsl9513xVvijRsrwh1GhlNQrTZox9Yr9b0GjkmUh+/+1wAKMMpa4UT/Smd9cGKsPaZwR81CQXF8cm/zMev0Q3G5i3+KarFgcKmC4aoKn5kpE1Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336498; c=relaxed/simple;
	bh=1MEvtHLSBaSxR+1sNhqwrZf3GdS+p2/3VevRkZxhtdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cO9ey/k8Lu5ueBvr2oi2N5drJC7VU4uRBGtRDMUCG2FRUKMv+zb9+xiP8mApbsudGRBN+ZloutadGb8EFiRwq4aqszuTQIWav2dXfnTSl5fIOxIstDGxetGxd1gCzBIw7exvDA7+pSepiEUNEnIlxo2UUmFMoVwO2Owk835Bb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/MPEg8v; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c19d23b19so14078862c88.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336496; x=1777941296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTbkxPf2kr2XKpradxxHMrPE8qucoJpVu0Gl1gLk7hk=;
        b=U/MPEg8v8AtmhZWNxM38qrp4uA2SWdD14T6dasNX38DJUuMTz9VXq+xgzGuKiPZvSi
         owMMdKhYISd5ukyfW3ErIS1ogGYD2xrJnc6dS1RpWvVbBXb9Af+28++mJ8w2TVOJlGSn
         jjit5X2EqsXlSMIJFcnjZ6mUSAB6zJz14x3Tr/2Pk31r9s3SU9wOkBDQIVtUDIfdtz7n
         5vrbvsm4jpdgroRiVYD8Z0Xi81WyCLCcgDZM6aOqfuBa+mm/D+6Tg8Qp+nQLKSmurLLn
         IjTbsDl5jqeDGxf6F3wzYrw4CDY4JcdJcggjsKfQ069gYk+M4E0Y6EF72paZQKGr+Dcw
         8I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336496; x=1777941296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTbkxPf2kr2XKpradxxHMrPE8qucoJpVu0Gl1gLk7hk=;
        b=fayAcojyEWgpwuBwBBaaTMECkfSXPuXGxx09/HaioBwDfTWXT64tFl/Hu+Wg3IQwwe
         nEdnkgHcQzL+BfJ7DAes+q2KZDMdPnuCGdIcHri+ZcIAMd0Aj2CUP8pMcIdB7vKMVmn3
         SybFPs5bf/WKmUyDUmwsDsA35LdB57lF1b0XGnR/z+SnR717nWXVNelf9ZwikzxrPO/l
         IaOl1kbGjHF75Oba39lt7gSnAXtm322rYHNFk5eei2HZ9dp2qBMVKaoKs81gdZ8hCSRY
         pAOHUO1G3gL20x4eSFEf9T8CLosMwL5Dqmw5iXFcj8f2IYPKt12j/2nGoy2qVtCtMEtt
         RtNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HccJSM3LZvKvO34jVG5BP+jLUPZskQqkGJ8h6NAp4vnN/FT2rjTBZ8IWE/qUgGX50bfFDih8n9wJF@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrRNKUofsszYdkkQjDk2r5MDY8wfG/d0r8Spk/ecOLm6XRmnG
	LLUdOrP8KR6Kd5trZZzX0gmdJQY+vDMvly6/Rh9cAulEIAD5vUuKVNMJ
X-Gm-Gg: AeBDiev0qVP+BZdXCQFrPnOFonhhPx7f9Iz37sxJ20/cqCGgRvvEx9QXa96LNbccoN4
	K5tE6eYivvkoLTXiyi9GiMVZ4uJPjCaloIlJnPg/a/MvhH/2KocESMEqP/iQc6LSQh54KtA2DtV
	hoYyG2aCZnNCE2XkDvBzUV/AEirnFkSya41Nw65PbO4NhOfu9JUePjVmNMmgFhfzA5vJzNbXlaT
	qzs0odg8h320lcLSXl6NU2cD3Y+pApc6KptZzmMsXRH9X/wuwEsfjw94Xga0zFX6crobRe5H4Uy
	DdbXPnX3RFRV6RIdrrBvmmqlHzsCw0vhhM66JEaTDrQUE37Z8rrpkHzoYZ1FVb6ci02y4ObDDdC
	q1+cEp3vEzAm6vjmhxWeOw2bCJuKD/5N5BkbwmMboAkmDZKbI37zCe+VVh0Wz694b6ZxlIfxXHA
	CDovQA2NW1hMNZdXqdUjJ78LCEmOUrI6w=
X-Received: by 2002:a05:7022:fa05:b0:122:2f4:b285 with SMTP id a92af1059eb24-12ddd9b4786mr562288c88.25.1777336495781;
        Mon, 27 Apr 2026 17:34:55 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:55 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue, 28 Apr 2026 08:34:09 +0800
Message-ID: <20260428003412.322032-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428003412.322032-1-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E0CEE47C288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7862-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lumissil.com:url]

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index ae5736e1b8e4..01284a506e0b 100644
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
@@ -116,6 +140,7 @@ allOf:
           contains:
             enum:
               - issi,is31fl3236
+              - issi,is31fl3236a
     then:
       patternProperties:
         "^led@([1-9])+$":
-- 
2.53.0


