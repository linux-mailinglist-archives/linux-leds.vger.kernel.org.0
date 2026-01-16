Return-Path: <linux-leds+bounces-6654-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09179D2CE9D
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 08:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F744300E629
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 07:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B79234F247;
	Fri, 16 Jan 2026 07:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kyznlMjT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UYWnlIdz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40132938A;
	Fri, 16 Jan 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547287; cv=none; b=IS1SGHHYf7gOHsaKK+D/EL32qJbc5hSTzKBeoWkP0cUfb83bazDz2YS7hvIu5AqItW0XkZfDrpvLYJnLkWNsr9NDoOlGORVbCJiwnNDZyxokEMaJaLhnFkK9bYBWLVobqwICwhrFgfbShiV491z2KRZ3SxCtV+00lCNrWaApZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547287; c=relaxed/simple;
	bh=C7f1Wsl4PAXBG1FKv0Z/4MadLG834+BqLQH+xcJmGYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+Jl8Manb+ut6BJYvj/BytytatknWLZMzOQcyWHjF4VR/5aKz1wQ6I/Wwo+xOaToTTXO5OhBX57Z+EiblhjlE98t6te/OPYMoybjjJ+ECCIn7IK6FYuHjsudVCssks32uonM6qke2mkt1H+nL/49T4zNiyhwwJAfBpBtnuuQ4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kyznlMjT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UYWnlIdz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547278; bh=RjCN5VQHgx91mUr87hbsMZ0
	O/PV+IbGWFJvvdqUb2QY=; b=kyznlMjT16s5MlI8bcl9xOXxGJ6LrOHfL2kEeo5dfNC6RExQ8a
	SptTqj+zdvMY9AwdqQbGJ/BA4171qdTfmw/sykfcIB8hbCaZcBXPOahXHpPGSiiwNpkINiwTGLa
	h01HiZWZq5iwAUVvsvVC86lGR1Ys+5UtpzQM11dpS+WWM8HmhAp0lmkcpazoM/TL9nE75JAa7Ze
	VkxDjF3MImWvP+SrVNcnGqrrRNg17n4gwZ9se/vd1RzkZbTxs9ZLyX/zZ27PsMwhpo1X4HGVVnU
	C5QvqDGPWeMMbBAckVjQOELPjlj86sBQkSSJ4pmL/jWurJcwiHlvSS01ACneJxDo6UA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768547278; bh=RjCN5VQHgx91mUr87hbsMZ0
	O/PV+IbGWFJvvdqUb2QY=; b=UYWnlIdzVJKu4F/3dC7wReuaMP1qNdLEotHpWx3SLjsRgKHXTu
	LEM16tYfZ8ZqiPcEou2oYA68lt0Td2pEAdAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 08:07:34 +0100
Subject: [PATCH v3 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-pmi8950-wled-v3-2-e6c93de84079@mainlining.org>
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
In-Reply-To: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, 
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, 
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, 
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768547276; l=2315;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=C7f1Wsl4PAXBG1FKv0Z/4MadLG834+BqLQH+xcJmGYA=;
 b=zY8EdQADuq0Cuq6XFUvpqNHgufGwZuwqSTuwga6EYYtRN+JBM51Hw6ofa3SWUEg0nDifa2j8H
 6KaR2pDNoygDPUrGDxhObElF1kIEkm9h4q+M961Bxjhkrs3HoklnHeO
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

WLED4 found in PMI8994 supports different ovp values.

Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index a63bb42c8f8b..5decbd39b789 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
 	.size = ARRAY_SIZE(wled4_ovp_values),
 };
 
+static const u32 pmi8994_wled_ovp_values[] = {
+	31000, 29500, 19400, 17800,
+};
+
+static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
+	.values = pmi8994_wled_ovp_values,
+	.size = ARRAY_SIZE(pmi8994_wled_ovp_values),
+};
+
 static inline u32 wled5_ovp_values_fn(u32 idx)
 {
 	/*
@@ -1357,6 +1366,29 @@ static int wled_configure(struct wled *wled)
 		},
 	};
 
+	const struct wled_u32_opts pmi8994_wled_opts[] = {
+		{
+			.name = "qcom,current-boost-limit",
+			.val_ptr = &cfg->boost_i_limit,
+			.cfg = &wled4_boost_i_limit_cfg,
+		},
+		{
+			.name = "qcom,current-limit-microamp",
+			.val_ptr = &cfg->string_i_limit,
+			.cfg = &wled4_string_i_limit_cfg,
+		},
+		{
+			.name = "qcom,ovp-millivolt",
+			.val_ptr = &cfg->ovp,
+			.cfg = &pmi8994_wled_ovp_cfg,
+		},
+		{
+			.name = "qcom,switching-freq",
+			.val_ptr = &cfg->switch_freq,
+			.cfg = &wled3_switch_freq_cfg,
+		},
+	};
+
 	const struct wled_u32_opts wled5_opts[] = {
 		{
 			.name = "qcom,current-boost-limit",
@@ -1423,8 +1455,13 @@ static int wled_configure(struct wled *wled)
 		break;
 
 	case 4:
-		u32_opts = wled4_opts;
-		size = ARRAY_SIZE(wled4_opts);
+		if (of_device_is_compatible(dev->of_node, "qcom,pmi8994-wled")) {
+			u32_opts = pmi8994_wled_opts;
+			size = ARRAY_SIZE(pmi8994_wled_opts);
+		} else {
+			u32_opts = wled4_opts;
+			size = ARRAY_SIZE(wled4_opts);
+		}
 		*cfg = wled4_config_defaults;
 		wled->wled_set_brightness = wled4_set_brightness;
 		wled->wled_sync_toggle = wled3_sync_toggle;

-- 
2.52.0


