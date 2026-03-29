Return-Path: <linux-leds+bounces-7552-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHSVHUWvyGlRowUAu9opvQ
	(envelope-from <linux-leds+bounces-7552-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE8350B29
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33221301BA67
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4935C2836A6;
	Sun, 29 Mar 2026 04:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cfrb8t84"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FCB218821
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759725; cv=none; b=M1BMQ/K89pUm+xHildN2A8kn0OhwunxMJGeNb1GwlKEJ3xSQuRj7wp1+jSML1i6ABILDAVoiC3W7B0J3AhjffBpNfMrR3hOG6yzjik44cT+CY3l7xqnG4642pLB9woeC6sk8ky3ejJPTzgeq3Qkc303H2EFhUYZ3Fv8+eE/RJcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759725; c=relaxed/simple;
	bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekpJhyICHyJUN7y6juCfWGbhAH6Vl0GK5YYC3mWObS5okRtqE4xQGSheyHcpQGFSIUJieUpY8pq+5Udk+Sg6bIHoDApVBcHgJBJub9XyaXHuOkzoXRLQDSEFhjoZ7bZd9PWzvhdi37TgOL0VIJPit3W5rproFLYzurPBOcGyapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cfrb8t84; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2195515a12.0
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759723; x=1775364523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=Cfrb8t84GVzZSR4Lt1kRYfO0ko9FjSdKK4Ei9RTcJdVmaKiWeCBDW4t8XP0LXcyErp
         xuybftdsI//cUrnW5uv9tf7LEXQ8fnlyw6n8UQcCAMvKy+fbrm6wzfqxI+ScQwGb6c8/
         DsLzUfZSmxzf4eNmu4GIc06+/M4DSLODrw0HKvpCbyUjGd6D9/ISKI2nRK/YCUFZ1j1q
         BD+1yaRvJ8XQRwp1wxjyONkDrwn5WgCYNGVRSNVPrVJalSNEb/mEMGDTNMi4oBBuCc97
         4dmL50ZKHfa/TRZbBd6lglRvwYcbddAouehyNfSs7UORZo+8HoiMoOCNYjfmd0A4Kyp1
         9QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759723; x=1775364523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzjNjIV7vs7F+0soFOjYF29xe4CQGuY95uYaL9NvZ08=;
        b=MVeGh1ulXiUeMekUNxta7u9z6wO8eWNiHbc36cAVKFy27M6AboiAlbUbQTBTTZnhT0
         BdvVhstO1KJmOPEBQrx30LfXDv+8mVNkmqGdTp7IYinmdtvS/r9VOoRmaa2VxnzejYxf
         vjlckfQmH7hQf5qKufJ71o4q3Vifh9EDhwq9n9tmFp9UpkgZN4wC/C70mkPNdUE3leG6
         XN83uFrRbOVRRFeXDLNoevsXjjuMK4Zphb9DQe6U89WFtFK3sFvzgOH0CDOKLb07pVhT
         d9AbgrS0IRhgP13MnSPnZ18nUqm1gGQsxcTPc6Rju/N/J/IDUSFRlLyx2Udsy08XST+B
         QjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVHNy9sI/HBP5qWxVrLINKgSDJoVtlq3I1iCBlGMtnv5qYy0VzSWZ3xpF99g9E3WIrgayO7MQEKGZf/@vger.kernel.org
X-Gm-Message-State: AOJu0YyVS05b1cv4CVGcE6YHAyAkuyLf85x8gGiM/bA9xc4FnBw/oMN9
	fAl5y0rZVsm2490rVum1QA2zqbXZ2rbTt8WtbOmZtDBr4dUzluCM6STqJ9TBiWdF
X-Gm-Gg: ATEYQzwL4hfXY9BctaUaZStYd5s4c6do54RvwbwfkbWUf1yhSwr7ucvSIPOXVcEEAL/
	j2mHzt1iU0DuVFVm0Bk0q+c2kNYzMM1ZxJO/nmiX6WUksT1P+WNs6QUJzqNWQOQKDHDRzWvr72X
	bOGTvUtzBmtvvT0I3QaM20AtZsyObmJWfokRpjqJDyb5zBmbY7+DHGIYILxHlSxSKGrXIYkHfPC
	MAzutpmctGeOb3lSLOerTga4d5aGCfJt9ZPshEi79bDO1HrONT7EAKpTuBb0raj3xkQzI3EC/G4
	tdAVC1PcIO4jz0jE+ROWNl7F++ocdQkamO4aSpJRXgMOhsUirXqTI5xkRqgzQQ+k/+JFdU0AFq/
	02y29ksc6dYRD/VaVsqjiorfwWpM3t85IfMmi4f6LHc6LEChKJNCppb+GanmMGwoRzSlTmczlZe
	4uOotu5pbrIvkgWwCOkPB4gF6YkbTV
X-Received: by 2002:a05:6a20:3ca3:b0:366:2341:4980 with SMTP id adf61e73a8af0-39c877ea3b0mr8236099637.11.1774759723299;
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:43 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:00 +0000
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632
 Type-C property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1331;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=agGtf1ZaN182+ObGaLSh0urJ6qEhFK/46uOcaat6JdI=;
 b=utg7Uwku12WE374EulRQlObbGDRvquq1XC3xzBT3xs7T9PgEdTCMDHi0vxob22zpSO8m2qXKN
 NaI+fh1EoyTCxSeMHUAqZTybPYpieZFIj0B1IMfExt++r4LaSQdtFnj
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7552-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EFE8350B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


