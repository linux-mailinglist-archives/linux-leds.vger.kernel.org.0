Return-Path: <linux-leds+bounces-8216-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBDRJKy4DWpT2wUAu9opvQ
	(envelope-from <linux-leds+bounces-8216-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6158ED8E
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2F233014870
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E04B38F945;
	Wed, 20 May 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4n3BHX5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704432D3ECF
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284054; cv=none; b=DwDiT6HCbbTRL7KZhgL/GHK6ozNctjGJsqaWC04G6U7FherncOFBNGS+5wp3F9svBef09MllMLrjZzsFgw8Clo+a/7GnjoyjTS5Y7oHbGnA6fuMiGhJ33cpzMU6XZXCu6D8VVcAqe5ALz86YrREyvEkEI2WUyukFihD2ppLvyi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284054; c=relaxed/simple;
	bh=K+tQdEa1w/oGtmN7/A0Fdc7GiMO7t+lg3h7hsUuhzkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MjqbDeAwQKSFw1Zi9bb3J18oRjhcYRf9ccu9RIcAoRCTiQC+GkTz1ORPyakssbjjnpEIZlf3FUJEhlKQykVQbfFajMVAaEAfdy0N6y3keGjd7veNB2ubi7wt7LnGnEo9pkg132x2UUB/7aC4CXZKkfjMNVWLZJarDVKsIDOYJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4n3BHX5; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43a6faf8d1eso2094189fac.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284050; x=1779888850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=A4n3BHX5azFO5a6qhD4oJ6jz5i5i4rDE4PoKzhoN1qumHAZDfXTKQDBBIcLVzibGSu
         FYZJGn1POvAeORJvzG7n9PxDxRxElV43q5I5LzJyYa3vsmiC2iPXO/NheU/WFGcTNt7T
         8HU5Lw1vLFcMt9JASyTgkuhIKvkMbOEqtQ5HAfzwVFCCcEojwpqoZDYe5caFhWFTwREr
         4/oIRV9v5d+9KLkhyY9d2C22w9bJ1I/kWZJlgplud2kPkjFryHEe3S5t9bpIhBvQ+Sg/
         x4PdrTVNsDDVZEjl7BZ7Wz1YpNAjomN3M5aC+kRbDcRWJVbHApdw6pYQWmlM1WPgIFWI
         ZBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284050; x=1779888850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGxu9nJ7AW3a2oAYSUYkb6lYeXmMA2jA36FeW8nwHiA=;
        b=iURY6uSP1C0HXwyCVc9YV6bXLp1GXbWlslqS7y/QFUHv+jVd2flQbUR8+6voDlFPNg
         I8HpSmgggWLjqqEQQbZvloQSSb37Pdo9dZ3q9f8O/0MAPkH+m71KiKvH36GIzkj0SoZM
         vND2RpHBTy9M9Z9Yqo8pHL77i2tzKTBnzxk4lSHAN+f34VxHifnZv3u16gp8x2f0soxt
         SSQMgdAINdKhw+FqCOTv5enZ97RYAA674bYr6s2mBSOaR7CPRHlogTj43Pp7k/ELwlJo
         7RxTeNUKlnRGiy91Du0PN72INzhHf6QTVOHWBY2h7qo6erBlWdCNjAm72IU5rQOwNWVj
         zrZw==
X-Forwarded-Encrypted: i=1; AFNElJ+o8WOZTmKPiPuFOAgeiHGQt6069lKD8Xb4iTvYoEZOGW6wVk34zyr3wi/3By49GOHnuTi3IdMfugHR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5udIfSu2CMJxD7JK6LIB7BbHYdt3DTqWS6+v/HxFBi2hPFtnD
	M97ZgDbnt9wGMoscqwXc4xplQ86gNHlILwLFNvYv70/HY0jbnBRm++HT
X-Gm-Gg: Acq92OGZREmAGIWCGpQeqMTogO1dHpQPyO6Wn6mMJiubBC9zIYe+NYodsIZqg7SRDA1
	lNNG/02h7HGfIKTF3TS74MyB5VuIUaJ0gXnpVsC71tM0TPNCGZ0lHjaafII3iX5vwojU/LRjVjw
	GXMth4UOdWwOnj92mx7YQHMHao79iHkcz0PuFTIZyTF9I3XhYdw8u1jvgd+5K0+xXbI/pHzNH1p
	xPz6tvosUQsN4ui31Eq7FIL1SRY5djstPngNFlRguno5RME+ql2tkoKcyB/ucuVCLuKEsWVbq0z
	cj0l6ST/d7+DWIFQDOsTfqTuaR3KSlYbIj4kDl91CFT0ao/LRDSHFbm+nJSaDlypL4i4zOgsHBq
	UjJ4g9P8o06dYW4WQO5XJKP4Ffj3EXD9q4sMeNmTt16Dc/mpCfYfqM/2LD1bBDuu5BxXP5zlv4r
	MDCtG0YuiQGVsIuKFwrdJKHrD+xKorivfKWo3iMv8=
X-Received: by 2002:a05:6870:21e8:b0:42c:2042:1652 with SMTP id 586e51a60fabf-43a2dcc3808mr15993070fac.24.1779284050251;
        Wed, 20 May 2026 06:34:10 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a956fa075sm10253951fac.10.2026.05.20.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:34:10 -0700 (PDT)
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
Subject: [PATCH v6 3/6] dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
Date: Wed, 20 May 2026 21:33:40 +0800
Message-ID: <20260520133343.1423946-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
References: <20260520133343.1423946-1-jerrysteve1101@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8216-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.1:email]
X-Rspamd-Queue-Id: 14B6158ED8E
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


