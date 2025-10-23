Return-Path: <linux-leds+bounces-5860-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBF0C00C6F
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 13:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA7933A9BE2
	for <lists+linux-leds@lfdr.de>; Thu, 23 Oct 2025 11:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FF630C62E;
	Thu, 23 Oct 2025 11:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ktL680r+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322FA222564
	for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219157; cv=none; b=sd6d1zukt4SnIXWMaj3GGLFJwBtDJKsOBhthmN9YwFXXUJ9p7iGB9Eosu3fDofEcLxanHtG4n2Jw794rIuHW+AcdVVvQa0s4TdWCtk+tmNg7rT4S19kltVNTCJ1P/GxoGeGYh5V8lnzDpGeF8RLegKO6XUlKFHaqvCG+UBgFvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219157; c=relaxed/simple;
	bh=219+BGs1UMALEmF9FQsgxxO0c15R/d1CEwwPyrjWbBc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EURRuWUMZx46YU2PioxitYB4uzqIEvHMF0vYueQGrbhnWy43iXlgF1HGAUmVoqeklstfsWbrIiF2W07eyI9tiSa3gFAP/+50M4PCSk9HfrR90bG5lK3ZM5NhOKcxKU3XE4ZSEQsqwWB/iaXg7HGz9JOOCHfAWgwH19zCp863a0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ktL680r+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3ee18913c0so153266666b.3
        for <linux-leds@vger.kernel.org>; Thu, 23 Oct 2025 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219153; x=1761823953; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpNnWkJiOscmYGyhJWmloy2afAm2NS3i4xqcjYsWoMA=;
        b=ktL680r+/bGgwGfs4iM0LEBCWDdZ32JB+LxxFGpNUDTzCbU7BA4QG/Csj7MfCja42d
         wAjctRN9HgOhtWy7bQXL+UnkZG0Y3toczckaJvFJsKBGUOidcftbNpveewu2/5A+oG+3
         cUk/81ju7PXHhANcU3+vxUvg+i/EerIsqF/uOC9M4Vltl5+lNZsd0m45UoFlP8V7FSYg
         DjUlyKnXfDTzxjnimqkMwAjuzTFo+MoGAnIInFHr7AGVWl5o29W1JWTaikRaKMQ6fCBa
         E8mM085LibO3TaxOrPQnyhhR4mQx/W12oDbsUgNr0dLAi/wJAqmpJePoryh7ChC60Buu
         /OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219153; x=1761823953;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpNnWkJiOscmYGyhJWmloy2afAm2NS3i4xqcjYsWoMA=;
        b=R5E4w5tKTyv4id0VZn7JIKHsUPCq47Vm0LF3OZcXKo/irm2Qj6AYmmpl2beHF7Azxb
         rUV3Pc8ODB3yLbz9+b6R0B+UbrzLH7qWOevqrIHdktqd/pYhVDKdkX3d9viSAmsSrdRd
         VqJyZ3ZYX1F9ilvJ+qF/RnKVhcYoLM0ZcTOXLjPwsPQX7QEtKFG/Ob26W7FHfICjpdhO
         O8LsgLERSwiAr2NG6+TnE0J9XwqjmqZPIGNIrFRKtpLjjG7eaeEUvnX/vXCMWV0Cm5Ze
         Mm5gPCrO6KrXbTSFCYArEpcauYLROaplZ7Zx5KrR6VjpBYP47rUdBAvD2uiz3Ad9afJg
         b+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWtZTjWWCr0hQss0OwqbczSq9/S9WQ9wzMdMI1AuDQdS9oNK5Omp0O9h+2J5bdfCgu4qCvWIre5aHtr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/heHvVJ707nt7GpO7im8HlQQ0VLXNYiANf0vlIHkjLf4G+jM
	92S5Iewi69vv6KYrau641zDgAOfj0KLhzF9PLSdJcArGYRh4qjp52sJ2GNwb/dt4qDo=
X-Gm-Gg: ASbGnctVb6r8Itihf03drPxIBf5NSkRCDpwUzCMkgl7WViF07iV3U6UOgTcmzj10ku/
	ZSxGeFFv1u+9QKlHuJCVpAmb3x+uiEoNvEE1P05DnvdOg+hh+3BESMVLOl+Yp7kxKiXbnlufWJy
	ai+bDGtrkXfDEyDPTMmfleJej/m5XArGhFDoR8x64+zQ1CRxK29T0rVDNZTn6o3vvxUFFfmYMVr
	HpLpFjnBLqyU0teUWXf7/whahQbGC5Tbc4d7H3qWciBVWRqcTFQkebCHbKoQ3RbFKyWQbY+gbZC
	KO8mUACUI+ZyICf3cR5FxCAtxMJ303+T94gHS8Rev7VWfevMFGQien7ERl+I05nFaS1kS3KUeKH
	ytlxMSanzQjjAQ0LQ/chPA9j+Zq41ziB33+39AxgenN9G/Z7LL7KV4jlXcTOMtqViB7VDuTfKoG
	JWYXEDtP0ykXFJPSNv6pd7+adc94hMQV0Yc8hg8zg6IcS4jw==
X-Google-Smtp-Source: AGHT+IEl7Syzf5Uc2BCfVDgfWGyxkVxFH1O6RZyXcvt5BTepLqPH++866mvbvp1k50rggkWKyblRuA==
X-Received: by 2002:a17:907:94c9:b0:b6d:5524:5a01 with SMTP id a640c23a62f3a-b6d55246423mr234261766b.31.1761219153462;
        Thu, 23 Oct 2025 04:32:33 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm183087866b.72.2025.10.23.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:32:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Add support for PM7550 PMIC
Date: Thu, 23 Oct 2025 13:32:24 +0200
Message-Id: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgS+mgC/2XPzQ6CMAwH8FchOztTOsfAk+9hPBQosgMfbkgwh
 nd3QIyJHP9t+mv7Fp6dZS/O0Vs4Hq23XRuCOkSiqKm9s7RlyAIBNSQI0jcmUVr2zeQQFUhmrSl
 NKC0wF2Gqd1zZaRWvt5Br64fOvdYFY7xUv5beWWMsQaImyk4KdKXiS0XW9XXX8rHoGrF4I/4MA
 9newGBAZowpKQfK9L8xb0c6fjzDt8N2qcjJswz9xg7nqOVpkMuGGFCFifkDtCF9CScBAAA=
X-Change-ID: 20250620-sm7635-pmxr2230-ee55a86a8c2b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219151; l=1162;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=219+BGs1UMALEmF9FQsgxxO0c15R/d1CEwwPyrjWbBc=;
 b=zH1fNZh/BMIxM2WZik6d13jMLDkIgAarWlV81IJDL95GT5KmmymH99mNmTFVHd/xG9gNYYOxA
 S/NOJRtqIW3C3kWZE3tKqErequGzTZoV6oz/GHqEHB+/qR+6UwUclrz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PM7550 PMIC is used in conjuction with the Milos SoC. Add binding
docs and the devicetree description for it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Resend, drop applied patches
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com

Changes in v2:
- PMXR2230 -> PM7550 (Dmitry)
- Replace some SM7635 references with Milos
- Update critical temperature trip
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com

---
Luca Weiss (3):
      dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
      dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
      arm64: dts: qcom: Add PM7550 PMIC

 .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 arch/arm64/boot/dts/qcom/pm7550.dtsi               | 67 ++++++++++++++++++++++
 3 files changed, 69 insertions(+)
---
base-commit: a92c761bcac3d5042559107fa7679470727a4bcb
change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


