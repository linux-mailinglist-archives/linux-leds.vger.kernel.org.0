Return-Path: <linux-leds+bounces-7588-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELhbE+ZRymnQ7gUAu9opvQ
	(envelope-from <linux-leds+bounces-7588-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:35:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D03E3596B7
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 12:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 107E030B8FCC
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 10:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540253BE16B;
	Mon, 30 Mar 2026 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb4forfJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7C3BAD84
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865689; cv=none; b=s/b+U/m9brd7RCQRcI/IQkmE8ofrYlNF2pDpW3/2X50qUO8q8oRFrK1ZbgO0T+PJ9iP6zevN9LA1zDRjV/nCPeRumLTEXF82g30G46IlTOgLxts1wdAAiLLHxTTd5+X5joB9SGXy1vFe7H3MeGCld4O7SN5QLEtuR5vycnF+4GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865689; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXZ7/PZY1IgVqFWOzj2+QH+R82u2DyA+9iAyRgVXFJSSPy4SPjFHe5XXSgzPT/t6PM0KMtNfrWFfYySKLCSSjNPBQbGVXP24Eeb9GheGeLCsbn3fjFDyOFjsVb9udglK7LZbdmO18hdJexbkBAyNiUOcVABe4wB1p/tsBCDXbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb4forfJ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8296dabef74so4068332b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865688; x=1775470488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=Cb4forfJmPguPBj5wxq+xZrPwGKgQeIsn+fftV5JAGbl8OZnG+v6sl9Y0OFKCH0kjY
         8mYBqSeXhttAzeORh6NRMUKeYMVgqit1jLGfwshCAuofuJZNZ6mucezhCqY0XgUmx8Tg
         fI21MIpDusWqrNXKTP21Nkk3AGV/u7tjZ14VEvMMpPcKH56AT/PHRs88wA7avo1J/z7o
         MB2vDLRkhbbntfzLLuxfLul5klbpyz8EldLov+xsFa85Z31k1fq+5l3lMMCpKCPZ1p0U
         2dTriIuO+tZeQyJ/HG8bqvhF4ry34/NYThTDAuby7PVRNZvxpCPXdS32PuKNurNEsLhz
         UhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865688; x=1775470488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=ZC0ZIwTx44JGW2sEjm+BTMeCoPzaM/7SNu7RDcnZNyHf9H00NieDe6Ve326ucqBHMh
         G0fZNV067q5++f4+jOtoMO1vrtGka+TN5lr8cORv1YYxSShmF+rZKriCgW/v6luhOUJ6
         MdfuOHFPM12+83ZNw5lkYPJRxP884uhwQM934YR4sgl7m8/vavvDBc1w6uofE7hUHuJX
         lGMtz0EI2AZgLgDghwtChaxEKeMjriHnyBFZd65R5OSEDvwiX1Eft2iK0Ijx7f0LF8gF
         7bQjWFGzBHI0pUfDwEaHKchVtYylPPNEZqqllmVMb/Ht2XT+on5j1HT41xQKtsBeBKmT
         c/9w==
X-Forwarded-Encrypted: i=1; AJvYcCV75xgTkSqtdGjXj2jldcyYnWtbyYHMVuGX5LmpGx5Gs1iBIHvBSvXiKLHOfQpOU3lWwvuFcTKUXLdW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4ajl52wVQDObU7UdrhYy8tvrfvWYTEFn1KRSG/jJ6VYsN+tGr
	Fo2FSDqZGtM7CrQYLDNkAKzK4XlwFLCLzBwAXM3ITygalJZC7XfCgYh0
X-Gm-Gg: ATEYQzyXpaY5adbGCyM63+RSF0mG1wvXgg9dTGdLo6Zt+mD1wefGFg2uAAnY5vZ2lAw
	lnUcPVXuH2supLCQJ+w8fHJQSva4oNTJNpkh1Nxx8PXcIyuUZeHANXc64UGKQtf+aB7sluLAZLE
	x/DS4/uo0p94i0h4K4W2au2zuhz3iaOtvkM6GtBC0EtLoRRAIS+z0t+aQW0ZmWnSAX3XH3q2Icj
	b+FvINT9ltepRKtMxnKf6afA6jEbPuCtqtkpaugA70MZrKt2xPvPe/inXA/0kMwJbhcWSZs4b0K
	JwepUBvoeHTBbtG9XCiOqodHk8FbLk2b3weOCpF/rFPI3O5OzzAX8kbGfAvw7OHEgihsvSn33E5
	uLdKVAUK+FCCrBIERF/XAs176nfL/7/1hlebr/8YF1Xe0Hd+8UQBr8dE2oF0QScGccfNHg27yH4
	eX8gCnGPlDPLXEd4fT44cNtNqixxY3
X-Received: by 2002:a05:6a00:4107:b0:82c:20e9:fa53 with SMTP id d2e1a72fcca58-82c95af2c3amr10551087b3a.5.1774865687558;
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:51 +0000
Subject: [PATCH v3 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-4-c4b778b0d7f8@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=iN7WUR2JFdKInanyaJ1nA7GlY5aCbeqHHyFtVL3dnjBxgeZPO8T73QxVOJKURbwx2GR+gVJdr
 PY0C+yTcSTeBAULpEXuamFoFN1U6WYjq0Th+2JdlIdUJCkN76sfl8CA
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7588-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,4e00000:email]
X-Rspamd-Queue-Id: 4D03E3596B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index a1a296f90f44..d26ca1637330 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1241,7 +1241,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0


