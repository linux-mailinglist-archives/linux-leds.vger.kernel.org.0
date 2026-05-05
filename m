Return-Path: <linux-leds+bounces-8003-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOpULhEF+mkEIgMAu9opvQ
	(envelope-from <linux-leds+bounces-8003-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:56:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA44CFCCD
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131393043FCD
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E856F1DF27D;
	Tue,  5 May 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9tptfuX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BEE47ECE8
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992858; cv=none; b=pz9szpwLPa8QGYjYd7zwF+6YKC8N0PGpoiIQM0Dgvf8HVvTFCpRdqNcat6Vhdojf7PAUE8NmyJm/K2wpyvcl731pw8+iz8Bosza1kDvd6+isKTmAmhbUF07z7iViLr18BHbJvdK2nQGieawGHqBsHGq/TZCgsD9os8YZdDKP5yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992858; c=relaxed/simple;
	bh=W1Q97PzM4MjRKWidF01pEeQQIC0Jg95ywafaeF9c8MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGyG6h8Zv4gcr32NXolFj+BfRz4zDlnR9My07Uu/BdxSnimRnfiSd1+Sfmt8FM9ugEYMhIs/opqS2AzxaCHxCdMjPNe6c5P5aU7y0jUuEliPpNd3YWjXStPewaLKrkeCnRQ8vaVmKKtkyg+eDO6zMwgobk/2L7I+KVHiz12jsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9tptfuX; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so3622851eec.0
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992856; x=1778597656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=b9tptfuXUqir6uhsFCJVdTuhTniZcA9JEieBr/gFdZWgsoDrLdyn3Me9zHLBe1emts
         /M60x+8rPWY6sOjkaCO1EYV4LxY2H5JFsccDUOtYXJReU832rJknzEeHIhrMUrIbqQjf
         qqhuNtQpaZQ6IZI8xEo3LMuXgz+sdZ63Sxt0T8fsM4O5NI7xaO8RnzHxP8+C33GkW+WR
         A/BC+1+uUnsUmuFRyF3fRFjHHJapooitt9XmiZk8+IKa8MXsQVgJ+KMxtwKIXnCr5O0A
         EBFlBgvj88yEAp3Od3SnhkFWtUcDlNbHc6PljlVnFjqKEpRcF0Rli6OMsI7Ivzr+vRTn
         rImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992856; x=1778597656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=RSOpY2Lxm1VxevpQOHFSE5EZ4PonF2KTl5LucEQzFXufGA1WCXvrW9/Uj4rSAx9P61
         DCUQagXkvnHToHEeghXcdcAfvbhj50jI0Dw2YUtA2+luopAqh94TG7ygagL1RUd07hxq
         70Y3VcCQndafSmCYgE0JHbKo2lNyyQPtlx7bVeBt5Z1UVvrD6ALjILAMNeuQTcKA9yF3
         gQo/DnNUHImwHYMrTynM230WKfu2fz5mW8X9XYpFrIjtoMAk7YPahRj49UE4d1Cu0Wgk
         YP7B1ViqqzlEf0OOkoa9vxqNelVegKrsPwmx6Gp4XKy5YATDGTdKJ9MyZFPv5xV/aata
         c/Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+N8yHeEhxVS9w+d3cBgBDOWjCewpTPdNQnytXWY8mwtCb6DKQYW2u7dXK1z3Er9YvKecDuxfT9UYQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Fny1Lwfzl7h5qo/Mzsy8sdZwUFwEaw63UQQaDi9+5Uu4cf3g
	kuqBIca7v+yej8skkaOiLAe6tV9EVpkUoCRdaHpVPwqZX1KX2GErqyVR
X-Gm-Gg: AeBDiesjVBYh769RIr+HJi7eZ9E9OnKuKwl2pV50HsZXG5v/GWtO2STDl6RYoHzJil3
	x0Nfr12v4zHE3VkA5PAnT3X2+E9ptg75JAt8NTGRdvk7Y5X59WUn4TUNMYoYlt+db4s8Z32d00G
	KJwWWmV2+ugAfq0l6/AvU+Ism+A2UO3CdIWwOSVIRVm/wIfriEoPFMYUvL7sWBWWY4WPGgLd0qc
	6ycqfvMvfQPTfDCL8GC3VNFhtz52bli8nVffbaABrHtSS7hUmVwLSiIV8CXB+PKBhhC+idy96Vo
	dnjpMnrZwOeRM/ZTO+gGjkFUT73s2TnAfWFrDRKFVYjSd6HfsdE2OXstSptKwkbYHdjunC1uENv
	ft43nDncUC6hXIE4wKVBNpFE1DxVdoc82G957Xr9HpiGTbWxseCgI61QOdw9L7scmKXwWyIa6XH
	xl/DVf4NGUwjzGq0DiVTSNn0Z7CjEqd69glupIj1+L5Q==
X-Received: by 2002:a05:7300:5726:b0:2da:44ac:6d0d with SMTP id 5a478bee46e88-2f4091e6ec3mr1757535eec.20.1777992855767;
        Tue, 05 May 2026 07:54:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:15 -0700 (PDT)
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
Subject: [PATCH v4 3/5] dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
Date: Tue,  5 May 2026 22:53:52 +0800
Message-ID: <20260505145354.1267095-4-jerrysteve1101@gmail.com>
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
X-Rspamd-Queue-Id: 65FA44CFCCD
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-8003-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 25ce67940c88..9b129f962d1f 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
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
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0


