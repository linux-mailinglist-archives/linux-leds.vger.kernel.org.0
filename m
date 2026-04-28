Return-Path: <linux-leds+bounces-7863-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIljFu8A8GnYNAEAu9opvQ
	(envelope-from <linux-leds+bounces-7863-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:35:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746E47C2DA
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FB37301073A
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 00:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D9725B2FA;
	Tue, 28 Apr 2026 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3sNtlG7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41773224AF9
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336501; cv=none; b=j5yiEcrasUGbthPwctl1XMAHTl6zB2VnrCLQw5LhQSAibDPh+vDWuioS7qBYOyPNPRT18Zvay724UjRLiclF54xYmzEAFEvdJEMmIK/vhzPUXj0sgUjEm6D067VQeB7tqM1BAOetpUijBaCMgAeKR2XYkjyHnYlxOhjw/gkVaIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336501; c=relaxed/simple;
	bh=rnQ8gYqfg3VcZrsJCID13f+y34VFNvtq00wytYkBBIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHKCZNqA3cV39GmaGRPtn/SCG9DhyQC0h30asCt0GiBZ2SuIG0jIgLuJa2obBi3n3W+WSJMMIEkdJK/qfSsG2FpEVqzK84b1S08n0YayI2FB/sYBm+yICxukzOZjyIDXFa4pgTY6LGTFFGDqUtaPOpV9fYkZfDmovyNunJ0R0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3sNtlG7; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2de831d2b20so2201806eec.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 17:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777336499; x=1777941299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSBYSXEFJRNW+sJYFCS/2LiY/S8V/Mf0mXkr4u/MCNQ=;
        b=l3sNtlG7s/upvOqwXMsT1mfqtzncd7S824Ha0DgLkcK5MxMJGQNwLKrhzU3z0FAvs1
         2CUjew2y/lilvYmpIExKXGOcvtbdSPFdroD+KgEMQZQnUalikwKB7PoN1ODLh2h+7IRx
         cvczhZVNr612rpAEGodMWqvIOrXMhEyNzrH/wqeoRjf5JnXvvQqX4UlNGHWbs3tfu/G/
         3X7mccURaaee2GZ/3JbkpwpM+eOCzX71g94AtjBBLuDCvk92vrA9PcGnMJWELn7H9gbR
         dcqwRvjVQP1w1i3fUS+dZfQ+dEsCbCG2yWjXwhY7oNKtsAIqppl072FppIrFbgtEEqiU
         J27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777336499; x=1777941299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSBYSXEFJRNW+sJYFCS/2LiY/S8V/Mf0mXkr4u/MCNQ=;
        b=QcRUb+j9ykr+wQzrm2bmf6w/gTMPbkl3zekhUXKvpEpqItY6K51+/HOldRoNPzE0ZE
         +GPQStU4IGTwshXP5rqzxwpuLU5MWBVn+XAnYKARdaKqC4ThhGW/oTpTcLwGlwcRHDrN
         yBQycsiN1TqTDgXiyaq9F1/hjReQWBdhoWpoTu6hBCx4R35r6LCaZJMgYiC2XWoYgirV
         txA/T8bQp4R+sy4zFbNAMLRJjGwZjaP8OkvOyoq16mVW8aTpuBPZShNpkTIDN93g8Zv4
         eCNHlrB1LKXTCT84bwfYbRly067avHBLbCTY3ybKDYP++xMxaJcz3h/LVAe8wjMG7wCi
         mTOA==
X-Forwarded-Encrypted: i=1; AFNElJ8X9U+KqWlfhsd7LaX6sheo+5WgMZh0oNXA7+OdAjRqEjrVqYFh/YtEFDtpTwTB6rKGnXlr+5MJN0gk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2bXreDFgDTLEA3unwAWdo9yBSsdT4axvgBTEKfbCM7z/c22v
	81dpCUFVCwb60FCZ6gYA/VCX8aW2EQQLcn7aGgd7N7qR4ekoY1YkqVS6
X-Gm-Gg: AeBDietPOzrDIWbd1PnG2+8ihN/2DaeAt7yMPdf/WSyAcARpYuzRXT3NpS3cFoQuZvo
	fry1H40/wjOpsI8abhFU3HTymoZw6OeEE6vgBJWjJfXPrQIdWkYOzGbr/naWFFGBUPDvMCXHrVL
	YOTuvPUTV9ZCSCMtLrAkdFaCs6Ubg8khJlUC8i2kLYHUeFFJE0DYS13ROY9Q0CSF4tZvhSZafgJ
	n8ueIuZCuVYrjgEIyHMXzZlcQSmjY3ZAbewANFxDaBqjsJpsSejo2m8A4ebwdGV9ZEluLBN62H/
	4DzmDERyQVpHBGjeU4GuUjtx0NH2xdA5g2dtpcRfP+6OTM+dLT3MMIdM2Ij5IAeu2asCv4qCW8D
	sMzyi8vBqrDDZK/v4qIwI1xxpipdjTnUL+wmIxJ8+HJhzb/utYjOyQfMUVfBAQ+TkWJYSnqqM9d
	YKxRRX8z0RH2V214j5XIzPvwR+EnS9WZ4=
X-Received: by 2002:a05:7022:628e:b0:12b:fc21:874d with SMTP id a92af1059eb24-12ddd9c73a0mr474432c88.19.1777336499321;
        Mon, 27 Apr 2026 17:34:59 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm957144c88.2.2026.04.27.17.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:34:59 -0700 (PDT)
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
Subject: [PATCH v1 RESEND 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue, 28 Apr 2026 08:34:10 +0800
Message-ID: <20260428003412.322032-4-jerrysteve1101@gmail.com>
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
X-Rspamd-Queue-Id: 6746E47C2DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7863-lists,linux-leds=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add shutdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 01284a506e0b..0296120a8fdf 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  shutdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0


