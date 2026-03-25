Return-Path: <linux-leds+bounces-7493-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHPPB5EmxGmZwgQAu9opvQ
	(envelope-from <linux-leds+bounces-7493-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:16:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7589B32A6E1
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE58B31019CB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829924219E7;
	Wed, 25 Mar 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTfOEKSa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307454219EF
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462090; cv=none; b=J+SseVs78zl7xAWZsAV5a1L5kXBQV4rk187VCTcZj5NgqM9GANQ+ExyMhwJ/D4tFm72m3E6NIajYK2uFLepYAjFH1+IhYuNjFTf7VM2w9GlYqwe1bE0YE5hf3WJs3JyFLWcL7RE3TnRod7KCUSBE33Ddos22a/eNG5/US2dy7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462090; c=relaxed/simple;
	bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCxMzOXztmaVrPgcnB0Lvv/EOhA95iJa91VwQNgkYsEJZVoR4K9Jh8KebYeQWD6yHWends1qEarodJAReCmma6sSicyjOjF9n4YzEJzXQDXk76sPS4fDp+BTaZVTq4gZyc8ttIXLE4ahXRdpduIA46bb+hehJR9uXKA7U3L39gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTfOEKSa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab46931cf1so9868175ad.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462086; x=1775066886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=HTfOEKSa0UsVi1IyeIBW21dH0CkWnNyCZvtnpCq64nqTrxx/gwBEeQEH1NgOh69nYk
         iyuWqy5g1EYobSJabk0ZjAN+B88R3BvMpts9jTANvOi6RyND1201G6Ooqwxsu3Mb6iXg
         QsQQ3ovu6hWYidyBXsBZQKE2QTFxy6lcbY1I9YGL4Bd3+LOzTST8WGs3Z4QY30Cnffby
         RxfJcOPNQBEGD2TzJqnktjdexcVNh5nJifoUTFDPn/8VseXvwtK8/EEJS7WfSVVpK02n
         oCNZ7Em+9lHgD+C3WEUWb3oKvc+zVb1M6tQ0ilN689mkpMtfcfalZz3OKwxcxtQDDlSc
         0xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462086; x=1775066886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YbIRSEk2LdYbfaQWCzoRStNOdJmdBCZFQd2oDD6VfDE=;
        b=DbG4F9AaYFcs5M/oCiW+J7VvABCSuCWIdEPEiIkLEIH3cRdQfYMHFFGC1d/dBoIkoi
         MvhTqzYnOcEdCCoPAsGtQ44sLZwNjhVVMT7dz8cKh/mVWiUPQ85kAU2XL3rzIhhDpDs/
         t+/dM77AkUL64q9s1AwUyJh0nojB1WiHXeYu6nr3fvQOq3s4Xk6YnYh5QxYn0WJMTC20
         DRca8xNNvW8oDiH2hCbYaHVfWPtHXIftCG/muEKj498e4lc98KCa+OntzTWiHElIF9S6
         eT4FqwXR2dFoAzMMHpgUO8zGSTOTzHmfRu9/UzVM3BeZMBNWCtOUca2bZb6IhniM9UcB
         J4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW+q0pu8DSbHAXx8qzlRQ1bcjZV8EIIxpCs1EItel0+dIe8M1Gzsk21QvcsFxRVtro9tLRTM+zChZOd@vger.kernel.org
X-Gm-Message-State: AOJu0YyevGilIQUk8EJqFWfXz0qg5pvXarL1IpLKkcxOOFSKmvCKj4h8
	FNVSysMwWZLR+aEPqTEy12qL3N4UZmAgKCXo4Q7eNO1qdGWJtPNnlmRi
X-Gm-Gg: ATEYQzwH+aZ+bG27z/oV26hO27jahJ/WfRcbUcBlPByjNE4jeykEsz/uwdtiJ2ahrzh
	TRrbiCiOVZNNlwyM+s3c+Jlj39cHX0kj4sgzS47ZM2U0MrKqDIqvsN2MhhTMpmbLdeuTJZif0TL
	aequtgKGlv5CNmJkColezoQEGSymBqouVOA50MGiK034vgtUXRfyFl1DkMcoI0FgtBmrdo/a0A2
	qcjHyNG6CeityuYYlvTGJCXeYOljW9jUtaNJHzfWnrPvPtwBukONlG+vXuVjm6ce2UDajT7gxS3
	OIzg2l3ovpL1HBlJHRzbLTV8uZCps40h97oqNP/uL2jmdEdxPtULsYu11mtR/fonz83cKZjQlrt
	r/K7zimOiGzAASSQm1svTpAxwzCDfPagJjTGTsym91JvLZ0nFkcBAhyzzatD37yKFYEHG8KTcAA
	OBNH9a05Q2vKMp8pAvI5B2Q2d/oC0J
X-Received: by 2002:a17:903:acf:b0:2b0:aebe:259 with SMTP id d9443c01a7336-2b0b07c2bf0mr45862795ad.19.1774462086431;
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:28 +0000
Subject: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=1197;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=ftZgdg7K9cKg3ipMTIpEbbcSpLmeZk+ZpAf53O/aSkE=;
 b=xZJmCgqXcGCWixUEcWyXsMJDHpUeq+hjuOchlhVJEYjDrfI+FLSAHAJs+YKk2IrxN+R0oUgyd
 2w1srb4BwFjDfpikffzIsB2PCvgsmYpunChKq7qQ30GMdg8Q+NdoGm2
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
	TAGGED_FROM(0.00)[bounces-7493-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 7589B32A6E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IR transmitting LED is connected to SPI8 controller.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693..7d848117317 100644
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


