Return-Path: <linux-leds+bounces-7384-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BtuN6v1ummVdQIAu9opvQ
	(envelope-from <linux-leds+bounces-7384-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:57:47 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A62C1B19
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 19:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8000304D9AD
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 18:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C2A3E4C76;
	Wed, 18 Mar 2026 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXoo6t48"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124323E2762;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773858881; cv=none; b=nz3ixfUA+EeO27AxlFrmrR+jLXJKlTBYeD+7nURv0difVo3hhNON4zp2S2WE9YHONHBq8HLwEZfAqsT/1jS2RmkeOBVlLzBLsDnZ037H8CY9Lf0fRrUD9nyUHGqDGEaruTfYuytXsu939TW/bR/hK8SZ6bBimltSfSr3xwE44Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773858881; c=relaxed/simple;
	bh=x3uy/XVTTVpT34PL1AIrqtdEtkXWeZVq3ulfI+0NZ8A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YWe3MSqexUA3zO22gw3xyT8y7rmW6Qo9tl6R6mH4/6uSM9O5MI7rzMMefWEki/CTpVVevPm29oadk/u7itAo7AsUWgjlQROny/1VNXDTo0VM0BU5kfeU4UcgVAkakO+JB8iPi9lJHQxBHhBIqc3gjR6pMYILzJPJN6HSo19HEtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXoo6t48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADD2BC2BC9E;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773858880;
	bh=x3uy/XVTTVpT34PL1AIrqtdEtkXWeZVq3ulfI+0NZ8A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RXoo6t48f0C75HZnMXcdBanh9sU3gk+9Fyd63nN9tAW1aSZJxUQMfSPGesAzE5H9D
	 Rsv5nBdPFmB/nhYNrWNVFaoBuCX5gmt4GDLizfX83NLMWtWWFSmhE2aBlZHgd8IWH6
	 WbyJo5bwT4/vCZPhVROXgxYWGI5848gPOHCtE1xXue4Ik8kMxwsM+KceainTPEbYtL
	 1aUWg3vWbtdVJRiSbe/o905QgLfHAYoiXGM0h0MHPG9EqzxggGokxfbvAjzv3BzwnZ
	 2sr1zTBtxgIUxeI6cPEpRgcmTch1rt+jzY/KrQZZzvu4HdD2rm2+YXNrGny6reInaa
	 l5lipdQWL/IDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3E01077604;
	Wed, 18 Mar 2026 18:34:40 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Samsung Expressatt: Camera Flash
Date: Wed, 18 Mar 2026 11:34:38 -0700
Message-Id: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7wumkC/4WP3WrDMAxGXyXoei6284fDGH2PUoriyI1Z3Wy2G
 1pK3n1KerHdDV0dIX2H7wmJoqcEXfGESLNPfroy6LcC7IjXMwk/MIOWupGlbATdvyKlhDmfLAa
 KeHIXTKNQpVU1tpVuEYG/+cr5+5Z8OL440veNBfm1hLDGbIKueOf8WmlZ/8kXebrZ8ZMeYlaCp
 6qq3ujWGlfuzwH9ZWen8LG6ekwkGILPXTE3O2VgVY4+5Sk+tm6z2pz/1mCVFL0ypnGtHdww/Kr
 guCzLD5MPNYQxAQAA
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773858880; l=1698;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=x3uy/XVTTVpT34PL1AIrqtdEtkXWeZVq3ulfI+0NZ8A=;
 b=QvHgY2nmD9UpmbOnF8ObSGoxhgUjgf5v/0kQd55EVTgeJq8lozWe7pBmpUdomdOqb32TAR1HG
 /PzAtPxvM+bCXaGiKdY0cHR7goegmv+dITjwBJ8kTduQVEB+/ppING+
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7384-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ixit.cz];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 134A62C1B19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This small series adds camera flash to an existing similar mainline
driver and adds it the the Samsung Expressatt's DTS

Assisted by AI (Claude).

Downstream reference:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
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

 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 34 +++++++++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 +++++++++++++++
 drivers/leds/flash/leds-rt8515.c                   | 64 +++++++++++++++++++---
 3 files changed, 132 insertions(+), 9 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



