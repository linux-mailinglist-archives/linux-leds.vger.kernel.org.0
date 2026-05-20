Return-Path: <linux-leds+bounces-8223-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCLFGm2/DWr32wUAu9opvQ
	(envelope-from <linux-leds+bounces-8223-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:04:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76558F432
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68E4130788FE
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEA93D8128;
	Wed, 20 May 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ+F7hKo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60431344DA4
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285450; cv=none; b=Z8OKeRArVfJJvIS8Oxu33y5rvx7Wq+J2AAg3/HLzzVuOUuQMhOH48kv725SaJsrvM5BJy9LjAoGOzA/C39R2Hls30ZwcbfHAq5SHDNpBEiK2G1oroZgZ8vC3qEzqC03lZ+Ca3VuyYOMp9AyM63RpHY9V6j+HEjA0eOVq9+p8LSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285450; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBON0QQLwYDiHL8uxtzM2/PTLsCqIwvYpmL7SvRdIT91mUdaRaBT6evQC5LG6y2mX6qDQq2hEzy4gRHA8a7ZuLnuow4IqvkxbIhowKBq8p1XbFr0WZA8cuhIeFbmmc+rySuDUulTIJ/At6gbPiUdd/txbRFS1D+tCh+Url9OT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ+F7hKo; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-369742178f8so2994171a91.0
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285449; x=1779890249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=ZQ+F7hKo/Bf5419k0GUk+f5bMI6JLfQGWC3lnSzPkZfMIXvDpq/LtP0/bSjsKRnpon
         YG4jXoPfYLG7JhQwordrJ1+a/7NvkEs26kJhoOhpisQAmtXj4vm7lFTH4yUqxu/+GZN0
         sJ97g9p02sZt1sKp68yupHjEjUTjwUpw4NGPIYC5M44thfQOs6QawHtFuB2n57NwRKw8
         2mdfXMCxDXLU6z8gxcoxGPNLv7A6YvntKRBg+ZM0mKoKD8+DSCA+9K9UpUYTLAd5Zl7p
         ltPiSUgjzqs8A4KZlpRyII8QLzHX9GIjLH1RfRGjn7oHMf5bopGiaaL4YLMu6TpeVd0Y
         dHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285449; x=1779890249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=NBtVSP/yksq4sshXbkIXYBrD9G357Qp+V/N/RQlYDlyW+DuOlwBJ2OV0heuUo4fZe3
         /6s7XhQLSiXzYKyS6Et5aUdqZls0ZRGUvkENNGZBgygfOVUOiOvc61vHLuPeceX5N8dd
         8C5VhwFZbjVwYHpPidhAMPLxJhGraMkn5pYgxQvijQ8qRu8ELXptyMjXUCzusmC5t4Me
         9Ex9dbsi95YPHYxjby1wA2wE4Kw6/SchqgLOyQr8KYhP46KqHiJhBGcUzBALU1pg+7MO
         9QpsZUNy0zXYu4oe3YU/ErJGd6apHo/0HT72X3+No1OnU+gj0cKVnJm+xFAdgI0zFtAM
         Zi/Q==
X-Forwarded-Encrypted: i=1; AFNElJ90I1nzhxy63/DGaNntcDc6tBBdpIhGWzxPWs8+0MHZeijjeDmOo1mcx8Qk62tWDVt6SU56ugsN0+LQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxB47JxiipzUZ3ri5IjN3yb1b26JMaWHfs2epr5j06FX41IOBWG
	ujc1unmHExy4qRebECafPxVI6Vga8DoPrq1RreJl+iED9FOgj+vXstRJ
X-Gm-Gg: Acq92OGuvQgJGI0b2agY8/M15GcXq/e73AmR9qWn5erJEv66hj5UvRwq+8RK7KU4/U7
	iwK+HU2yCOPXw1F3bJm/swVTc/2J5nlAQNwmfA5UqfgJJ82CxSdEeOXhqeffN5egEfCnf5i1uKF
	WPjHLK/BB7FjuxJXTVnTccAjjU3dDnkHjxFlazESdUB2SLe0k6BY1qoCHcAPLQv0aOF2C5xsdkV
	M/LW1cFTwvECxuX6JFlyCnUhWgUMj/e09Fkq8xwzdgb8+IGvi4Ea7Bxu1VXykguD26TRkqdqxqk
	SSpRJvp395nZiTrSimNl3Gm+ash/qNG+9T1DzlurWz/N7ezzMGXcHNuQmLVCbvI4t0llxArNcfJ
	0lTtXcEhdPSEfcCOzaJoKTi3Oqj2hid0Q38RqQIak4LFkUICvSVEevFbaPnH4EDK3tnhONvSUyG
	0rUUnwpQCSJK2XSLYfyFJehYSd0KpqTumaGo2+MLZkYcj15PQAQw==
X-Received: by 2002:a17:90b:58c4:b0:35f:b69d:7292 with SMTP id 98e67ed59e1d1-36951b827ecmr23225986a91.15.1779285448778;
        Wed, 20 May 2026 06:57:28 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:28 -0700 (PDT)
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
Subject: [PATCH v7 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Wed, 20 May 2026 21:56:56 +0800
Message-ID: <20260520135659.1430008-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8223-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.1:email]
X-Rspamd-Queue-Id: 8A76558F432
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


