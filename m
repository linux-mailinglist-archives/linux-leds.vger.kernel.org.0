Return-Path: <linux-leds+bounces-7491-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JE7MzwmxGm9wwQAu9opvQ
	(envelope-from <linux-leds+bounces-7491-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:15:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9732A68C
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 680F530D7886
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F8B41C30B;
	Wed, 25 Mar 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rg3CnNqC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F864218AA
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462077; cv=none; b=UkwVGeCz4TlWxQDOouxxBGpxOeS/iGDxlM7/450/scnxKuiHkE1fT+nkxFC4RFmnr7rpoyD/9YIaYawSrA0Os/86tiBzZfIXySy65NlnMEo/XMTC+WLMUJrfWlVnS88QvgmC6+fUU7YS0r6GXB4ppgTO4AZRKcuhXtdI+/WxBZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462077; c=relaxed/simple;
	bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oo9aeJ8xKmaxPklO+u8w7jVlggx9Pu1gJYe2+/Y1iDs/3+mrRdrd/Eif5ithff5BAuYBA0RvN+eY15PNURbQOPiTaUkWiUggpRpGvIn/yj9BtySRfzR3uHwXwP0/KJiuUss6TMUhtg0vh8+Q49NOvdb+Uf875oYglQB9DSUqTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rg3CnNqC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf43014d0so690275ad.2
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462074; x=1775066874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=rg3CnNqCqo4TbLmH4nqVWi+2sac5TNqWk4+rZBu2G6KqgZOFXDwFbY0X38X3PuYl8T
         CTyM4j6rtsquyshphPvMIyDXjIsSg762Z8dZr7SSYwTtD06o2ioRivA+zqnpHrZxmo2T
         NhEt5JqtxyCVzDppAVYkzjonaBgYZNvW83GFdauYFDiCBSG8veHHscuMbEnN7nun6bcW
         C3iO2bgwZvZKvNAvYdsjc0EJBvXAaB/hlQLl7x1t7dlEBcfg9/tPMuT1qmhKyPIvuDfj
         gBGwB+ph4DgBWaH3nJFS1p5EMoLeZoUsJfanE10D2GhiCUVxgk8PQtJPiQ3YSP/mtnom
         IwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462074; x=1775066874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+mOTnwT88rG+TLvmnzsj95Rl2YZE5vhiJFWZaB3EQE=;
        b=rQOtJxGhqEBTMsAOOIMJq8U+vRMQNLzXrQwj8PCpke62MMur4398r57FPFP5YA5EUr
         +ypOA7eDc2JC2e/BcnEo/3tfTNunpdBJf00RdgZebgSUrlFoUSoakwf41tptv1hXG4AZ
         AkjWLjdr5fPrxu1DGADB5I31A16XSsRH4QRfRVAMwICOiWWx6MoNNZvu5pBVL3anPW5d
         Olhgcbn3J4sJipu3mXS89UwzJIAbNZEszVzCu4exrQ570mcaYHKs9mZPQzy52T++jRS2
         KTLBDWBaCiVw6FtPr1El3z3nAkyNKPODdlRRWGXuedE4suvc6OL8hfTHq19seoq3pzDS
         Jzhw==
X-Forwarded-Encrypted: i=1; AJvYcCX102/1nYmzoiFLTlsG+t1LQYLRe/pXiVI5dPI8trOjnONtMU1eHzu30xOZiws4l5pdI+BnM7IlBc2P@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBNVyLfJgcUq2hjDHRAcs6fjKltBkLSZYn6PS+iPT0zxPEpp3
	2Q4TKLKh+95kpkfjHX9RmLc6upqJBUYd4U3p0rYOuQeHT0mLlIjpMhA/
X-Gm-Gg: ATEYQzxeNSTI/63Ov9dch+gF8VpfWmbhxt5AeI/V0+vzZZ9RBBG7JrBwreOaWHitz7Z
	Uf4KnUjLpO2/VVQ+NrhJft9nJPyaX0GrT2SZl9AzLx0jcxAzGexBehnpKGOib9RuNZYgsgKJvOP
	POxnLWil6g3V8ziXQlmhpDMLK0UqVsiSkdFBbacnapjUbO4tzQTyW4EfF+6oyNzQaGheYUV1nuN
	lD5/gyAG78gdwMEXzlcQU1/0jQBBWuDWH3g6TrrvzEeuE+0f8WXhNmEbfl42omxv2YTpOlxK9KS
	3Q6nMWmXx3cCh66QLz5sroMAi37zVzXXCF3nriLd90mqFMr4XqoJkuXU1c8kPY0TR0C3aiiS2g3
	BTzcUr9gQ0qT0fZKQHo2zBdSAbgVWQo4C1vhCAnbsjj0QFjZ8Qjll4y7qFIpboYHhAnp9Lqc09M
	qLMOgtYING6guZyEjngP7PqZHQrunI
X-Received: by 2002:a17:902:ea0e:b0:2b0:afad:7ab8 with SMTP id d9443c01a7336-2b0b0ad2382mr51898775ad.29.1774462073914;
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:26 +0000
Subject: [PATCH 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-3-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=4jcpeoXLPiOxiHalfAjuvYT2yGFc2c9p3Rs4rW0U/Ds=;
 b=Rb1tdZWGQx6hFZr4eESwpKU4K5eOaB1lL5/HKB0tRnFVmA0mXAdsiwXnXAu3WdUAlnwWvnqE+
 PNBv5qA8IpBBPJQtzrzD1uIjANQwg3/048MKk8LX+Hya2EFjYmmWf17
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7491-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76F9732A68C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB-C port is used for powering external devices and transfer
data from/to them.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a..f66ff5f7693 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -116,6 +116,33 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		port {
+			pmi632_hs_in: endpoint {
+				remote-endpoint = <&usb_dwc3_hs>;
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pmi632_vib {
 	status = "okay";
 };
@@ -316,3 +343,7 @@ &uart4 {
 &usb3 {
 	status = "okay";
 };
+
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};

-- 
2.53.0


