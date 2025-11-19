Return-Path: <linux-leds+bounces-6201-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E7C6CDBD
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 07:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED26D34F235
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 06:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5F0313549;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FcPbQHiA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23A28C2DD;
	Wed, 19 Nov 2025 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532407; cv=none; b=GhAOdTr+DC0/I0ypkRjpXVLq8rQeLV2Sj9EIBtmTc+SyIbthtoBzt4C03WQP7nHBBeStuMURrP/wJa0UHKCkkEpYuJtTad+o5c1L8g84olH6Y0hRwSe4V/zp/eDUFgexQNkVIdyDyQUNc88zD6lmdLhlOTBLjhTy9lstoQzTD5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532407; c=relaxed/simple;
	bh=ZEK+wJs21KjpieXILjX9OQNrW4hvNI90ksPgQCgH+Os=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IjGWakSpyX1PdeR7T5Q60eDhPYAT7uT/0OKKGzf7dmFFu1PwvYiywhr2oLu8yLHF9rbyI1yDZklOu9BxgrIZ96eIl/uVJ6jWUXiOhifXRrqAsZ+dOE3nb8YRMm65fD7uS2KN5UdM3SiUrP8Q9vWkwqhVhluOActSzMT9ZG00XNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FcPbQHiA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8A1EC4CEF5;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763532406;
	bh=ZEK+wJs21KjpieXILjX9OQNrW4hvNI90ksPgQCgH+Os=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FcPbQHiABXOq3CDDGFhj47OdzgOnpvdTyUNEoNvQQhTgDekgorMRzQEHgBKC+NIWC
	 eG9Ik4EEDUUx1Si/HoFHa+nuyIVPaZGsp7UmEF4ONjyF5Hsxn6iCWxtZF0sEW2tBOU
	 pWTYHrxvt3brHf81OsoR3SXMJq7JvO0pjRUglUL4klUgJB6iyrR7UU/jwJuz5VoOeH
	 eauAQpSgrRU7iZ/vy/eNxo4BHhLccQ7gjxCh/XB14dx6GrsUuZGbkwqwkTByB8tbKZ
	 4C5+VSCP5I+kCaoFCoclIgW/WnloicO3vuZfJflcBuZYJmgpGr0NiR0wGpQDSnDWwO
	 yRYiE2WSUeNKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555A7CF2583;
	Wed, 19 Nov 2025 06:06:45 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+fenglin.wu.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/2] leds: rgb: lpg: Don't enable TRILED when
 configuring PWM
Date: Wed, 19 Nov 2025 14:06:41 +0800
Message-Id: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFeHWkC/3XM0QqCMBTG8VeJXTfx7MxwXfUeEaJz6kCdbTYK8
 d07ehVUNwf+H5zfwoLx1gR2PizMm2iDdSMFHg9Md+XYGm5raiZSkQGA5P3UFrO3vamLxj65lFJ
 BJVWFMmX0NHlD8w5eb9SdDbPzr92PsK1/qQgcuKoEqhyFzlBfXAjJ/VH22g1DQodtYhSfSv6lC
 FJONZgsR0DE5oeyrusbpI8rSfkAAAA=
X-Change-ID: 20251114-lpg_triled_fix-44491b49b340
To: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763532404; l=1449;
 i=fenglin.wu@oss.qualcomm.com; s=20240327; h=from:subject:message-id;
 bh=ZEK+wJs21KjpieXILjX9OQNrW4hvNI90ksPgQCgH+Os=;
 b=KSR6kKZ3j50ymX3dSQIla49xrLoVfc93fppvTUnwiShO5j/tMcix8DTvKFAIql9ViOFaDoPhs
 2mtfgsXh5XbAj/2xFRjrL9eIFfzu/0unuUJ6fLuIqjjZdGWroZeTWzh
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=BF8SA4IVDk8/EBCwlBehKtn2hp6kipuuAuDAHh9s+K4=
X-Endpoint-Received: by B4 Relay for fenglin.wu@oss.qualcomm.com/20240327
 with auth_id=406
X-Original-From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Reply-To: fenglin.wu@oss.qualcomm.com

The LPG channel can be used for only outputting PWM signal without the
need to enable TRILED. Update the DT binding document to explain that
usage and remove the TRILED enabling register write in the driver for
that use case.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v3:
- Add a DT binding change to clarify the standalone PWM usage according
  to the suggestion from Bjorn.
- Link to v2: https://lore.kernel.org/r/20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com

Changes in v2:
- Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
  indicates the channel is being used as a LED and this PWM API would
  never get called. Instead, remove the code line which enables TRILED
  in lpg_pwm_apply() and update the commit text to explain it clearly.

- Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: leds: qcom-lpg: Explain standalone PWM usage
      leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 5 +++++
 drivers/leds/rgb/leds-qcom-lpg.c                          | 4 +---
 2 files changed, 6 insertions(+), 3 deletions(-)
---
base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
change-id: 20251114-lpg_triled_fix-44491b49b340

Best regards,
-- 
Fenglin Wu <fenglin.wu@oss.qualcomm.com>



