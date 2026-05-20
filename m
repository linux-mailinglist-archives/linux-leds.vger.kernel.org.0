Return-Path: <linux-leds+bounces-8222-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLbmDhK+DWrH2wUAu9opvQ
	(envelope-from <linux-leds+bounces-8222-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:58:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A0A58F308
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3453F304F5EE
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A786B3E3146;
	Wed, 20 May 2026 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SladTUN0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07A246BC0
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285446; cv=none; b=LBh4qnoZdiyASjwfVaj3Skgpg+fkjOa2zrxCBMRrqq0F3ay859cC0Ekv+pTWBCMut5qbtlxpHLhPzk/mS4Wk/5ek4U1x+6PLa2N09Rdu62D93PA7KCds8ljfnqpM4pQQ0ZTj3senGAyGc2Ebu9997Nh0StB+s+yZXkDrGd1/2Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285446; c=relaxed/simple;
	bh=tqRyoaZBs1tvjQrY9z9TFd/uxGf92frpQLPL1VyfqU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hc9f64vHXAI+Y4vaFNRR50nGFj8MT3HBaGVYciJDYnqFdjTnxcm3S32a418WpL2JJ8DIH18TvIFRmObF76R6Tq/2WTcMZ5/gltcE/O9dXyCeJGVh62GPl9z/JkvfZ3WUVvNi7subi+PWrZvN3tzOJ1TPTN+FChYn35jItShv9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SladTUN0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-369742178f8so2994031a91.0
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285444; x=1779890244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=SladTUN00vINPTNw6MvpbYPZMDYwpUJRCTSqi2BO44+cHwZi+vPOw7lavX1u1JNVsY
         aiOLksRhl0sohbHxbI9IKFYfyc9dvQ+qc/nzFbm0gj3/dKEF35FL0b6z1QgTcJnasgIW
         q16V2DSgfK84eMQUC8eYNDZERdIj1R3rE1wqNWqc32HOT9iS1J17FLMNd+WNoElHamNX
         sUgP2qNNw7W1dv9k5mpuPbbHMDEVD3TGjsf4FTdEMLtb04nfPBGvMAVb5oTPRg1ert/I
         y4+OqAsCNQ1bxASMsgxqUy3R4KqJnsU8S8l1uBMSAmwRsQCyvdvAxpX9wVeJE3g8bnxY
         GgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285444; x=1779890244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=o+PNo8zpzKnDf6f5gklCtMoCwpY0elBgpoiFb/MDyaWk38762t3y0zYLbFU+s23MGN
         tDuDB+JHiof+0nFEz8d0vwWgttNQ1pevvu0tR/Dd7yhVhT+zW1rXTVhxjFtyOH+OZziK
         k3hH5fDgT7LnLIr0QgWZVd2KnRO+rOvZlBE0nmWG14xtrUrtRN0bGZYhMMdKSKkrcGr1
         nCD3GM1bWVwnRRRpBBXrogJCkPMWyX+B5RyJ9e8ojTyzL4/o+F/Vz5yVcbiD1donCvho
         p+jqk74ve3LohARZpWwoIypuctZC7aLfgmpyy7ZcEGJQ2oQlC5Od6DsNSi93YUJKy0Oy
         ZBGA==
X-Forwarded-Encrypted: i=1; AFNElJ9oClCTVcqFXtUADn9HHG9uAkh3tQUZ9uVQKaiFKoWvw+qbaHxLK08hDziRvlnlLkgEUKObYpt8y8Lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+T99h7ZPoOI+RN0nmTvR5lb3H+2FhG6ZeetRxuZeXYrjsogua
	GiqakxW/cJenf0YTMqDCHYRUGRssvKO5iuThUqT5plRGu5HwanxlGHP9
X-Gm-Gg: Acq92OHpNZDUhUyVmgwLfIlUKMPwwqamsmxn5Y6dJsTsC5CN2Ft+gaswez0KUEEQ2a9
	EEwLtMS3bfZ1+lGDH7+LZWQsR+4f+caQbAFR+9bb1a9KRW/pkEo8xCd75bjJUq/xJXgHGgiWdLz
	Kwno26m42/jexzkFE+Lftj7BMwH56iQFuG5RmUyhRo/0DabkFfa7xMRFGbMH5Jaiio9op7rAz6B
	UiKX1Ti26p0jng/NHpt1UYeyoqSN29LUKW/OGGd0psd0FqLenENBlZZ6X0bWPNOdQostcGfxl/U
	vkW5lKQNQenTKJqQR2suS7Mqdnlu5Yv9iBkx4/AoSwtoPc+tPU13G3X7C/C0PlMMBv8esATkzm2
	jmGqkeUVJpu138d6cwWkp/N70S8eCc6McK30o3fTxHkVYEdeay85Oal2Ulb0GYnuzotEpJxOnRs
	N8KWEy2fjlwYJhg7VgstoHwqZuUMCeSyqylbdYGWc=
X-Received: by 2002:a17:90b:3c10:b0:369:a359:b189 with SMTP id 98e67ed59e1d1-369a35a15a7mr15900466a91.19.1779285444332;
        Wed, 20 May 2026 06:57:24 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:23 -0700 (PDT)
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
Subject: [PATCH v7 2/6] dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
Date: Wed, 20 May 2026 21:56:55 +0800
Message-ID: <20260520135659.1430008-3-jerrysteve1101@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8222-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lumissil.com:url,thegoodpenguin.co.uk:email]
X-Rspamd-Queue-Id: D2A0A58F308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issi,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 81f1e30e493d..5f22d8b77edd 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
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
2.54.0


