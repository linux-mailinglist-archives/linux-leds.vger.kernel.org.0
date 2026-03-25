Return-Path: <linux-leds+bounces-7489-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF1BBh4mxGm9wwQAu9opvQ
	(envelope-from <linux-leds+bounces-7489-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:14:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B62B232A651
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 19:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0241930AB154
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 18:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87673421880;
	Wed, 25 Mar 2026 18:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHYIqblN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549FD41C2E1
	for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462066; cv=none; b=AMOCL+wtH8LC+bGg038fj35WH4i7xR4J9nezxOTJm/tIFslbeGHti9HcTmEov/+5eYAiI+qs0YP7GIiVOg+SnwXuaGHoZ8r6ImHPH9bXyqKLxiUQtPXK//SEQATvI9JNoctFEHBrPdeI1ApS1+PPfCZtBU4QZkJiCG/jGw8TgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462066; c=relaxed/simple;
	bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgexM6WpF0zzLQd7iOq9TyCGvIM4CSZnWog/2EZPNPdtjLvBFWp4AWmKy6N/7V77L0QTDXYZKWyUOvi9l+5i8JP+ICX6DtLOtaXH+/6Vhbzd8fFnwh/2hhROk9PnHA0z6uBJea/rX0O7eWnfN7rPVWzj17pvaz1+goCyYomqfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHYIqblN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0b0064027so699505ad.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Mar 2026 11:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462061; x=1775066861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=tHYIqblNKibm5cLUS1Idiub9GVxPrqxSVVf1YfG+4c3zcQ651oYjnBA4CspMQAM2CW
         6/wfbGv/cBor2JhzvZTzC00XVL2n9GdeYFtcJO6THQunVkKlLCK82tfQpE9fFxMNhCjl
         vB9HT5aenL6QkixQmnbfOU3JEl/mvZzjCLHxyuQOvwy2wuLXFkB+sG7tWoXGr2vrBLSb
         32bnU59RYITv5/wPfN2Gs7LhPc3hko7HexqfRoDmJZy1yDGfPb0DDtv9T0Uoil28y1eE
         CF8imw/m6+yJESFyDc/GiSf03zfewaSiy/MJy5PWsV2wFW1oozWk9KifrFhzv7/KE5e9
         Dvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462061; x=1775066861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3LjgTjQB+SlMXVNhHwInhdKxMmJjzyO9kxNTYHklAI=;
        b=FZTYfv6J3dvV969ma5fp+ZE7GUv5FiNnBEMLHFiGa9knhpmtyt+PsZXSZ4rdHAysuX
         pJNmu80j2izrWPrkT6e/aKKFJ9YTK6JHG8ZHwAHxccfjfLiJX2EwqtTLl2XOZzWPgiNe
         7wUie4xv328OS8bAMnxJCKx4UiBXU3fztVkN7Z/AA7OVLdHO/pMaoosEsT+K6WdAHvJE
         rUqNnfOm+0ktGmb1z6O2gfUZnWjthwucBB+crb5vMuOqZw5Dr4CqY9ndukXhnlOsNMx0
         bF/dpOQz+5qyLn4Yo8jutxFK0l9YivISHZBvr1cHkVjRMtMaIo0tYWgf0CdvBHIOxZ0Y
         xi6w==
X-Forwarded-Encrypted: i=1; AJvYcCV/XtjYJPFYX0mWB6imwg/7DRzOZpTMwciwAAFXmNDc+KTOYIxTJELQwol9LQuxjVO9vno9svLvZXgr@vger.kernel.org
X-Gm-Message-State: AOJu0YwN+vJUC1WGj4p86TubFABRwhZvoaXHaNwOveaE77h3TKdoYtAG
	8kI2X7lq0k9XVnXy0/brPnmMmnIz8TdYdgQhhh1gdi5f/wXiMwEwGpml
X-Gm-Gg: ATEYQzyBihy38z5WErLg13ZZLE7ZuZTAh0acDDVUKnJtFZmPeDIuRttuunn0dyMT8/F
	EaAaGt1loIQHkx8vGirPJXWU6Y3J3iUg5OX2NLldK9t9GBMrusfHSxeD9JqnJRb4nIwQgPed9Fj
	2gkqiTEAjomnsGZoU/J+WaXISa3SdGTi/zMtE8aMd5UKGQRqZugjOHGX8xivOTCmagpeSbwH0cQ
	JyW5IjJ/E+7NmcKE5UiZPkU0nRPTZOc/e4ZfnHDs0ySMpKc3DfrmjN+oE+M4+gZSfUgKEk0kjJz
	YMjO9MKzLD7MPf0V6oqyeyKgCdudDEHTy9JMy0bYucCRO9VdBdYNT2oX3tqvjuD9tAPqge0g2Rb
	fjb46qBTcdqvqkRSPoTFO3yIe89aWhgV+X++zbaXEtL2GsaIRA21yHjmhcLa5GXgQpBDqyFG8BJ
	vqtR1ghRJwPa1h9Og0v7lJBhcw8P9h
X-Received: by 2002:a17:903:2c0c:b0:2b0:60b2:4dc with SMTP id d9443c01a7336-2b0b09cf4e1mr49434745ad.15.1774462061252;
        Wed, 25 Mar 2026 11:07:41 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:07:40 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:24 +0000
Subject: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=909;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=6OG6ZQbJeltoxnqYdrb7S4/bj6Fp0zUOkvkCuJW35ec=;
 b=/L75YqmElCivRnT3k1uY+DoU66iVUSy3psZfDffVjcwjfbXXx3kMslkg/jC4xSt8hIUlX+8px
 cr1phXGHRqIBjatTcmFRu41sIUd4E18nCR3eVSb9rAUz6oAxWXP1R+a
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7489-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: B62B232A651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the vibrator on the PMI632 which is used on this phone.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc302..88691f1fa3a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 /delete-node/ &adsp_pil_mem;
 /delete-node/ &cont_splash_mem;
@@ -115,6 +116,10 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&pmi632_vib {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.53.0


