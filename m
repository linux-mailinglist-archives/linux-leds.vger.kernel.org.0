Return-Path: <linux-leds+bounces-7550-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOSgDTivyGlPowUAu9opvQ
	(envelope-from <linux-leds+bounces-7550-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB8350AFD
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 06:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76914301E9B3
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 04:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9634284B3B;
	Sun, 29 Mar 2026 04:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiSFP0Nh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DC3257423
	for <linux-leds@vger.kernel.org>; Sun, 29 Mar 2026 04:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759712; cv=none; b=hpZ/tWuVU/d1ToM48SsFb2xbGD1+mTQcmIv7ZbyQvRxF9LWTbFxBjlmObsgnKU7egGGeoyeKFFijPJPgkprnrBOFrsmgMcbJFNMd7g++DERY6CJGh1d76BS7TcZ/crWXKO3jb0amFSXTmB8jL7xIHiWIV/2ZhEEL49o0ReWeBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759712; c=relaxed/simple;
	bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VR3FB8U+mkL+qxDXxmvq8HVNTaaNRVD5Rw5y0uBwzjQyerCdo2gj7SNnQ3KFrDKbtHE+oL/iV/aipMVRX+gplGmKzKtWvRAX6JotHTO1sDIZlLhY4r23IWJwyN5JbON3auH8G+ldmmwJHrWB7mWZRLcHuo7xr9n4uApRy5QLBH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiSFP0Nh; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c766a95a72dso2290788a12.1
        for <linux-leds@vger.kernel.org>; Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759709; x=1775364509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=SiSFP0NhBAJmtHnRK2BBtz3Go07NRQ13nWKVqMWzf16AJC/Z0DSvJAbFA0DXqed1LQ
         o0OjDbJFjinHM6gFTxGD5d7FxHXM2q3dsk0Ze21Ba2RoNG1xuyHfyS27f71iBfgAeFDa
         +gNwIbtZ1ONfXllgQRStXkxJvDU86ABwXNK+iENAUl7ybpVAW45yiscaJaJwu3VIK0zp
         cPaZJOYKXzm+omic4bL3rxD/7TxFrNHqtll9zsubjqn70t6BcQYMPJ0gPo0MP0KFafSM
         3C+q4GtoTYJOBAqLA481D3PoaBsOOI1JWarW10RSdvjgzLtdhCicR19mxKW1JpzZKfHW
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759709; x=1775364509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X72F+IYkq8vmJ6nRPI8ppD04puTmgdxZkpkri1mXXzg=;
        b=UDmAH7B7vtYHWcjZwQbTSJSZm3yibKgJ782uWrVpmpaoJiOZgtbr6m8LaFKLKFtwVh
         kikNL2GqlLyRMinRW6OcpCTBL5S5DFIL45nmxvxdbQ5HDGvmlJtQAJpuufiOZX/6FDR8
         0R/cCzBdfculWN2cjmGBEKBVWDMHBXIxXVgbt0ToB45sPNYr3xO9KQhOHDKlPYN4Dezg
         7pW4wpUR2RtotUsAAVCTqH4f8xWO0/PqfUqUnRjQ2B2IqCr+RpTapkNlwQ8UgUxVKffv
         ublv5BkP/ebjo8zHC0OyY7snP+WWIIquONejtsl/prkOIk719tKikW7QBnz+rxpv3m6/
         dCtg==
X-Forwarded-Encrypted: i=1; AJvYcCVntTvkH7RSjKwE8RXlj4HYD/gz6glMrf32XyiZFagHnV2NP9NuvFGmLEt7GNQKzhAFc4Bf7YpX7VaR@vger.kernel.org
X-Gm-Message-State: AOJu0YwZrGfq0dhnb22rc2PyC+LP2478nd1jH4CdCdYG4tDhmcjtyMXR
	BwL1RBoOFH4h9pPOhLuivpvjsgnbcXusd1aevJ19Ckyk6n6LycHOSM6Y
X-Gm-Gg: ATEYQzz48dS1rZKYY8Ewjpkw3iMhF99T633UCbvPqBe2kJXrn8SERIvXlR8W6JXi+4+
	QYQLKaKly3Fd5eBdbMTHUFb5MdQZhSK/z8c75DQcnz8397HYcqkFqDO/poSQNzBZGn/4/wLKkXi
	Lh+X5WPX6n1FIbqsdpch/tfC+yJgacvQ2mh0AEcAPNDd3m1hjxxIOE+IvlAvsPw0NQs8F5foHEw
	3tcD+moF7nWWm9UmBO/LRxSvy+2PRyyM3T2nBeEQjd89IpPuaaQDizNAkjYtqbFviIU3/NlvuEz
	xETckdEv3qdEDvvABoqfImndF3bDa+srODJoyVAr0aAbYtHaKEKxmOKHHtHdMLXg44VHhg+N2/v
	kNGq2BO2KIqpNpd3uzEd5E+MvvE24GyHiVq7UZ18iRsq1u/+gzqkyPHuNff2f90IdHTAj5eN5K9
	1O3SHd9ij3/yEcZFoqsoeSBKAt31AO
X-Received: by 2002:a05:6a20:9188:b0:394:6344:e5c4 with SMTP id adf61e73a8af0-39c877ea332mr8300548637.3.1774759709300;
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:29 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:58 +0000
Subject: [PATCH v2 3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-3-870e0745e55e@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1039;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=mrDnR0G7mbNJho3HlF5gQvzhoEN14/C2UquKRdZ6H1k=;
 b=ph9fTagfBVXtK331HF7XaRKTIzItjVo85alsUFGqPrhIYNQAXctTJbC9AbxZpAXzv901QbdE4
 v03zR55ULznCzUwTjppN1GV1PAgNPMg6p+EkNIgfHXbZXAuTkgnD9xj
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
	TAGGED_FROM(0.00)[bounces-7550-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
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
X-Rspamd-Queue-Id: ECEB8350AFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the vibrator on the PMI632 which is used on this phone.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 7eecd9dc3028..88691f1fa3a1 100644
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


