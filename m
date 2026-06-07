Return-Path: <linux-leds+bounces-8531-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a0ZuLPqMJWqXJAIAu9opvQ
	(envelope-from <linux-leds+bounces-8531-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:23:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDD650DB7
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:23:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Bxd7i88c;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8531-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8531-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CB493045680
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613611EB5C2;
	Sun,  7 Jun 2026 15:20:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBE2BEFFD
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845632; cv=none; b=YybtUaObDh/QTgx7of9SqMFfyZ419gbc+qsTqr27igILvGyGfH1kKCFZc22x2yJPTFqrA+lHtqRHe9QEAftko3HKQocdnGuk4tAOV9+6IzyOUCINsk5azjD5dP1dWh0hPrQOj5FgUp5yhrDzp4CoZ+E5xLykLH+lBw7MO9ING3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845632; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKFdaXEMABdt55uhFmQ1/Ss4kNVgtmLHmo1jRgaoV8UqjoBMtnK7ObUeVgTLSvBCz3qq6kopbSZbGlbXe/vuKfz4HoC/LOK1QY6Hejg/jpnFB/x60mv/osSwrhht8aDRsOVdIWLLA66gvsrHBobCnMaojhrQp7CsSPrrgh8g8oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxd7i88c; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-372b4330deeso364642a91.0
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845630; x=1781450430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=Bxd7i88c2CuuGqkXvIumVvqwG0E2RP7RTno4ndAQi/XYrJzVPB+if8cX6xVEjZcW33
         zE3b/tToUCwbtY0xOza+LHiHHtgOFCWb8PKn6Y4xc6Y580Hy59YBe/k/e/xwH5iLOkxp
         wRxFiKio41aoXHHrtVsEnLbjU2eEWhyzNQ2Neu6BPmmxY/XwW3fwg+fTjIqpsQBPvE2C
         RraatU6jbJjlo6xjaIOY919ZfbbiediUe13xwxy2N/2UoN/S54qqAluUvUyRr3DUYqY+
         LiRtpNspSpTMw8/ozwP/syqRXo++cRW3IC9iWHMosT1ZIH6qpIx/olEFK6MlLvauHacE
         Ci6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845630; x=1781450430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=U6zg6tsAnnaDNm0XCUKPCEXx/n2mOp3lWAFFcRJVGYYOcrljPpoaJhnLc01bKBY7/i
         9WMxbQTx6mkAtQMUI3YT/5RVFxUuTw9/LnPsDQ1ne4AC7lcGgLtzilhi0hDcdKtojZ8D
         CbTalHBhVH+eJpNtMZa7rPTpHFSENaZl32Fnb3DJWuTzSoAH7AruYYdsScOEHrkzeo2C
         m3cA7Yz3Xlz10r/O7vk7h53/2pu1gcVV3YdksQATdIEH87pJ3VxTO3EGQoIsmBJ2lIkf
         at4O/5kNAmGY0XXUbwHBUq1V054GixmDNVP4MFhedcTX1wvQAH1kWAnwwu8g5SDtBwqH
         YDvQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gLYDUaxqlI4F2sSKuRJ7WbGggk6cbpRUctnEc7BK0RXFZiTkJJlTNO78wVAiGo6gk7KcBpW9rOBPQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyuywHRamclmDhAN5lKOfqnHA2p1oChPivJD+ybMuoc+/rtuTNP
	yqtX3Dz+ibGFtDtl/a4FzdkVvYo6reLX0qAjq2eluceb5ojT4OVba2hQTndemet5DfI=
X-Gm-Gg: Acq92OFrXfLjGYh1ikaoG/TY+Rp0uYXRrgkNs5zhTA1R9ncjC8UHlRzlLa2P60eZGqp
	1PEMjT3Trvldu6MPKR8cMdGiO79QpLrEyLNOTQakp6Hs9WIesvYIiBCIGQJF3weY+omNqh5CPwU
	K6NlrfTv7P4aJzE1dh03rV3pTi2scH+qEXE8/DCqnwXOyaotYD9n8+sDpH65J7HhoPNYbSBqhWP
	7N9bVUBUpvM0wcAdTaDPb/sJrKGo40bu8Bt68yOkRCI6QlCv2v/8nhx1x0NLQOF0Qq05n6Y9/kR
	k80okEc4vM1jMnxNBa1X8WFvwgb85ZgLlLyCC60g5W/JB0WIhUuoMFPlKVJWIp2mwAJnvt5QO0J
	fwsbOVjTVYRyr4SKvR0o7JVg5Ta5M0JhZYdKWR4KjKzl5ceOwV7BW3HFaLdRVjUS7JKhYtrzEIe
	FLIVAXF2IConYWd7WCJ03uOPIYwUWkdg5H21qHtuYsguAXgbC5/A==
X-Received: by 2002:a17:90b:4b04:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-370ee5444e7mr12488010a91.2.1780845630473;
        Sun, 07 Jun 2026 08:20:30 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:29 -0700 (PDT)
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
Subject: [PATCH v8 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Sun,  7 Jun 2026 23:19:59 +0800
Message-ID: <20260607152002.446617-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8531-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:jerrysteve1101@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BCDD650DB7

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 5f22d8b77edd..f33c8305e464 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  powerdown-gpios:
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
 
@@ -145,6 +154,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -157,6 +167,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.54.0


