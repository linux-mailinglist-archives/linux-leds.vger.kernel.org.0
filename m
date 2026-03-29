Return-Path: <linux-leds+bounces-7554-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLSBA06vyGlRowUAu9opvQ
	(envelope-from <linux-leds+bounces-7554-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 124FE350B38
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12B6D30072A4
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C457285041;
	Sun, 29 Mar 2026 04:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pETnFdge"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881727FD6D
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759738; cv=none; b=e2pPgtZ7HyM6sbtwrrKQBpcNh8+5hABHvwdIQS0ljydchYcB8Z2qzsao9FGCNKUrVccrIcGcBtHNcnHOftovmFAHjDppuBxSoYI26eZ8rhUYYIQz4jMRVHIMggD0Y0zUccx1Fk5s90wBqOnKq7rg6+GPN0pMdgKDmWDWFGFJBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759738; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCzLawJZVaTsxsU5OU8sO6td0J0AJPvMFWAS0axzps7usNIlJ8PuL+A5PShmkBwbyW3Z+58WOKgKdetFp9e6DJ1SOBiY0c31ZHB3I5Gu8QP6vs0Sr6YO7PL9DZmDuxkTcpSn038ZexaoCsE5y3eepkjN3lLvERuILapcV8zFkd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pETnFdge; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8298fad2063so1928409b3a.3
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759737; x=1775364537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=pETnFdgeZDjhWJx7qdfn+Q3+x4F2R0sIk8fjtKm5gRbkSs9Z24WqpPBn9ub0yFhl0I
         DC6bIs8bmZWtmKmaB1F+lyqfJUApA5rZ4h5YiaWKtLcVeDdFm+bPxbM1W4nrAJo2+5EU
         w+ahwNwgmNWJ27WfRY+/o5xwrezmb69/virhHfjMG3mtbjGoSh3rJtqBxWTzsCKvbsng
         BLiHbk7V/odSxcUpiIyomaegBVI0X0pJSfoMOzPLTTczme0wagdbWCgznrIU4HEa+Lkq
         DPKWlzxNb5mF6f9Bx72TjgvWuU6lZ99CVqzYFgwqYipVqe+JlHp0Q3gEhgCCAFXhNmUK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759737; x=1775364537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=Kamj5adH75EsRQUMZtg0iPEHI8mTAuMXpezALQKoXj9dwy4S74bqUG/d44jZPcnSxx
         pDbNS2BF3HPGiWCl3NB4TS01lJUOsYdxBbsGz229uo+VVKLVqL6+x7evbyg7lMfOexZv
         7qSGMRE7xdQ6E9d97buEKVgDaVHRc4KWxSyTcad30l6IAe87k9pIUnFglybeULoflqyL
         K60pJmn0YnEAXSXYCOG8z+AWVea55/kfJ6Aqx+BdXidALGuJmYUkIyzpHqaZB5Vie0QV
         RN1F2FmeGsEd69PwUUMOm/p5iGILyXHZfnvfWJ9q62N/Yn1gIj/uMV6P4cJDpX1jPeIq
         /+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUTS2ejgOwHYKdlvmFIzRQZ2o6dKoUnvFYasSgpbiqHD5j/qzgwiNjCNCbOvkdynTWX3sorvLD3UCOl@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcKmvKd1uUIXr7YBNrUhhwBuIeS+21fbUQWGS3jF4YRb00Hnr
	yxcWC9TnO+9IeW1BP5zyDVu+bHkF0+g37Tnz1Nf1fUdY/Llkd2fBqxKc
X-Gm-Gg: ATEYQzwTCF/hcQZNze+zWHCSsU+De5OuRMHrCArtndq0aUG8Nj6gDgdWrygec4Rfq0i
	oB73uwMcPgnv4BQeaqffpQY5wD+kbNvGuWnLzR6QVRZNDNw37a/w7AzKDrKDG3o4B6jqpnBwBMm
	h9SrGDsAic9aBWALwvBQF+1wI2YocPwt4PwNd6an0u/TGE/vGeOqOzYK4Fvlw9gpNRMXjyhV26K
	1QJdsQkLqg1FHvt/aI5L46avJU2KJivezEcn/39gw3LBCiFYoDO/8cQMnEKpSUJVf1g0H/O/jK9
	oe+xkOqlVsbnQOGvbWImrfY/C1El8G7jQZ7p1gbV3Pha3XVX8rhNQrnfkBcNecB4BY7kv4To7EA
	EuaCZ6C+d26HfuwV16TpJU1z8mnBPZiu98LhKptTN8GQE8oYqjducyIukQq2R49x8C4BN5LgS82
	8pMfQZyHLX+IsVsSZ/wY1JZOccdlP2
X-Received: by 2002:a05:6a20:938e:b0:398:a128:d463 with SMTP id adf61e73a8af0-39c87a3c214mr8660465637.35.1774759736982;
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:02 +0000
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-7-870e0745e55e@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=AjUWH+AdSOG/5ukRpNAwaXcythhtMm7E9TAuzpnElRgLKa+TAvWs+43AuNxf5Ryx8NJQ1jxE0
 4oBI9xuIcl0AadPRbyVh5WjXVeiB3FcSq+LKxcHqBqYrYdg9M7tkFIx
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
	TAGGED_FROM(0.00)[bounces-7554-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.1:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 124FE350B38
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


