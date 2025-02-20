Return-Path: <linux-leds+bounces-4016-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F9A3D6C2
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 11:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7F3160E95
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372C31F12ED;
	Thu, 20 Feb 2025 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oajjSPzM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370191EF094
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740047476; cv=none; b=f5YCWT85Fs9uCw3vYilcfZZZ/pcnWoeMBTwkMh5BzWyR/98ZrHZIFxKhg2ZFAYQR5i38IFsZ1hhD3aSuCij1ikhNqnBJSX0MF0Bh5l/GIy3fv65r2PBbQBbBOtc6nPJwA+unsxCNh/FbcwmBJPJjsWHZPs4pfxnsRLwKwpWfzmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740047476; c=relaxed/simple;
	bh=7atARvokLY07mqgnr8qm+w1Plqn46HRkXLWGb+WjuPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TZZvMrRa4lrid4FM6mVFve2zb9+MfaW4A8ZRfCi18PTBXzApWndY7Wm2OtrBZwldyQVrjcdKPDAFb7OX3E2ixfkgd9UzICZdOWvsDXfxjtwMK80FVeRz1bWCa6I4ErJYwxTeTUBlxDRT+MCG3rCUhYUxlsQo5HznTDjjw9UWYmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oajjSPzM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso1002313a12.1
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 02:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740047472; x=1740652272; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8pZn6/QFo8TbDdZwnXuIATxRnl2SnecFyZcNTZXt6k=;
        b=oajjSPzMCQ0Q0JyepqfS6giDdmcRHHXBJjdPKPtL1M84DE2LdZuQ0PdHW1Lcmvbth+
         9aIJDAQZpmiTOHpDyyAlcLk90Jw5fg1wtRrY2gMlQBAsZVdrk2Ziw7ClaGKsMhDargoe
         inKVHa6zEEt0RiVj2G7e0JFP4ubHoCNvsGqbnpYSbEIH58OLvN4JhK20wy6Q2ozZ6tyO
         WYLG5SlBzpJaMw9goBsK3FnGReXOtED6FE2Xk/xn/9coH7MRJSXD3H2aT0Nru+lKCHVF
         zt+0choJcOsNRYB9PUSB8shTegNyl8csbXfK60p/XGWdjIeFPyP5VFzpHyycAlTEgkjk
         Sf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740047472; x=1740652272;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8pZn6/QFo8TbDdZwnXuIATxRnl2SnecFyZcNTZXt6k=;
        b=UoyKtoUQc0xj65fpwLeWQIIgaBjAlgzBKqNecHkN6zZdQPDZBxD7mZZ4jPege++L4Z
         HYKj+XCRhUAnpuqu2szQ2k0VLJ7lnDrLfEu9zhqjQfNyXaVz2RpnnCU0O6+QAnrG8+8s
         z7ZZfV1J099kXE6IexIuGWRnQTRyAMH9vrwcSYMe83OjjFsmsYPAssAB1RYSfJN0BytZ
         tEAbgj38SdE5ggHxc1d+sBTL0opqFJuxXh7ePEl7sSnBEw72KbaLHy50mEFl96V3yT5I
         suoQlQZTXuIsgvTObsPvVmtGrWl93hrUf6fI+eDS+to2aLAftEBnSK9V0YAN3ftxbdVo
         515A==
X-Forwarded-Encrypted: i=1; AJvYcCWKvb5b/0ikE7xN4ukzjyEXtOaWNTFDPnIBvieadyJMhP4eYo01e5eTtBsLRSlxb8B3WwfGnPYoY0s4@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3TwYJELD0u7tpE1mAJh1bZGN50n2lruu2tdSnp44+OSxggGm
	gBz0fOHvtCDLTIt6Ne2mtOVjV4dXyBDdBnzZdhDLzAh+KQsg/yMIb2Ipxp9NOFY=
X-Gm-Gg: ASbGncvbOYj7iaPu+PaCkuLLcewZ2C79EShTMl7KaEo5AGnMdi35FtS164pDD7r+dcq
	RUO+vGODGNWJ6TkT6eggAQaN/p17XyTsWzh0SATRKTmNZJJ7gKkJWyNprOfQdO+wnrAdtPVYkcH
	KOS3OLSx8XKdVkVwSQMzzgCCPXwbCKqyvoq0KlDapBmW5li+rjgeWjmUyTzgni822UXWaoOHwPZ
	Bs6HQON1lgAHww9qYB9FGCnoqQjAWUPQAsxNn9/fggs/xejCIyXm8KNjM73prfSTvKHb0zRlhwH
	AKKNxHmxavlFzA==
X-Google-Smtp-Source: AGHT+IGkLjx1lyMFl288723pjRQskad0IrpyzmWLZ2jkcgybDcgcD4iSXpmxCzpSlh3nibMQ8BJ3eA==
X-Received: by 2002:a17:907:6ea9:b0:abb:b294:6a2d with SMTP id a640c23a62f3a-abbcd0b9393mr650036766b.53.1740047472270;
        Thu, 20 Feb 2025 02:31:12 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb94e4d0adsm823778366b.56.2025.02.20.02.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:31:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 20 Feb 2025 12:31:00 +0200
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGQEt2cC/x2NzQrCMBAGX6Xs2Q/igqb6KuIhtmu70PyYhVoof
 XeDx4FhZieTqmJ073aqsqppTg3Op46GOaRJoGNjYscXx+ywyGj4DDliKRPeuiGGDeUbkRNmRRW
 Du3rpfc/B317USqVKE/+Xx/M4fl1ktPR1AAAA
X-Change-ID: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Anjelique Melendez <quic_amelende@quicinc.com>
Cc: Kamal Wadhwa <quic_kamalw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3026; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=7atARvokLY07mqgnr8qm+w1Plqn46HRkXLWGb+WjuPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBntwRt/BF7ZpH3h7g59Ow1VFkipWuLmBqZ784Q8
 oRHeGAyp56JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ7cEbQAKCRAbX0TJAJUV
 VpaWD/9MMLieWxuLt7ssUG3zSaev0aST6HosKPbBuUaxfGPTPkHOugXWpzmSdtm9MIvkl52wwPF
 QOVPNOXf0IAWuIeX+F0pv9s6FujWjAc35gi72l3JRgpST+TOAQJlXUeOWYLp/SZBwiRe0YsbeoQ
 opoR044nYTtkzjb27oPPorkFnNAl0N1IKIDa+NoBYcLHw0LvESgOSHgReOyKjAsopGWlpuqz0Fu
 UgKIOric3Exzzdm8h1VZDn4IW6HJ7LCgBZCCdDUkusN7PEHmWZ01uIP5GbPYGlHM1eRR3Wt6TcS
 gNDVAWbjLXPUD4fgDBVSypnbJVUlMjxdEb+RO7pg9Qt1s69WclpMX2pqIXdZkJREKQwXmqgMr09
 iFXTqtvnfCOERxIlYL9wEw1z7dQC3hugrU8SsvaTQJZoE8RgzqMF8t5Kbrf9bIec1vWB1wP8bsm
 L60yfnR8OlUbXsB3NILUCEQ0F+g2Bukq1OkE94VUSE/MnLZH+zJrNGK7DSbAGAl8mxa9LvjJhJL
 +e0k+3GhN3Gnkb1RrIdJB4pD4EZhUdJhZpw5Tf/KZX2FSPIzOtuh/JanIjEVtjf7TfJN5a9Z5ye
 ft8l1XhGDhs644s5ZbwCsH2Utj6JzN07JZvL/OG3WGPL6MMFBe1KC5wVE7syn2cEmBrEh+DTUwa
 rw7s4JyW6yh0/QA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Currently, for the high resolution PWMs, the resolution, clock,
pre-divider and exponent are being selected based on period. Basically,
the implementation loops over each one of these and tries to find the
closest (higher) period based on the following formula:

                          period * refclk
prediv_exp = log2 -------------------------------------
                    NSEC_PER_SEC * pre_div * resolution

Since the resolution is power of 2, the actual period resulting is
usually higher than what the resolution allows. That's why the duty
cycle requested needs to be capped to the maximum value allowed by the
resolution (known as PWM size).

Here is an example of how this can happen:

For a requested period of 5000000, the best clock is 19.2MHz, the best
prediv is 5, the best exponent is 6 and the best resolution is 256.

Then, the pwm value is determined based on requested period and duty
cycle, best prediv, best exponent and best clock, using the following
formula:

                            duty * refclk
pwm_value = ----------------------------------------------
                NSEC_PER_SEC * prediv * (1 << prediv_exp)

So in this specific scenario:

(5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) = 300

With a resolution of 8 bits, this pwm value obviously goes over.

Therefore, the max pwm value allowed needs to be 255.

If not, the PMIC internal logic will only value that is under the set PWM
size, resulting in a wrapped around PWM value.

This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel version)
which uses one of the PMK8550 to control the LCD backlight.

Fix the value of the PWM by capping to a max based on the chosen
resolution (PWM size).

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Note: This fix is blocking backlight support on Lenovo Thinkpad T14s
Gen6 (LCD version), for which I have patches ready to send once this
patch is agreed on (review) and merged.
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310321e939022dfb176e9f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
 	unsigned int clk_rate;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		max = LPG_RESOLUTION_15BIT - 1;
+		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;
 		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
 	} else {
 		max = LPG_RESOLUTION_9BIT - 1;

---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


