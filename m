Return-Path: <linux-leds+bounces-7589-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2H8FDPZQymmb7QUAu9opvQ
	(envelope-from <linux-leds+bounces-7589-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:31:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F82359539
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B950305D797
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 10:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565E3CB2C5;
	Mon, 30 Mar 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRp9e1X"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10123B9DA8
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865697; cv=none; b=K4SvQeU5ZEN0Joyl20RGgNaYxoTNRNIBeKJ0FDrBNRTG+1ZQ3gfrWEFk1WPtjFSZGgLt4Ve7Zx/tJ4Zv+/cPPPqAgKQqMNBvmdC68A2BxxmJts5hAtrhWRAjjgiyoIexZmvPAXSRSvB56TXNew0vYOOcwXKR71mzpBaOjoPrl50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865697; c=relaxed/simple;
	bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RixPL8CZfNsxkexLIEO36Aut5dWNufOCqfZhplrX3xe9kTlB1x/ce4L1JLPvtiwWEmw+2fTcxwP1TBVI+kVvXo4XIXk9UxYFEQfJxAIBenSHkfBmAiK2s9awLeFitikJMjD7ViSsqRbkDPb4O+0lmXeNCkSJXGSmNEOIokY/0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRp9e1X; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829afe24fb5so3024194b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865694; x=1775470494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=jpRp9e1X5knqWzbGGzppcH+P3WLgZVHJ5F8ZtUxgybCayfP0kGTkiyJJeV51cCE8fC
         lLhQ0QlbxbDQ+5/EjY6h2mFTEHQZQeDr9IrTNoQhRRjn7MrGWLFkiaUh/G0DFQHkOncf
         TtOqSySk8jJmHHhoGiej7BtdDLBCB5Ql/eCjDCtzfMTkWNkc8tIKlERB4h8luwrswGis
         daZMsB4+atfRc4+wLjljo7OKViMeANtiUeqvavAHme4YmbEDGHvINDfI52E7s4Cx+5rt
         Tp1EqB4x2rkh9VMyDuukPhSJd/h3RNVp4od8d2FMjMWQLWnAQ0OvAvKB203DlBt6RMIe
         hlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865694; x=1775470494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lZezNnVQNhmXmaIcjRNqOna668OUhlUp70Pxauy9gTQ=;
        b=RkkV6GRR6JQ+shWnW8cOEYk9N+zDf0Xm7hBKvwDgagjYwcmS4BLR+kw1gT71yUZeyN
         OI7l5rizJfpGmQi9kgl6I8Xddwq66guk86cEl2dwy9Tg1qDe/vebM5/wWdVaw4Evvw9s
         LAq/MoNAI9boeQcLekK/ubZ9PB4mAn7FkUPVMeT1EmdN4dfBvCGoOi8thX/OZs8SUr2o
         XTYzrb6EtHznnLQJbrHM3iQ+SCph3tceWyZcH0hjl8wXGfrf+UoXaSv4B9AtVVZqePNZ
         A6ijHAb+TbkKv8cWUVpQNGUxGSBAUR+HoFKFPC5u1vJMiVIUJKUOH0ZY73vupro2aUpz
         lfRg==
X-Forwarded-Encrypted: i=1; AJvYcCVjYN0EIxMIhHHUq3Qz5qLaGMH8NHhH0MjqsCVctdh4rUngBY7b23eZ1xtmZ5SMAFvb8DVG+MpPAcYz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2yGxTdjuzEHlPCeTJjBuBnn8dhbH8Cu8XjOiHTRw0F+ilMtnR
	aehpd3RIzmxvmTtw+UolJRhmJ5poG39hq3AXNEP0OMZHjPoBzkxjavD7
X-Gm-Gg: ATEYQzz7OcWrJrA4/Bs7mb08Rqfg1plxEASRcSbWjn/T7NqKJvR5a8fbh8/kht168tG
	2gueRr/jGL1g/x59uVYBWizgMIN5jWNbYGQiiOVy0JBHr8ODK3ZVgeYIaCgd5Yhg7L9i9brdYN1
	fpt3IyrE2/5bJjN39hIRL6broVmRvjPxxYzr2iYDA59NgfUqUGVxvv7n7prtKU1DbD4ozG06t00
	Bba/9g++Fipr4HNfwH3H7RM6PdeveUFfU6Us+HrnpEw1O27XCiQyxZK+vmaG6HWKKYcKHECZAI0
	DS0Ra9S76eVVAyl+GzdymrUJCR7p4pucDjPT+n6ZXgnoCS4CpCGyMMfu3Kzs589zeJ9k8syqi4w
	3fQuinC4HSGbFlTxWFvneosA7+von0JrW8xGirJl/BoOC4ZX8a36X/42WXLQbm8YbxUpniQPxYL
	Lbkl8uab4lysvFAmDP1mwVeaB8S7Qs
X-Received: by 2002:a05:6a00:2e18:b0:827:2a07:231d with SMTP id d2e1a72fcca58-82c95d3974fmr11984562b3a.17.1774865694152;
        Mon, 30 Mar 2026 03:14:54 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:53 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:52 +0000
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-5-c4b778b0d7f8@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1398;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=rYkzRcW245ELcqnW206enFLVoi53VbyHIjf+wFoTPok=;
 b=+0vgH3skU4ycp9nWrCr78txopZ6GUChHC1xjVO+8+tmuAJhd3X+0Sd35xvcmDK41qmuT2NngW
 EQ9DxSsP+YKDR+PEDZjOimrpKCrM57VJY1ef2DzH4Pm8lYSKyJvoTau
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7589-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75F82359539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 88691f1fa3a1..f66ff5f7693b 100644
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


