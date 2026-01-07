Return-Path: <linux-leds+bounces-6547-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04025CFDFF5
	for <lists+linux-leds@lfdr.de>; Wed, 07 Jan 2026 14:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC4730C1A54
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jan 2026 13:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992DD32D7D9;
	Wed,  7 Jan 2026 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fARlK9La";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aTNVw38g"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFC32AAAD;
	Wed,  7 Jan 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792693; cv=none; b=CWjcLq668GvUufgKTUsosV46xXOS47mmch4xZMEAx1mjLV1N62Uid3nQlgSMygtib07wkSIwFeFwkPcfyu4GqwVGzAbUd7sm2lhTNb0flN/ROdYaPXg+CnUAiiRly2PcuJFpO2IABPQVxRTUk3gh1VYeCI39FmKQZY2qJyPjbOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792693; c=relaxed/simple;
	bh=Xd0MjFaAJ8G5rg+7lKnUxtQsSoNgu2jY53dTStONPB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQqPjx2I4sAhLEY7CfNO05/MysPACut0L3lBguvRUbLGM/mY+H+05zTQLTe06wsIs0mdkYZyWccc9S4SplvHaS/jbFYS861cvXpQaA+/dd2vhCLEhB8aTnmxgwFcpA0gIO7NFZrVY2qwJFSC9puJr+0fK8/pGgbQBnUZJXAdG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fARlK9La; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aTNVw38g; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792674; bh=2ZdTHQRL24g1kd9SoN+wtFL
	oGYseQSnlsFXwk0HFrSM=; b=fARlK9LaPL5wRWuRtI6qvIwN8hIfLcVzf1S/EKZrOXc45KpZtH
	cHF9eRyicOSdRTzW6rLMrvUlqQ0P+bhQI6gafm42yYAf7RINrZAHyfnQ+59Ishuc3kw26ZWFd9g
	39J8BpC/C0AcNAUVaGSOzn7CTBm8do4jSK0LU/+Kl52M/ellFNvOtF0dtxd9rogGZTNBjkZcV/t
	YQSrQ9pRAeE4kts+6xIK30smf0iRg9GCOzaAL30YEmND9hkTw8o/IZzL4pZBQnEBGHMYK8eYCOm
	BRDz4zJ8T+/yAYsuoOoFrO2mFmAguGTfSCak0SS4ThbHXPnyD0xYSJXjiOl8DMQzXSQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767792674; bh=2ZdTHQRL24g1kd9SoN+wtFL
	oGYseQSnlsFXwk0HFrSM=; b=aTNVw38g2hxdO0mcRaxZ2UwII0oy41KUw0FyiEK3qbjqq5S2of
	pX5tgX6JTdP5LIL/slyBXwJ/eQS2bx9LGcDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 14:31:06 +0100
Subject: [PATCH 2/5] backlight: qcom-wled: Support ovp values for PMI8950
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-pmi8950-wled-v1-2-5e52f5caa39c@mainlining.org>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
In-Reply-To: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767792671; l=2256;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Xd0MjFaAJ8G5rg+7lKnUxtQsSoNgu2jY53dTStONPB0=;
 b=nEYwFjK6mLK1ued0BzaeubKOmoxZ4Rsuvgk9e3dV65YOAD70XJLMeA1wuqNBq9NE8XUTmPb3g
 czSAL4MMGekAhAaGGB3lRpylRiNzP1ajmeUggpM68I3zugxKVWMdf/L
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

WLED4 found in PMI8950 supports different ovp values.

Fixes: 10258bf4534bf ("backlight: qcom-wled: Add PMI8950 compatible")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index a63bb42c8f8b..91335aeb65a3 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
 	.size = ARRAY_SIZE(wled4_ovp_values),
 };
 
+static const u32 pmi8950_wled4_ovp_values[] = {
+	31000, 29500, 19400, 17800,
+};
+
+static const struct wled_var_cfg pmi8950_wled4_ovp_cfg = {
+	.values = pmi8950_wled4_ovp_values,
+	.size = ARRAY_SIZE(pmi8950_wled4_ovp_values),
+};
+
 static inline u32 wled5_ovp_values_fn(u32 idx)
 {
 	/*
@@ -1357,6 +1366,29 @@ static int wled_configure(struct wled *wled)
 		},
 	};
 
+	const struct wled_u32_opts pmi8950_wled4_opts[] = {
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
+			.cfg = &pmi8950_wled4_ovp_cfg,
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
+		if (of_device_is_compatible(dev->of_node, "qcom,pmi8950-wled")) {
+			u32_opts = pmi8950_wled4_opts;
+			size = ARRAY_SIZE(pmi8950_wled4_opts);
+		} else {
+			u32_opts = wled4_opts;
+			size = ARRAY_SIZE(wled4_opts);
+		}
 		*cfg = wled4_config_defaults;
 		wled->wled_set_brightness = wled4_set_brightness;
 		wled->wled_sync_toggle = wled3_sync_toggle;

-- 
2.52.0


