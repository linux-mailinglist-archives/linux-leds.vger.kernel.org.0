Return-Path: <linux-leds+bounces-7509-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEKLLJ7nxGkz5AQAu9opvQ
	(envelope-from <linux-leds+bounces-7509-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:00:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 621FB330C6E
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9244301D6AC
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B473B4EBD;
	Thu, 26 Mar 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7SHwOxr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACED3B38AE;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511853; cv=none; b=R9Xs8N9ls8+9I8fYhlA9LA9ajwMjiaBve2EEMUraNly5HATZjSUviUdvFUzhDbinDYB0d0IL5w9fZhshWNVZf0WxhKH1uvgSn1/hbcHB91C++rTSn/LvXF05OqXcx11SKqecDPyLdKBsH+3HxuWOu4cmkLUlIb24GUqqkw8Jiw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511853; c=relaxed/simple;
	bh=RlIM0MUSwd5wz+8XPIpqDDZrKwpihhE+hECNmip7gPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dt5SpCQnlJfj7gy6Mbc0kwv4lBVote4LX6Ih9I8jk69/Hz6nMw73JE48nQ60PrFUUDs4cMlG7YFhbR6L68kGMkxovqDPxPo4oP7l/RhB1sO2ouRap/AnKcwZ0zRoLC9gmcAF2by2P/TfZYdL6MBXuyYIXvmhAmoo8fGVYZ1A8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7SHwOxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF323C116C6;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774511852;
	bh=RlIM0MUSwd5wz+8XPIpqDDZrKwpihhE+hECNmip7gPI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P7SHwOxrRy2qbwV51TFmQT47oevjRaSaRZ38/VBFqLvc7EPEo9xyJG1Uzv2oPKxCD
	 EvWHN4w+D1AzpZwmVUlnmqBmrfjgcaCYibN51ut/VKN8pkMaZtB8h27ftrbExy57Q0
	 YorJF3eI3cznHWKdRco6+7f+nKQyLJvFY/vBLhiB6iLtf8Z3/njf+jZnM0kkJIYAN1
	 zVwBDRKDPmUkernKsiKGukyXbN/5nSZ45eWxUeH1U/WiL/vNFxW22h6enGxS9QR/1w
	 0MxSW1hr9yA2HvXcoyxJGYDDhrvURQMqR6sGlCW++S3R+7GhOT3gdJb6H2ZKOwq8c9
	 4ZjKInI6rJFUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFCA106F2E9;
	Thu, 26 Mar 2026 07:57:32 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] Samsung Expressatt: Camera Flash
Date: Thu, 26 Mar 2026 00:57:30 -0700
Message-Id: <20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOrmxGkC/4WPy2rDMBBFf8VoXQU9bLkypeQ/Sgmjh2PRKG4kR
 SQE/3tlZVFvSpnVHWbO4T5QtMHZiIbmgYLNLrr5XAJ/aZCe4Hy02JmSESNMEE4EtrfvYGOElA4
 avA1wGE8QJ0y5ph30LesBUPkuV6O7VfLH5zMHe7kWQXoukV8xVTA0b4XfUUa6DR+n+aqnL3vHm
 eIybdsqyXotR74/enCnnZ79++pSEC0uwbs0NFnsqESrcnIxzeFeu2Vanf/WKCqCFZVSjL02ozG
 /qsrMbMOhr39zWOF0mikJgnGj1ZazLMsPaB6EDXkBAAA=
X-Change-ID: 20260306-expressatt_camera_flash-13c15a7427aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774511852; l=3372;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=RlIM0MUSwd5wz+8XPIpqDDZrKwpihhE+hECNmip7gPI=;
 b=zbdwGQMdwTftPx42S7rTi4MPfe2+CYew1vD4HdwzXJiO6y16XrYpftcKvYRpJEiv2dkXaxRO/
 rmGccPAbWtyBFvtr0rcTlEfdCkM1b1pNLzUAfaFIqGyJmtq2wNaznid
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7509-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com,ixit.cz];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[20251205-expressatt-touchkey-v1-1-1444b927c9f3.gmail.com:query timed out];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 621FB330C6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This small series adds camera flash to an existing similar mainline
driver and adds it to the Samsung Expressatt's DTS

// Tests

// # Navigate to LED
sudo su
cd /sys/class/leds/white:flash

// # Should stay at dim brightness
echo 1 > brightness
echo 1 > brightness
echo 1 > brightness
echo 1 > brightness
echo 0 > brightness           # LED_OFF

// # Max Brightness
echo 50 > brightness
echo 0 > brightness           # LED_OFF
echo 99 > brightness
echo 0 > brightness           # LED_OFF
echo 1000 > brightness
echo 0 > brightness           # LED_OFF
echo 100 > brightness
echo 0 > brightness           # LED_OFF

// # Should increase in brightness
for i in $(seq 1 16); do echo $i > brightness; sleep 1; done
echo 0 > brightness           # LED_OFF

// # Test flash strobe (rt8515_led_flash_strobe_set)
cat max_flash_timeout          # check max
echo 200000 > flash_timeout    # 200ms
echo 1 > flash_strobe          # strobe ON → brightness_commit + timer
cat flash_strobe               # should read 1, then 0 after timeout
sleep 1
cat flash_strobe               # should be 0 (timer fired)

// # Test manual strobe cancel
echo 1 > flash_strobe ; echo 0 > flash_strobe          # immediate off

// # Check regulator error handling
dmesg | tail -20                     # look for any "failed to turn off LED" msgs

Downstream reference:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v3:
- DTS:
    - Renamed and reordered nodes
- Driver:
    - Use regulator_is_enabled() instead of reg_enabled
    - remove ent xor vin check
    - remove rt->reg == -ENODEV check
    - rename functions to reflect what they do and added ret's
    - Fixed: LED was increasing in brightness when setting the same
        brightness multiple times
- Link to v2: https://lore.kernel.org/r/20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com

Changes in v2:
- dt-bindings: Explain the hardware and not the driver
- **/*: Use vin-supply instead of unlock-gpio
- expressatt DTS: Reorder pinctrl-*
- expressatt DTS: Define rfs-ohms to a default (couldn't find
                  information about this)
- Link to v1: https://lore.kernel.org/r/20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com

---
Rudraksha Gupta (3):
      dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
      leds: flash: rt8515: Support single-GPIO flash ICs with vin supply
      ARM: dts: qcom: msm8960: expressatt: Add camera flash

 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 34 +++++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 +++++++++++
 drivers/leds/flash/leds-rt8515.c                   | 90 +++++++++++++++++-----
 3 files changed, 148 insertions(+), 19 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



