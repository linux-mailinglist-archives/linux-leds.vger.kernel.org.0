Return-Path: <linux-leds+bounces-7963-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dw/NprB92mXlwIAu9opvQ
	(envelope-from <linux-leds+bounces-7963-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0724B7904
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 23:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64B62301CCF3
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 21:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E523AB272;
	Sun,  3 May 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmTljv5Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D97E3AA4F9;
	Sun,  3 May 2026 21:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777844597; cv=none; b=irvNyqFV2hb5P32ycaGbW23LmLDmv07krQM96o9nj1LvF7vcFfFlgqFiUSKXTEg5SzYNwyKjiEEWCM26C6VPpdFgoo4Q+YSxAiLiaPKeCc7fLibbo3J6j1VpRB0sUyrsCSUot6dSAWo2NDeFWkCI0sXAXj60r2LOu0xhDv7WAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777844597; c=relaxed/simple;
	bh=iDvvmgMnzPPa9SOCDBpACDK2Hc5WSuZ2cl8tKe58wy8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kr8zFKcCwRNd8ZqJ/rU7lHBX85WB5iPBr0x+PYMD7n3KuYtdK4a14Ge5tf8UyzpkYDTVnme63CSm9t7/Im9kkCUy3yr3aj7wpPKSzn7TsHoUM93akykNg85vMw1loIfbVgVksmTeScr2AoSi6OggTNPg1/BpDXVkE5avKVhAHFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmTljv5Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B167C2BCFB;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777844597;
	bh=iDvvmgMnzPPa9SOCDBpACDK2Hc5WSuZ2cl8tKe58wy8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tmTljv5YUpM1Y2UulX9L1wM0Kx79WScoB4ycXBZMkmX2spBS6jTLpDHTruswqFzZk
	 0We2Qa8gVsqXFu+Z8q4369rzlJ40c7OpAkBl7gUNb6XcK4cmQMU1qmtU1aZ1Q0Yknp
	 MqAcge9zSqLhiffUjEB201y4riAMHkBxsEOi+/jG0hMB0P5TM4qQZuIP/Rux3hk+9q
	 KholqkxeJlhsh0dL3LAyeAkM5NzMG1jtbLn5YND7SqbkWmKKkTOTD/J7lsbLhWyRsc
	 /Kz8fDZaEs686vYGY5Xeoaa2ILEQ2LIgvb9T6d8Dmmzf3ggdJ3jIpe4IPDJCpy1m5D
	 lBvbe4p/1NQ8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DC2FF886F;
	Sun,  3 May 2026 21:43:16 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v5 0/3] Samsung Expressatt: Camera Flash
Date: Sun, 03 May 2026 14:43:14 -0700
Message-Id: <20260503-expressatt_camera_flash-v5-0-95524506a799@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XP3WrDIBTA8VcJXs/iR4w1jLH3GKMYPTayptnUh
 paSd5+1N1LodnlEf3/PFUUIHiLqmysKsPjo52MexEuDzKiPe8De5hkxwjrCSYfh/B0gRp3Szug
 Jgt65g44jptxQoWXLpNYov863nD8X+ePzPgf4OeVAuh+i6caUQN+8Fl8QXvk4zSczfsEFLxRT7
 KS1wg5dC8S+7yftDxszT2+31qAj4DxMPvXNIjcE3Yqjj2kOl7LaQkvy3y1yieCBKtU5aayzVam
 YC6scun3usOwIwwalO8atGR4dXjnsj//w7IAUIKzYKkXco9NWDqfPnTY7joJSrpWtoLx21nX9B
 crZcLgIAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777844595; l=4663;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=iDvvmgMnzPPa9SOCDBpACDK2Hc5WSuZ2cl8tKe58wy8=;
 b=QkyVbXwKR5OjOF3vJrisabWX1C29thoLfVHFC27V1PS38+0g9Sv83mDWfuZ1Iq394PvEjIH1C
 XSLJ4f2t1t4DpHZIRWFkQyTdv2TjFzmuoPWbkTZ8rzG9p6HjKkVg/CM
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: 5C0724B7904
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7963-lists,linux-leds=lfdr.de,guptarud.gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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

// # Multiple strobes shouldn't cause errors
echo 200000 > flash_timeout
echo 1 > flash_strobe
echo 1 > flash_strobe
sleep 1
cat flash_strobe
dmesg | tail -20

// # Multiple strobes shouldn't cause errors (extreme test)
for i in $(seq 1 500); do echo 1 > flash_strobe; echo 0 > flash_strobe; done
dmesg | tail -20

// # Test minimal timeout (turns on briefly)
echo 1 > flash_timeout
echo 1 > flash_strobe
sleep 0.1
cat flash_strobe
dmesg | tail -20

// # Flash strobe overrides brightness and flashes at full brightness
echo 200000 > flash_timeout
echo 1 > brightness
echo 1 > flash_strobe
sleep 1
cat flash_strobe
cat brightness
dmesg | tail -20

Downstream reference:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v5:
- Address Lee Jones's comments:
    - formatting
    - use devm_regulator_get_optional()
    - use a workqueue instead of a timer
    - previously we were validating ent-gpios xor vin-supply at probe,
        but was removed. update the commit msg to reflect this
- Link to v4: https://lore.kernel.org/r/20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com

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

 .../devicetree/bindings/leds/richtek,rt8515.yaml   |  34 +++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  43 +++++++
 drivers/leds/flash/leds-rt8515.c                   | 130 +++++++++++++++++----
 3 files changed, 181 insertions(+), 26 deletions(-)
---
base-commit: 3131ff5a117498bb4b9db3a238bb311cbf8383ce
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20260503-expressatt-touchkey-v1-1-f7dd5db64e0d@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



