Return-Path: <linux-leds+bounces-8002-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA0hLuYE+mkEIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8002-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:55:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A74CFCAC
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1CD33069EA1
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758C480978;
	Tue,  5 May 2026 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFahGCvn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6D480DC9
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992853; cv=none; b=PBLKoBJjWdauv81M8LAUfVMRdWv6QhuOpBudAd4LCwro0LfSeQCTYDvJKv+5GBlBZN+WXsp0AD8cMrA+lKz1y9gjIPekTMuiUXOtwwDtA4RKix3GPZpWKZVB16ZlzV592mKRME4cPLZp9slXfz3NcLJH5dLpcbkBZDmo0T1n648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992853; c=relaxed/simple;
	bh=8FIj2vwHaCPknQp78twOz1Zth9N9Ie6U66NEqjKkem0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzkECqXQiDiYESoXyQFM6UAy3bfKtWC2QZ7CMfaHmImLG+BUlxtUf7hrLvdw8R5iOFB+Cw84oa9V9VSml5cHT2ujavn9Zx6fxP3E88KMO4+pxkSOke0yijkx+jotRBqSH1r8k3ytBJDMdCw149K2cJ7KKOf4BQX8RAdlqRzIWe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFahGCvn; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ef84d016d9so8092767eec.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992852; x=1778597652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=hFahGCvnLxN32J58cZGlvUKcFbS1cHifSNSI3xU79CfcqaoZsqGQe3XbHZEGdAHOhv
         wUjBb4rLSbyiZmzy/BMnifXGir1WR2CYXAwFMJxaZBjCYNtwY+6mowNuFuhD2UqrW3Uw
         Rz2T0eCb45fgxOjxAaXQI1quh82GUb3nBXeX5pboE3P16fHLshuXb7gM7R3GCqsitHEH
         8P8cx769ZgfpN58oTdm98JeIK90Afe+MExOSfkI5HUXQO5+SEl1Srwm4YqnP3gGm1Q1y
         MfraYfP7QQ2avslYCL7AH6+ytHKS8TTT502SK3rDmPE3T/FZyriy5/eKW5Zx3kkCiEaL
         Dm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992852; x=1778597652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M8TztFWsmlUN+/A2WKJC3c5pIrurPNUURxJ+wMTWoKs=;
        b=n3us1BLYPEGpyS/JQmJPECIFOnDU2iQVBdjbtSwD7TE7VoMCcLu7pciGpDfm8r1BC3
         vU/kc7m7a472NESbs9CfhQMA+25HZ74fVEMj8mKbIDB2ZQoI4cQDCrasrlWdR2gtMH39
         6GMxFziRoM/sga84H/KZ7KHIpGnEwRta7cV5X+jLqN6jwV8bfHdPLFQvkvcTy1HoyjBz
         H9OEy1KUcFYe0LU9vjCdBpGLtRk2xcxmf2Qf9EG10XNlg6m5vkgla1c7+Xo9gIfYdqdF
         29pPKMpnN27dS9xhJ47nflKxGdpnjuUF0Z9DBaWg6exgMUB8vTTFUMGP8diAetvlpWew
         iLIw==
X-Forwarded-Encrypted: i=1; AFNElJ9aO0lh0swd1jqDLg/2fH5ssMBTt/swTO598UTUOvrniT/piml5xlovlWZ/3unLz+zjupMgvQPa7GMd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9cxp5HOn0w3wpYBE+SUmrySmYDsit8nit3emUa5zaTY8Ep/LF
	tGEdh5Kgy4AsY7dJwzqobqb6w8V6UkwIi5nmdL5CWkgcoaJNbqHWHOs/
X-Gm-Gg: AeBDiesuu+x6EvoD508GFeI2ZcjRKpSzR56jRUr5VODFlhvhRlTvWFDA+reSqCLCpSS
	Kwim6y53Q5cAtbAmmzSLiDIU/HCrwE9MlvPWcXDrRAyvq5AljKU3xH2TuERnOBT80Zc72BfB3Xa
	2YWxIiIG30geE9AGxKQyNxFAmvgW9faNWnizjPycJX8lt4qxN22vbAL58X1i5JSmU8/7QuKHSCH
	Qga6HUP9rxAv3J9go5ZAnnMQ2PbEh0ql78b2Un+jy8fMXAxU0Jgxw/9SaPY8FnNgY98JV7BU3ob
	mPa3yfje6wHuuwxLArXXGNo7VUe434lH0KpiyGt6U9F8KWm32N33XQzUw963EQN3s3Obk0VUSfr
	bYvQz4fUte257ogCiqkhmasxFaNMht/FshJiPz3UEwN9MxsuirR+aDELYt9SFIFMt3jZxyXBMmt
	GslEQNfpqiBsKK+2MnugGIN99CgjNA002AxOMhE8SRxA==
X-Received: by 2002:a05:693c:2b0d:b0:2be:6f30:f2f9 with SMTP id 5a478bee46e88-2efb9f7e8c7mr6665716eec.26.1777992851627;
        Tue, 05 May 2026 07:54:11 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:11 -0700 (PDT)
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
Subject: [PATCH v4 2/5] dt-bindings: leds: leds-is31fl32xx: add support for is31fl3236a
Date: Tue,  5 May 2026 22:53:51 +0800
Message-ID: <20260505145354.1267095-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 190A74CFCAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8002-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lumissil.com:url,thegoodpenguin.co.uk:email]

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
index cb4741dee12e..25ce67940c88 100644
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


