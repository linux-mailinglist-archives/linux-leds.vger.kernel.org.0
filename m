Return-Path: <linux-leds+bounces-7586-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMBTGI9Pymmb7QUAu9opvQ
	(envelope-from <linux-leds+bounces-7586-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:25:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D23592C0
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56DBF313E05E
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 10:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EBF3C4555;
	Mon, 30 Mar 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJfPQAG2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C93C3C08
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865676; cv=none; b=BA2dK9mItmnNyihQcnhW7MNbgxPPYuhwVb5xdabUkQ4O3XNuU5e+W1sUD437V10ScFLdeeI4fVorvlxkp30P7sk3M5pOPoTFzDPJdHaBz1761F+3ceO5l8MuRc013fiutXeiZJ6u3azR8MbU+H9KtyBydxXPp7oMQdGMbYQfLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865676; c=relaxed/simple;
	bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsDSr+EZM9Rzq1kewtQ4IHPwvZvdApxPerXueVYXZcpeH//3XAFip1UrNRkvnGWXeesIcrQeU0pvJC6DSBxCKp/ro5ySxXx7ITZfTHLL8xbGa45GlUKxRxL1rJX2BxTnHYeQQQ/W8tLgKZU5h4Oj/fkTWtPD9ctghC4/1ZMaeWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJfPQAG2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a655cfab5so4032350b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865674; x=1775470474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=SJfPQAG2gvjArsgafQ+L0PoIVewB2WQh87knwVXw/2Y5SeVZQfNsqp1s9vZ3JHoOAm
         rlGKbPHelqSaT+td+cqzJRZSd+Puo4O2YvHI542h+vy6vp3LM1UfkvWqPCuplEr3jZgm
         Pdpr2heqoCBHISDCqGSDLSlD42VLIy1Y3N7GOQ6d9hf6X5moO/gsfnKwooSgI/cSB6IT
         gBcjc7nQVoED/oZB9pfnve8gRTk5LRVFY4WQ0RL343GEQoLB7Rxk5pbVX93zUZ+ugBMn
         ockt7YGCkX8Mcb5BbG+lLia/48eWIL552wdFuN8k139vCmitsTwLoYGFDjQsBSKux+L6
         nLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865674; x=1775470474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I1XVgipd/TT6ujaFT3/XiuBYTRFfr7ZfTZaRy1KGDmM=;
        b=NTazan8shSdnZIfQQJxhmI9msiOjZfsfqLtG4R8CKAhiwFR+k2WE8angyTonN0BeXB
         x5v1IeDoTlJ7LH/9CbEDYQGQB0Gd5V8ei8GrnysAGxTdd0kYna/HDkkqnMBt6lbou/8B
         fDX7ARGQGF3hNEMmo8+WJak88kRjCrYzmP51wXd/8XktL6TlfRIdC5vZpUG1AMNWL1yg
         IOKWj743v8+cLNn3lMb5KoK1QTgd/fOPHn0LNx1juHa9w5HN7OoHrH5vS15gRAFeehML
         twjZn8ANoP/xugOHlt6LjqDKaFGcUDldw8se196dNLdMWBWa7UNPMFP2NpuKdcpYPb/z
         72Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVRHDLSugFdjHyTqmPRdxnXVIg1wykr9heMq/e0GIcaUZchaKeW1awBlOSsedVsbIv6XkcCaWcuPvcF@vger.kernel.org
X-Gm-Message-State: AOJu0YwilV5whpMafHnf3QW8IvJhqLi+jfGmD6iSO64TINObqy8ow2xV
	ZWm9Yi6GcSHgU4S+EaFX1vE2JrpsSC9f1GZf7fH0YT9ILAnUixkYxV8V
X-Gm-Gg: ATEYQzwZHdfUKBNmyFOl8dCwXf4gGIuqHYBWC98UUfnjX9yZYzhrFAEyiJalYR7kpJM
	Iefj3si7D2uw2jFkZBGGhHeCFC++x2iAsjAEH+OIgJtm2xr6+v8uPA7C9l1eJODixGsK06Bsyrj
	MQtwvHXcWBO4vB7OA0SBbcaeZeFeeYMMYtWKOPOvz8oxhYwgFOp0fA4Wuecf8QGc4gZkhWc7rqM
	ZOpstPYFUxRHpZIaRp3fbeENyNlqk8/flrh9aKTQgphkRy/HaLH0q5ToxngkniiJRH4kz0kBv+F
	PHZ3I4gURV48UzzYxLXEv2eSLciC4OSo4ynCzwaj/3ztn7bXnkvVGcYr3A+uyyl0sI4OB/1v6RR
	zNoocR9hUkj9kzT35uJG7BRnzFZ40JCiJhGYqBlCVOng3m3bUdb9mbLfjqtcE387V27iyiTCjoH
	FvK2u5mJST3OXMkquA1g68FNRUz6ky9c5ncFCjJGs=
X-Received: by 2002:a05:6a00:1495:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-82c96036e65mr11779450b3a.50.1774865674423;
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:49 +0000
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom,sm6125-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-2-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1915;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=spVe4EUNVFlJB2QdEc96OFgvjKCHaL0PLCg0uw+Bke0=;
 b=NNw7v9ceZUsctwz0YvIUnOV2mrBB63atvgyvrQ82fLAnWvBuN/ux6B76TiGmJv0mP3XHayamM
 CVgeFYNRSpyDqongSmEey30Cq5OezDMrbgrvjHa02mfdXn4uwluMlSf
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
	TAGGED_FROM(0.00)[bounces-7586-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D68D23592C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding. This
also adds the '#reset-cells' property which is permitted for the
SM6125 SoC clock controllers, but not listed as a valid property.

Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm6125.yaml   | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e204430..a177a1934b19 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -42,12 +42,6 @@ properties:
       - const: cfg_ahb_clk
       - const: gcc_disp_gpll0_div_clk_src
 
-  '#clock-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   power-domains:
     description:
       A phandle and PM domain specifier for the CX power domain.
@@ -58,18 +52,16 @@ properties:
       A phandle to an OPP node describing the power domain's performance point.
     maxItems: 1
 
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -101,6 +93,7 @@ examples:
       power-domains = <&rpmpd SM6125_VDDCX>;
 
       #clock-cells = <1>;
+      #reset-cells = <1>;
       #power-domain-cells = <1>;
     };
 ...

-- 
2.53.0


