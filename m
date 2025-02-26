Return-Path: <linux-leds+bounces-4097-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD99A46180
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 14:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6037D189024D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E122154A;
	Wed, 26 Feb 2025 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SxeTb02k"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD62215F65
	for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740578353; cv=none; b=kn5DW8L4YFKM9P2KxoVkKGpKY0fMXDRi1ucRYUD1q7NXxpx524u75khi6LbqTnXzQURFDNDCp9jei8bRD7Ajfsl6CeGfEwSVZw5QRJM/TCmc9wVHaNV9V5rRhYEdbehgtG+reWWNbRbzqTDMbVj23NvB3PtLqB09Bfo0Ya/hWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740578353; c=relaxed/simple;
	bh=dpudgvnbUcleNul+hZceK0VKC5IVn5ot1Wf/pV1Rlms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AkLn8Gn0gfBqtppTwDl6Dj6WA3aWYcmA75bwkYZ6RbfrDpzX2vJk3w+A2qDXj1SrLnozAbAI2pjL7P1LZLWWOFiLwoc6M8p0V7VW7rnHDm0Wyht40HEuZceMH0FP9Dy2sLQ9eAYAQ35IKRe5Ws1yNZNbjbFOSBmcrD7a+8Rjrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SxeTb02k; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb86beea8cso1220351766b.1
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2025 05:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740578349; x=1741183149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RCyJrcyE+zDY5d7yM/G99bmmgj+BdOtnhD+8xJaSKWs=;
        b=SxeTb02kHoSSzQYEEo0ZFmiAoqNFxVtrLnSK9axuXLqcl36BedEIM2uRzrUXr0ckeR
         fLWFjSk+aW04wjRCa59FLIc4B51Yf35QGj4uVL7BAhFZXFN5vrbOCknjH0TN+n4En0O2
         fWMxPVCe0vgffOTdq7FGMHYmp6GkwP15d7RHgYaEz2UmkWcmO3RGxk3xkaDROqLL4KIZ
         7IxRqEJZxsyxqt9qWLTRb6MjqK80AwXy0187MVPFiSwAHm/XzTS9peTjVSux+djqaKCD
         KrhzV9xRqYDC5P/X1arny4/qdi4HmphzhtHzedKwxV/d97cNr1HWUYKCVdXVMzHXv/ck
         pYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578349; x=1741183149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCyJrcyE+zDY5d7yM/G99bmmgj+BdOtnhD+8xJaSKWs=;
        b=FO1KcelNsU9vctBcWAOecgs4jBUQehLZHn+J4rj9oQoWHQzITgelpVxxAJ4qXTeKW2
         8hdnZKXFGM6a6u2O0utyTBqrTLP9HVqYP1PgpgG7vJWi9K1MaBz6I8YHUIJ0vm/7V7/Q
         bCk3n1NQi4lzqxQJZYHWm6f9973dAUnWOaqWL/5l+zw5auRG7LRiu2uVGuQ8gMM+BF4X
         +D3WN6vI3CbwRniMP7wd3uEK6aqupvI+t4AORQG0IIZd3MT9lvorx8hSgvoC/jQpSuzR
         adZufaOKoFTdiS4of6sI+df1O/h65hRgtio1j0Q+gd6ycnArjIT04mVFptRSTTyGpz5f
         CSWg==
X-Forwarded-Encrypted: i=1; AJvYcCUzNuPSmXRet9Ilkwik2Fx8Kp5V5h1r81GJOgFHZSC/0Y/Qhcf0ZeeiUN/PTQiBjRamfZe3vdbhd5RN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/U1xNU/yAUyvfrsVnXzSEnxrn5frSiIQHcZ9zfck8ptowqXkI
	h8hx8nozdC7wfq1soESO5sZJlYHPJOAx168rLW/L65GYp3d52N7uAnTp22jpkzQ=
X-Gm-Gg: ASbGnct3dntSpcOinY/+92Pt/wdcnt9qh8U7Lj6WPpF2qdcnDMAKkfKaxGGpdu4KVPZ
	vaXUFbBhvspak4BxZ6zWJKcgmAGNY2FRhrMIZecFPJHk5VDsdPL3MpshB3IxwBuKit+bvE+jz5a
	ZnFf71yv/87udROyJZPGzEJm2701FYNUUGjc65bbiacV6RuAnShMCcJdA7KLyITFBUZpiLCrnWo
	4NLgWCCpAlPTo2XEGCd+/wXuN4zNPYaCkrzeR7MdaHfI3YIS4X+IyN+etMntd+vldA5zoVi2/pw
	YtdpJt8v90pTeyOQLShbcxpK
X-Google-Smtp-Source: AGHT+IGq1MD2BDjxaTNyMW9AYMWQfWuRsIcBB0Qs6fRE/nNI8ikyhvYQIfVztbGPD1jUdmJkn3n44g==
X-Received: by 2002:a17:907:c407:b0:abb:c647:a4bf with SMTP id a640c23a62f3a-abeeedd14c4mr424666866b.23.1740578348617;
        Wed, 26 Feb 2025 05:59:08 -0800 (PST)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm335378766b.56.2025.02.26.05.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 05:59:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] leds: rgb: leds-qcom-lpg: Fixes for Hi-Res PWMs
Date: Wed, 26 Feb 2025 15:58:53 +0200
Message-Id: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0ev2cC/5WNQQ6CMBBFr0Jm7Zi2CRRdeQ/DosIIk0ALU1Mxh
 LtbuYHL9/Pz3gaRhCnCtdhAKHHk4DOYUwHt4HxPyF1mMMqUyhiFI3URlzZMOM49PnnFya04vyc
 MHgdGoYiqslTb2jh7eUA2zUL5eFTuTeaB4yvI54gm/Vv/8yeNGp2uNLWVVeTK28jeSTgH6aHZ9
 /0Ljx58x9cAAAA=
X-Change-ID: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=dpudgvnbUcleNul+hZceK0VKC5IVn5ot1Wf/pV1Rlms=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnvx4f+K5OoGjex7nW/4xpB3UQMVg2ciOnq4MZt
 AtkYDMMfzaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ78eHwAKCRAbX0TJAJUV
 Vr0OEACaW6bstCuhhC51Fa4BY2tM329x00NpUmyHEZEHxBIZse/iKDaEO/WV6VUbrmq/X03T434
 NnIhP8ysLwmkeEv9WWhs8zMq5a9J/EyWwlFdjaVfZ48BljECe29OdcyKHECnjL80XELXXGmlrVM
 BuSMsfb6tfeDAThAy5DzGtix4gsfI02MxRNevm4m0M5O2Hcy3lOMuDJrHuvO/hYQFexC/jcCopZ
 kE4Kg2UOcvYzRF1ybaqrKkNG+Qvb498LI/Km9cgsxnzPJG9sIaLvN/fJua0b5gBm9PNMLBakZ/q
 GZ+aYOrUgf6gQq3derUoneVLK5ULDArBDqnzmVeqHwXiYxNiNWJKvPuY+K3AbcnwQIBFG7FK7Qg
 nu2yLM9/w5oT+P3keIPs/2oJ/bs/8Jn5vOxKEfAVsMvS3qsr0cvXenDBkcCurgrnYzCSpCAsl9C
 Hxs0mY8SNPdBqmN8MftLsPYdmFumvMnE/illVRHx5ZcDkReetHIfhXmwp6GgwD509Xk5ajL2wLn
 SmdEtJ65L2fyETHmOtpf8sMAsxAq3EdtUJpmPjz5QfeNahRY0nKOiTEl6IvqhDeR6xcD0f+4xj6
 6oeI1+fs95RP9IcOxYMPmszqMlB47Iaii/3nnkiIZvEBjgs9LgvtJT/c48sUOC8xu2qVXoirPbC
 jMi/DoM2CeEg2Aw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The PWM Hi-Res allow configuring the PWM resolution from 8 bits PWM
values up to 15 bits values. The current implementation loops through
all possible resolutions (PWM sizes) on top of the already existing
process of determining the prediv, exponent and refclk.

The first issue is that the maximum value used for capping is wrongly
hardcoded.

The second issue is that it uses the wrong maximum possible PWM
value for determining the best matched period.

Fix both.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit to drop the details that are not important
  w.r.t. what the patch is fixing.
- Added another patch which fixes the resolution used for determining
  best matched period and PWM config.
- Link to v1: https://lore.kernel.org/r/20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org

---
Abel Vesa (2):
      leds: rgb: leds-qcom-lpg: Fix pwm resolution max for Hi-Res PWMs
      leds: rgb: leds-qcom-lpg: Fix calculation of best period Hi-Res PWMs

 drivers/leds/rgb/leds-qcom-lpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


