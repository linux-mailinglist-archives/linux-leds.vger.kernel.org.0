Return-Path: <linux-leds+bounces-7591-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMrxBc1Pymlw7gUAu9opvQ
	(envelope-from <linux-leds+bounces-7591-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:26:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB9359345
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44744308CD54
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A80F3ACA48;
	Mon, 30 Mar 2026 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv0tyoy6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5643CBE6C
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865711; cv=none; b=kxoQ9+y2BB37RI9/xUF11F6g/C6o1tG9fq/iFyqr1AN4uTnF5ngpdefQG2+U4dqzeZrzMFptxweeHVTuMQ3ouTN0/XodX85MojT/Eb5zbJzZrL4tc8/EwLNZzZyJKZqDyCsREJHpMZ/AOFZPcqRHdVaBABvdsotYiyw+TTlDWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865711; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ay12rf99lfkzWw8qfsZWic3YfBGu0YoP5poLM8LkL4Z9QrSu14UoJ4K2PpkvAhAKvw6avDA0LuHWnXNIuDCv6PP7eIVUM8MkK7r6Ou/CrmjpRX05VQR6q9+lfrwHPvgZ+irNWLjLEUaCbhZXOMHyEIir1LMVPVg0s3OceEpzt8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv0tyoy6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a7ebc729dso1845533b3a.3
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865707; x=1775470507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=Sv0tyoy6y1m8vamSJhw4Y1e3YgyRjEkT6aEqjtIupF1eRncGJ1m4CAfs6wnFyn9Gww
         OtOmh+loTqGPp6Uf2BY3mAmt2v7yqyLub0xT6URbcQhv9szKZ6NwppSUMFpn1Q/gccHM
         36d2QdPbD0ljFLRAr8gQI/Nx68y8i9t7o4OrXNT0y4G7t3C35dW+ago9axHC9s61O5cg
         HhWqjl2uamszvzw1XKV/aTTsoPY95emUcJlXjBuZsAcJnOpw2A4bbVPAZ5whS429W5dl
         Z44tq/I6ELer9qPZDLqwAXH0siYqdx9aaNImzamOiweT++lvXGxwysmbf9VqQ7zKPaCc
         JlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865707; x=1775470507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=hHINAbN/WQlXuWIyJGIvCnGD+FAp7ylkZ1eUibqxowlMo+RkutqYekgkNF2bPoQP86
         BsNDL9x1263NxdbKmi+JzNDxjLduCN1MvvLlr1LUGi6mzSv7UCOfAIBmk76hou/+9Bae
         kEPtgizgaeMuxyOtuuO79INj65tCWLrFdVvDaiLD9ql2KT9vKbuFcGLir0FvakywsaYk
         gbiIWOjRjmzkLx0JHeYYk1BJm7vJPJfXhCPQVhT5QTkmYCrEDNmAqgtraE/bWnFtxv17
         w02+YRYkR1UTOZyF4fyfFrEt+FYj09ZaI/DMDrXzLewviFbM6ghvVEDakeqYZRekkzTS
         MZyg==
X-Forwarded-Encrypted: i=1; AJvYcCXB0MROa+nBJqpZ1htPFnRRjAWT/55QUlabqb2QikdHtSwpqoep5qxK7Jf96gy44RLAICNXeaE2SaSG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsr1MXI3W2VZZiMWH48tXC6CMQE+4orD36Er1cNmTvteeQrNHD
	8A87Q5xRo7TVe0ElW9OLZT7t72buBP76o0sjRb/nc2FKecUgJv9iE834
X-Gm-Gg: ATEYQzxbBfHhv5zSGOoV3BihYAaTRsWscJlyvQqwAM/RSGDUjpz5rw30iLNyff/Qvp2
	bU48hD+aD2Gpo92TeTTbrbmET4kNxiKHTjWYOMfqfISqgTfefYzU4NGA3ft4d37dS28M9plFO/L
	mEMkXCnzeyieG2NdqofHp89jh+EzIGYC4ppVVU2taXeCvGPF2QTVfO+ZbXpozC4WIby3WLaOjaM
	nm/i4oAtCcelLI/4Q9+24R1WQzoe0W8QOawlAhc7U9W1YdmX3TxJ/CCfTTG3R6p4ixTLPthpLdM
	LzbN2SuPj2x/K1xD163j1X1dH178+BdzwfSF7nGevlGzBeSGy6Aw4+XYS/w9790RiV550dqq+uA
	e/fdLb4nglx3Oo9nW2wUNx7X5ht39r3lLiSF7f1ox+ekHaMmA5hPkElS9NAQtNuYBAVfTSt1IZ6
	4i/PezFRYHNO8Ed7nt1SRHcFVlVigb
X-Received: by 2002:a05:6a00:815:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82c95c23e4bmr11933168b3a.15.1774865707088;
        Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:54 +0000
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-7-c4b778b0d7f8@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=BedMsNwgLsE+aubdatQlTumTqlUwwOUjk7wfR9tZkRnU146OE2yO8K9gEHsRM59RMMzWQu8Bj
 xCT//XetsUpBloRKCMDWFBx1AzBe6tLOnxEoko2HAI/0xT5MzpYD7eZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-7591-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mess.org:email]
X-Rspamd-Queue-Id: 83EB9359345
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IR transmitting LED is connected to SPI8 controller.

Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693b..7d8481173171 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0


