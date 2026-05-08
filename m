Return-Path: <linux-leds+bounces-8050-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGdSEYjh/Wn0jwAAu9opvQ
	(envelope-from <linux-leds+bounces-8050-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:13:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5B4F6D99
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B213F307A386
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7108F3E2749;
	Fri,  8 May 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHdQy4t+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1B3E122D
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245926; cv=none; b=rvq+4Im4hiM9GTZF2d+wznkG8NbR7HP5iiOVdaz46dEbbIvQk2mM/mHCSUk4gK3P0C1Rt8Ro1Eu9pmjwF/RkmNMk2AwutyrSsaQfu5RytzMUzKkrMUQ6lObPRi8VVCyWTySBqk91eNEN2t9J91AjDmaH4Ko5vq8GO5f/voQSK3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245926; c=relaxed/simple;
	bh=IgPi+KiUlvSYzb5bOFDhIuxsi0TzKHGTzxqKb+B+qrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCSYU62o8s2zGWgM9PT0kAUDWk2gFaW5MYJRzvENQPZXiO+mPR4aF82z04LVorodNwpPA59qB0uSfDiIorkpEYcT2DNFczSubMA/S92nq/KusC9ezaQ7MSodzzo0ZoO8EiWYdpS5q9ogzXbx+aY6efWWF4ZksOXgBJ4ncoDnjgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHdQy4t+; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0ad52830cso3012290eec.1
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245924; x=1778850724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUGu5L00lvWoEhryhoDzPdaQlgLIQeV9TJd2A1wMzug=;
        b=gHdQy4t+fkotyWh9ZytQMZCycciBZ0ejEuiHChqAFzaQ/YNgP0eRhXi9id+DBg6Kl6
         toI7DE1IMJy37QmukaN59zI4Ck1UwqnWm9zSSl9x99BuX53ggXzGdnwUfBseMjt5yQ+W
         yZVMUPbvAxXbXCII8TVHCYKLOlQ+1u7vP1RnYqO36/ZoivBOMewRASU4qLPK7HtocpQ6
         gXJ7BpEToK3hCOsC4MZayI9Ugd3P9WrmM2nYKyXuwxOMknIc9jq9yzHDHYp1I8iLoF/U
         aRHhQ5FSduHGuiSb0+SWYyt+KSBITSEOrn7UIyALz/COHIGdawejdUgraMZc3I22hvB5
         J3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245924; x=1778850724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FUGu5L00lvWoEhryhoDzPdaQlgLIQeV9TJd2A1wMzug=;
        b=acYQhOaychsriJobz/vITbdbzwLbuTQrzPFBnh42Hvx0YDXFMKvy4h5r+hOfXeVCHP
         HqRDZrb+I7awmy6+S+OY6suwgAHqh7xLTbAz8IwFrcFRfgWqLgswWMq0385QbGqLlhEl
         6bu7Uqr5YN0fEmWqfEZJeNHCqtOobnQ3t8wYoQ+owKpL+XHVFUYB7nUUlDgYuMJMlFJ1
         9xQUsJc2q9RRbDFrq79+GUxbrdhGtxgGjR6weS5ksgFZ+bUnQOXTnoIOnZexGKDFudsm
         qINDrMrh8iRIqjZ5nXmQfNDM3YJP5NAULVtpLYHH2JAWAGNqj6Y4JStdnMuP8KcPBw7a
         nwaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+8f+gqewa5Ii+RGmcBEUrDf8S8KJJQ0RoYAcbEVI/dJADoTUB/R4dRfZOD2ENFYZP1UBHdQaCozFz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRmL3iKNUpk+/HQsFGPqgO/GHx9drQGIjXqf796h7p3eocEpgc
	/zLa6s/KR56HbTRoHvsOgVaek3otW6tn6VPcOjKd+eJGoRRUoLMFjT/G
X-Gm-Gg: Acq92OGXiVXdmdu+q7Aeor5Bl20wC8xcp992oq1h1XNdxaC6XWeNnbV+QV1u0Qu8Ogt
	OWD3k1zbOCCOccLerDL55ZU/7Bd55+99y1HeyiLLmd2AVElPdsNDzUuMhDuJMk3eO6QmAHIus1H
	t0k9vNfBMk05LtTWyVeVfvcqejFT/L25crcZbCuMQTAlFpwk58dVy7WLYD5Im4KYTyLoIqnDxP3
	iOr9fqV/Es1DorrCw/mML11laZUEWnRLHa67pE2yB21c/Q/MC2C/gbsKlM8GHYamRazPWT9mqG3
	vvd7IHctCh3fsYaKURRbUTC+YlwkZHa9iuKtuGC//YJqxss1mZsRFiAnUSQGIga5KUv2n125DON
	KSvJ4h76QMHqpITdJXU00/g/Dy5SXMQ5FoXNmDDef5t8/xsrAVSFoQfA5fszKkY4UfZJezKLWgt
	41rvkntu3ZhfXVQdEOiw==
X-Received: by 2002:a05:7301:3f07:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-2f54a77fd56mr6219341eec.16.1778245924141;
        Fri, 08 May 2026 06:12:04 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:12:03 -0700 (PDT)
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
Subject: [PATCH v5 3/5] dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
Date: Fri,  8 May 2026 21:11:37 +0800
Message-ID: <20260508131139.1523597-4-jerrysteve1101@gmail.com>
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
X-Rspamd-Queue-Id: 95F5B4F6D99
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
	TAGGED_FROM(0.00)[bounces-8050-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Action: no action

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index a8ed62fd2f35..1763d3a17168 100644
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
2.53.0


