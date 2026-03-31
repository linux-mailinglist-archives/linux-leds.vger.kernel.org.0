Return-Path: <linux-leds+bounces-7603-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NcfEw4BzGk8NQYAu9opvQ
	(envelope-from <linux-leds+bounces-7603-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:14:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A036E4A1
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 19:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2397B3047799
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 17:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC08130CD85;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftNRDXmu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441F30B51A;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976888; cv=none; b=fAcIYuV0rQGOKT3RML5kH8YhXJnfsN+a1JAC4lCg+eib79fs765A3rCC3JLf9HEnl2NpQxH4wHBgDwF6ajcpRJSvXJTkvEVseFEKIoFdb99GzFCqnSwURFBkccZwdDU8T8JxmjxAcmzgeLaRA9P86n9Gr6bphGBhfhbX2A4OGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976888; c=relaxed/simple;
	bh=eovgu9/5VMVlWeAGw2mROps+DUXxHVGt0CgYPeCVbNI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L/yuO44RNEkO4ZWBaF8dEwIX+TuRySw/su3un2kexw1tV3thScc2Cu21h23rPfbTo2fxJBHS20hgzzNjoII6zgSRxiUg9rof2zHSQ2twK2B7UnhzuEMbokJGCBe6Bo4QfqAMwWqs6Ooh1P3mLVW2063+3ET3T/+DGnk/HZeD2iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftNRDXmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 965EAC2BCB1;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774976888;
	bh=eovgu9/5VMVlWeAGw2mROps+DUXxHVGt0CgYPeCVbNI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ftNRDXmumEA2NGZ6gWS65BDC0L+EtL9sm6M1215Va6Afw73AAsGqoNKiA2QuCAzW9
	 C+qrvtrzJg5ATduGU/DG1HsupFb41/yqZp27+h/eaA3LDQkFTUU0P/d0ujGpQQHbAr
	 Qpu2J0xBhEGFeQ6lYb9XVaJAuU+TnCh4GbXZwPxWQulCeHptxAmJ97fP8P5pHcc+6d
	 O0or7CpQgSfZKIPQYBzyPpnSOb7CcaIL8ZWIwifm27ZU+qN3R2GkZgnR8kH/wewCA0
	 rwcTcX1mOh/c1N83iuTKrVCLQijg8e7/Xi2LNT8FzKl5h/3JU6gd23Qp9vVIhxButM
	 G6UnIAlIhy9UQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8344FFF60F4;
	Tue, 31 Mar 2026 17:08:08 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] Samsung Expressatt: Camera Flash
Date: Tue, 31 Mar 2026 10:08:06 -0700
Message-Id: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHb/y2kC/4XP32rDIBQG8FcJXs/in5jUMMreY4xyosdG2jSr2
 tBS8u4z6cXCYBtefaK/75wHiRg8RtIUDxJw9NEP5xzKl4KYDs4HpN7mTAQTFZOsonj7DBgjpLQ
 30GOAvTtB7CiXhiuoS1EDkPw7v3L+tsjvH88c8HLNBel5SfqZWQqa4jX7igumVj5Nw9V0R7zTk
 dN8yrJstaiNdvLt0IM/bczQ7+auFiLSHHqfmmKsNlyTubLzMQ3hvuw28qXz3zVyFaMt17pytbH
 O2u+qxRzFyuHb3x2RHWVEq6ES0pr2pyNXjvhjHpkdrBUqq7ZaM7d2pmn6AjVA5LvBAQAA
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
 Conor Dooley <conor.dooley@microchip.com>, David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774976888; l=3600;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=eovgu9/5VMVlWeAGw2mROps+DUXxHVGt0CgYPeCVbNI=;
 b=PfAVPFlgzQvV98IEsCGq4UyKLuFbWz/BZs+32G4WXyQAjZfZugmsWn7UFzoDYdr70d3IabH1n
 BpDBpo0Y1+PCV+ZIEIn3mwqKXJWIjUp3C1FLy0jb0qswEI1fup3GnWX
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7603-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.949];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C6A036E4A1
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
Changes in v4:
- Driver:
    - revert function renames
    - add comment to use flash instead if torch pin not available
- Link to v3: https://lore.kernel.org/r/20260326-expressatt_camera_flash-v3-0-e75e5d58990f@gmail.com

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

 .../devicetree/bindings/leds/richtek,rt8515.yaml   |  34 ++++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  43 +++++++++
 drivers/leds/flash/leds-rt8515.c                   | 100 +++++++++++++++++----
 3 files changed, 159 insertions(+), 18 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



