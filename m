Return-Path: <linux-leds+bounces-4099-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D0A46186
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 14:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F153B3475
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C378E221712;
	Wed, 26 Feb 2025 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJty9foa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719AE221545
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578355; cv=none; b=gmjzNOUFrDr+jCRlrRlrwDKJL4PJVuyIzr0fTBCYepUAtyDbUNPzjB6RzSBn/yg5nG4buO3p28qKMWRdTOdFwCGuXXcEVTPCTij7IhkS0pWEQZ09xEgm1gQmZ6Ho1PULEGp1j1CqAelGEPSCzHhZ7m2AdUwUycUGiYFklP19Dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578355; c=relaxed/simple;
	bh=B6vNRR24vZm7iSTdEc4QXuLRyq/IRPqoeXQGjK0c00E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOmYhLKRtQUpJFPjTaUPym9t2hGvIgJP2xdEEa1Mb7K71VlzlTV0R1JfBud+yvvXvLqja7GOb4mrTD+3IrFji0OaQcgqrLxILzmr5dRHSol2ooMef0+yI2feTmwXPwPB/6EEH86WKKidlbrMWC99EbFpPWnqtirCCuoOZGyFEzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJty9foa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso990343966b.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 05:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740578352; x=1741183152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=436GsJyLmwRgLe/Pi/bM1GPjpxKDesYcznC8EJvTAV0=;
        b=AJty9foaOFCNTcFISDPOiUln1DzprL/0pvfUnI4hP/loPrclGot4zA3rANemzNkXLW
         At/kJmMf+ASZyzFMurB56acxTTvx4+jG+Yo2oImY7mCAAmCrDhCqgWZYPM7fegBkHpjR
         VVKK7AUNHZ8QHoqRkQhh0V7NREkjgfx7NIIwwHa8S2uQIXCso+u/bIi6yAEoG4wFo077
         lVl+umbE0gC/nOjI0G9MflIyJi1g2LUh+AZ0UnsaQgbSOlzete1zsMYz5QlqKyKkdaRO
         WS98/aBa26lAiPTXX7Lon6MPjiTt6TDMY3LDbk4HHycPkAOnckio8hkF43xbta5UeKTA
         lAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578352; x=1741183152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=436GsJyLmwRgLe/Pi/bM1GPjpxKDesYcznC8EJvTAV0=;
        b=Wu+yHaiCwl1bsV0tf7X75etRyV+NDiEp4HLTuCDNRFvaeb4YkQH9dqGiUWX1bwfKNI
         4Cw8XLHFgyMMP9F8lZK8JesV9Y7RF/TX/rcYP7J8ntlB0oHRYUaqn/JQOt14tUbO8Vmp
         /LBGaVU88j4com4KsMjnSisCYhmwk5By9JSzn5yxDVcrvFZMEu2ivxOd3CeQpUYyAXLm
         511vUgXT6cgnYQN7DDv4iRPswArgdIYhQ0QFAt6DG4Nkag3eh++mKi3C0XSHMmsttamS
         jd9FyXA4wL7ovA29y5oUXOpScyW2BmBUOtz4lJQiBpkYwA8nlu5IMlehlgDlMDjlh+OB
         XoTw==
X-Forwarded-Encrypted: i=1; AJvYcCWbIHTV/8LUYUuEr6HXBeRc7KFS7z0ML42f5gbzvwOq62+1JZVUZoHom95Qyi/+HmOMlei6nKLLQb4T@vger.kernel.org
X-Gm-Message-State: AOJu0YyjByLBhRrauR9T3fZzUbFmwPpU8x+V9zYGaG4UaRM0dd8uCS06
	GC8ADPdYc1pqX3DNlwusYH0UB5+aSQQpxGslIH+ngs+RqHVx7baxVQIcMbqBQhE=
X-Gm-Gg: ASbGncuZ0hB2+ipfADc9Ggd82CUknpdUSeuX906kavWAWef1xGBsEUVn/UEUP0hfMxv
	/UQzgGqT38akrTsRb6aOaeLY27V0SDPD7ciZCkdhrFjuSy/vz4aR2TdWDUr3Ud5cORRf5zFnIJD
	gTCAdBwchMCtqW9i7FmmTH/NRj1MqacfS1xU2qqNiSwA1Ta1egNGWKMytujHajXPb2o5Hn69MRP
	feTVWt7B5mZtTrq062b05DnRvmKhq4MsdUSKat25CsHEtxCco2vloSmoFDQWY+p1lDHAHftnvCR
	Bca5f8HY7MKypgo2N0Qt/WiX
X-Google-Smtp-Source: AGHT+IE5ZCJikWYBQYNCfYeCZ7i01fPaQ1YL5PYutRrdkWV8ZfElsYhJmfpfgT7H3II/AP9b0v/4mA==
X-Received: by 2002:a17:907:7706:b0:abb:c7d2:3a65 with SMTP id a640c23a62f3a-abeeef64485mr389483966b.39.1740578351780;
        Wed, 26 Feb 2025 05:59:11 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm335378766b.56.2025.02.26.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 05:59:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 26 Feb 2025 15:58:55 +0200
Subject: [PATCH v2 2/2] leds: rgb: leds-qcom-lpg: Fix calculation of best
 period Hi-Res PWMs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-2-7af5ef5d220b@linaro.org>
References: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org>
In-Reply-To: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Anjelique Melendez <quic_amelende@quicinc.com>
Cc: Kamal Wadhwa <quic_kamalw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2125; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=B6vNRR24vZm7iSTdEc4QXuLRyq/IRPqoeXQGjK0c00E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnvx4qQlcZWrwEMBg5/sca45Aic4oiGh3wo+wat
 QxqpZiktruJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ78eKgAKCRAbX0TJAJUV
 VpcOD/9avCUtmDTMHZbfSFIgp5PcEQzz734ZCCgByqtIk66s8J7P8Ssk5NGSJ2FdPbW1rnKkd9k
 qUdvQBApJpc6D23MzZURiVTANNCrnK6g/VyPHRPHI3LHwBN6pmgPUzaDQe8zPPqOEouXXToFcxm
 bHGP8OaM+isg2DJyL5+KXRCG1LuMOqFVDOBQT1g9TeMdE1QXwWj4uQfUOL73tAhXaYjXRMiButy
 tPMx9Tk8lDmfpKqJJ3T9BXv0NRkLJLsbhRnEzhWqvcpu1Dpa95OkzfduDzMmD9zkpc+9NmMPhyA
 BBBxRHYNuU6xuIEhTjentojQGNJyN6FSvh4QPF/bZX4QG404U+Hp/vfpZEvaT92IcUtx9sWZB/4
 mdvPjal7XDY1u5hW7HD1d9nfLNvv/v9DPyL7MBYDXcv55JeIabLdQM2oaTQ+wg4HPoqWglAJkIq
 bLIAGRbwuEcYFjbbjPYL28XzWKKYtRUpoU3UZdHVWyet8HpOAtf7M7eSPmAHMHXLzmD7jEnqlRp
 b8b6ijyCibnOMivunZWBbFA34qMVdi+a6+jEYN8YuLHIXs4dNQxq9R8tISx39iKxE5PZ5jzpCSn
 yi0XbiH2/NC/yC2MpdR89E111LpqkptQuElxYqIf78UohQyelGaoqXm9LbwMm9fnDj9nZ1CoMnc
 afCK0DsTY7N4UyQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

When determining the actual best period by looping through all
possible PWM configs, the resolution currently used is based on
bit shift value which is off-by-one above the possible maximum
PWM value allowed.

So subtract one from the resolution before determining the best
period so that the maximum duty cycle requested by the PWM user
won't result in a value above the maximum allowed.

Cc: stable@vger.kernel.org    # 6.4
Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 146cd9b447787bf170310321e939022dfb176e9f..5d8e27e2e7ae71c19637b90cc15eb363c53317d9 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -461,7 +461,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 		max_res = LPG_RESOLUTION_9BIT;
 	}
 
-	min_period = div64_u64((u64)NSEC_PER_SEC * (1 << pwm_resolution_arr[0]),
+	min_period = div64_u64((u64)NSEC_PER_SEC * ((1 << pwm_resolution_arr[0]) - 1),
 			       clk_rate_arr[clk_len - 1]);
 	if (period <= min_period)
 		return -EINVAL;
@@ -482,7 +482,7 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 	 */
 
 	for (i = 0; i < pwm_resolution_count; i++) {
-		resolution = 1 << pwm_resolution_arr[i];
+		resolution = (1 << pwm_resolution_arr[i]) - 1;
 		for (clk_sel = 1; clk_sel < clk_len; clk_sel++) {
 			u64 numerator = period * clk_rate_arr[clk_sel];
 
@@ -1291,7 +1291,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret)
 			return ret;
 
-		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * (1 << resolution) *
+		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
 						 pre_div * (1 << m), refclk);
 		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
 	} else {

-- 
2.34.1


