Return-Path: <linux-leds+bounces-7553-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMwtMWyvyGlRowUAu9opvQ
	(envelope-from <linux-leds+bounces-7553-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:48 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01E350B6D
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7EF6F302F699
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A455218821;
	Sun, 29 Mar 2026 04:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdAInTUc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E95D28030E
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759734; cv=none; b=bByBn4uEkHxx0Nplvuq9KzdEer4tPthx1c6mWOLRhK7Yf+F/1KvYBNOK9eUNYrJFFrqK47qUauoR0Wm5r+ysiYTBu+4FFnet3lRIdJe5r+orlGK72ABz86o1ymSASlmwfCjK1OeameQVrTjpmKiL3+KCSDm0kazt2YUO45eoZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759734; c=relaxed/simple;
	bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMDDPelbca2+CzAV75CI7th1lIpBJ8OwCKxSxP0HroSbSRwXo0EuAaMCnAoOA/2Vwu/EW0Jwas0B9HrAf+e0AIyj5IFND2X5Vywi1qGgSRkhlvYQ+/vpXU8wIapFGZ8li9FMSPgWyeEkbXZs4gf0fajAyBXKBzgfJrcbjMUiGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdAInTUc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso2203385a91.3
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759730; x=1775364530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=AdAInTUcsFpyZtVCb7wwDIsvK9voELpIJJzB55MboIHKr6QHRj5qjl62KWMOs3m0mJ
         HZ5ASnBqulq4Xt/l3xuMgtuUa7gol+n71M5rtEAHtup4iKVNWQ8H9xC9qYC4d0J8TfaT
         u0FZa4KRMxGt/kjech/AamV78xelsERLrinp4ylbl9iCuuN2bqGrNlVtaN2uUH64ds9G
         SzaRuZHHbdwqyPS/YGC5k5dXf7YzZHkCuYk4WNG4R3cEN7o5TYe7uoGwm9g3vCElAPKE
         EgRaewXk/zu1iv/A1p6Ab81yVe5h6t0fzqyq6oITtESyRuvAYzasXaUo+y6YoX449CFu
         AwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759730; x=1775364530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3tZXb9ZuOyelSj6Z0lI4WVX4+hZpWr55+BMQK3m+PI=;
        b=HYwQbEf8wxAybdKo8Ic3EfNogXLB2VqA7YyTexiI4tigieVoCc361NoX/AnNLUmJOk
         yNxQxpY/mhdn0dRAV2zuXybllmYTgUA5X5+DeyE3cPY3N9qBTILbQJTqwaXS/Ne+2eZW
         tcks3HpYWjGf1/4zipzVS3U8HGdrNhaIB3r5RLx3sYAG/z2C0NXjGApIvFEcmaM27THX
         47yAopnwSh8PYL+ZIuhYGns33aQOiq3McZZ/J2YTZtTyk84+VtBogXMB3CC/TMA5tHpg
         UBnwNhKn+Qc8li75MSXiEcs7NO7MehWykl2mRd60GlHJ1emHzAhLoEZj+7H2cp13duvU
         hD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRrGrCEXkWNBktwE52NhgoNet/gvQyIwgzhdZ2treFm8siCcPG9banj0pvxozLKK1vTy9IbG3H/L4V@vger.kernel.org
X-Gm-Message-State: AOJu0YzSd0apkPkNU/8l4bxP3RMtw1953DkbJ9J0J5+E+s0UFl3MYEnx
	Hie5buK5conAph15s2fgippuMF/KaI9SqOJ41oS8RCAkMufdgGNHmj4Y
X-Gm-Gg: ATEYQzzVFyvJvVe5uq8y8sDamHnitxLl21zpGO0q3FefcsKCBOMYkgQngM2Nryj9rp8
	qhS5+n8gpAplhhPOYwc327QVythMZPsjV7HyM8N03yFHG0COOo5qtwqrVF6igw+8tpgNggCUkLY
	qmYrGzgCbyguzjONS+pBf/cZUJXGT8oEoCXKsOzLo+s7LdTdS/9ZAhkmSdASU61WQPwRgy8NFOG
	QmHmiahtFyTpPPYGODpTBX5QY/HTADdV8pykTeA0CO1cQJZJDVXm3fojmbhyvFFbdSYWsb3+rBD
	aIp8jctr6KDFBOV/OHGg6YqZ+eeDGWqyCPvG8Y+0W1QmdL2Vjcn2lgYC/GXhstI/h0OFNsjj5cr
	O1150NPuZQSyMLFh2LosnkMzzojGaVUajuHQw70v+3841bDqVpcfrdnnmkOxuPhkUqDYugaxpTk
	HmExk/CR5x0n6H2YfUqqwu3VolIYJ/K4GeWVrRIJ4=
X-Received: by 2002:a05:6a20:94cb:b0:39b:f026:6f7c with SMTP id adf61e73a8af0-39c87ba1d3dmr9052151637.49.1774759730149;
        Sat, 28 Mar 2026 21:48:50 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:49 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:01 +0000
Subject: [PATCH v2 6/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-6-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=963;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=jbxDqNZvBi2gj9IFvEI90pxmvLwKV+j3EaaxzyzaJTA=;
 b=81X8217C3DPp0B0P3hZM4aXOCm8lzOtEXnsLAMxdNbbkMgYAO3fE2YKhyEY97/IFdfQWBu+QK
 SnzdsTunBnRBxxt0Ihn4/T2XiSr+rqhd+1F/PnfcK3LZuxS90GFTwgJ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7553-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mess.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4C01E350B6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).

Reviewed-by: Sean Young <sean@mess.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
index 72cadebf6e3e..0297bfbb2750 100644
--- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
@@ -25,7 +25,7 @@ properties:
 
   duty-cycle:
     $ref: /schemas/types.yaml#/definitions/uint8
-    enum: [50, 60, 70, 75, 80, 90]
+    enum: [30, 50, 60, 70, 75, 80, 90]
     description:
       Percentage of one period in which the signal is active.
 

-- 
2.53.0


