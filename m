Return-Path: <linux-leds+bounces-7870-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC6dKuAc8GlYOgEAu9opvQ
	(envelope-from <linux-leds+bounces-7870-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:35:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02947CCCF
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 04:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A256B3020869
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 02:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478E392C2F;
	Tue, 28 Apr 2026 02:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9ItfmiJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511123921ED
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 02:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343668; cv=none; b=GIIqBg1mCRGWxCttDZ/HxSEAAgJnsf8akZli+CeuI09eJXOoKRxbkxuICnTgODYLGjBzpg8w9ZFdyt0ltALjNxq7owThRs1USkim0ZjFrlRM2Ru4jQYcqyCXHilQzwR28QoyOFn/PiXldSzvnzYiG+XmKoBGr2ucVTAq6MhkGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343668; c=relaxed/simple;
	bh=CJUlV5ZGL2a0Kw37Rv/d6rN43lebSWKZyj19oPTDg2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZqXTQZqq5thaNHKy00p6dvd9qdtgvSxb6wl7jbKWqOb9uwdIiNRq5uOKBGXbVcAb1Um/1q/IQNrtGsWPtYVYTESN4I6pGyZLntrdap2xpA/J6sN9x6HOftirIbOUiNmepFsbTX15QuNq9h7tflDJS5J64IwUGrqkUvxoSnCpjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9ItfmiJ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c156c4a9efso14970017eec.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Apr 2026 19:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777343666; x=1777948466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIvaBLCfPoEc37CPnNNc7g+bHLIb1FyeO/iLLKd/V/8=;
        b=d9ItfmiJSE200ul8V88MArVBTVlGWKgdQJPc7OVHmePD4OamPh6nM+Kqgm9/TKDdwM
         AFxSxco2bkFqhdWhtAGwHZ55QSkBi0tfJImOZGi/7bAXa90XBBQEpIkcBsMW/SxLg/qL
         Sd8n8AmLvPWiQPb1cZQkhb0AvvtQqZIhlrYOJJUcO9rAyyrbgnTsyiB4l/ytKk55lP6a
         efHC1CsglOwZbtC52XJjden48132VAbnDm/0hzO2wudbYFBjpwTIzqrPmzcJK/I4uSm0
         lnuNpTBzVbaRtSK+wDTCxk9W6IUQ1kFaRUbaufVfTEL0/ipL4w7e59RL2ziLemQkNsiR
         oxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777343666; x=1777948466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DIvaBLCfPoEc37CPnNNc7g+bHLIb1FyeO/iLLKd/V/8=;
        b=NbKWd5RZBIV88IrUPnbfda9vls+38xgnCh0lXqqB5hxVo/pcbH/kS7SXvC4j4mMX3z
         9qJ+jvwqaZwlxFG11CpuM42iXW/5YFv5FCRnLtlLesC5y8viK+VhHeQJ4ARjOSiclnt7
         VtXtXvtHTXylIv129gxg9nhdo/XZJ2X2tyQt+kk9+WbSVrz/OcY/8PGlIDeW167BkPPR
         C9zC8tyxqa2EHS1pFOd8k9AKFshdK/6naj9Q/38CfQT1p9h5Y8HGTRQOrylr8Lc/Acb2
         v1rY4k3A2p1CDxfzPsH1D4vMdCg1z1fw3FHl/hIDQebklArDGnu5XGM43LalRti3Xzcw
         mHWw==
X-Forwarded-Encrypted: i=1; AFNElJ9MDuMuLgf2zmDeDnZ04a31DKYZs1egf73iWaoGybC+f6TVAouS4XUBK7MskmJaTvBYEgn7ieHSabb6@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOQUTR96GMHEjVpFVuV9cR/0ZLULl15XzLb79cqMjetdfFbOj
	CJjqLUO10rMLo9S0dj8mwha5jrIiplMq3PXDvu5bjfRJWUYSSj8auGVD
X-Gm-Gg: AeBDieto6RRkITwvPjQIteGwa2Z/m+it6OB6V7tHc9HG2Pk3Uh9T9E/l6QZAioh5jdk
	09Burs9Sy+AIpmu6GE5fwPx2XdnaDP7rIiV1DRWu8ts/UlNYtBij9PmzlDMmsU88GCvrxFZUja1
	suanDjkxbTrz89CBPaO+oWFZTDFzXgW0LXdeqA4r2JvjNYKYTtoXDvC9NdIjTNMhFhv7+MdMUyu
	vaWAKUkwjAmc+tYtm/BYEzrDIPnjS2HIpW7GjrAujMm5x6o+LCGL+xTOrvYe5HiD7xjowFJ4Is9
	XYkORibu8BGxy6qvleKUQG/frPJajTVp+r90TqtuSroIHcFFKn23oPLXO+W/OKBnmcJox6MpKq+
	JPQgXqjLmnFn2BwEtmpK7UikwaPHPVBg1WF2tZpi8znbDbAFePsfS7HAx6epD7yPJpIo2YcWrwm
	Fr7Pst3x1qSJlYVszB48M23OeG8I+8YLIqngCMnO373w==
X-Received: by 2002:a05:7300:4309:b0:2e2:d94d:6175 with SMTP id 5a478bee46e88-2ed0a066883mr649285eec.12.1777343666244;
        Mon, 27 Apr 2026 19:34:26 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebe6sm1088066eec.30.2026.04.27.19.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:34:26 -0700 (PDT)
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
Subject: [PATCH v2 3/5] dt-bindings: leds: leds-is31fl32xx: Add shutdown-gpios property
Date: Tue, 28 Apr 2026 10:33:59 +0800
Message-ID: <20260428023401.330308-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428023401.330308-1-jerrysteve1101@gmail.com>
References: <20260428023401.330308-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A02947CCCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7870-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email]

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
index 25ce67940c88..4654aa07dc63 100644
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


