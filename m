Return-Path: <linux-leds+bounces-7144-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAzVESd4q2l+dQEAu9opvQ
	(envelope-from <linux-leds+bounces-7144-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:15 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E69312292EB
	for <lists+linux-leds@lfdr.de>; Sat, 07 Mar 2026 01:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E348430B8255
	for <lists+linux-leds@lfdr.de>; Sat,  7 Mar 2026 00:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435892D9780;
	Sat,  7 Mar 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="deZqPMfD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AA2D4805;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772845084; cv=none; b=UiQXDZ34309pZXqA8HNSE86lSizu1kIkqdydXZqX42xtdlP4TLFfzXaOb72U3unuDsLLH4dCr0o9VCf/gAWzve6bAbcFnjacipytxhSTD8ut+eZqHKkf2dcGmd03+Wm8YAHtD0lHzzMgQfEahoj+7KMN/OsJPKfge9WbmHLNNhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772845084; c=relaxed/simple;
	bh=or4XZZ5BaaZ26whdKPwpMfVhYj6Xn2dkuW06vgzjaiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hmTh+1BymPbbK7HIN8ZDk+CJ6OPYDaQ6csK4touN1TNuNffrvssSwfScI18J7KIaedMxL22XDBiKNcpXLmNszIyxZTDHFHN0dMDGglJgNDAW+Zh5VW26iGikWT80NFrguLde/nEiO2hP9+VXolR8cTixDVHQF2hD5yzdePYuyVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=deZqPMfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CB47C19422;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772845083;
	bh=or4XZZ5BaaZ26whdKPwpMfVhYj6Xn2dkuW06vgzjaiw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=deZqPMfD8pAWgqkpa2zip7iEWwoCxoK+bEyFC1EL8UuSSN9U8FagY03zP6EnVZaXi
	 /FXRn3/M5zsQoSWKQgpyRaeMgQ51ySBwxvsuZak723pRcpIgrBPGHc2cNKxpDPr7/s
	 /GildsbBe9Z85yQHvFLYV6pw4GxIz/vYIZngUiBcKJhu6iGSDZjE/We1uKLhe8MAv5
	 SuzBLS4SQcVQz1yMNK/zDF17okPlZ4bJwLnBaQNP4/q6ZHcaTL8aldixxxfhvT+bZv
	 FjCkijWgk+HqCWotO5+ARwO4v9WiI81OpmoT5zwQG44PZWmRTgkYzkWN52ZzzFbQR/
	 wcH2yUYozzV8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7444BFC9EC7;
	Sat,  7 Mar 2026 00:58:03 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH 0/3] Samsung Expressatt: Camera Flash
Date: Fri, 06 Mar 2026 16:58:01 -0800
Message-Id: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl4q2kC/02NQQqDMBAAvyI5N2JiVJRS+o8isqarhhptkygW8
 e+Neil7mmV3ZiUWjUJLimAlBmdl1Th4YJeAyA6GFql6eiY84mkURynF5W3QWnCukqDRQNX0YDv
 KYskSyATPAIj/9leNWg7zozzZ4GfyAXcuid41R6AIrt6fMB4lf37qxkl2L/zSmVE/Qog655nMm
 /jealB9KEd921s1WKQetHJFMKchy0m5bT/s4M1M3AAAAA==
X-Change-ID: 20260306-expressatt_camera_flash-13c15a7427aa
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772845083; l=1311;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=or4XZZ5BaaZ26whdKPwpMfVhYj6Xn2dkuW06vgzjaiw=;
 b=9vvyscRB7gjVDF3LEsn8bB/LM/q+hZwz/y6Ktb8WeIIWmtzEykVv4R+Jq/IZW5N2qOCVpdYWB
 dhBNVHv2YcgAF//hhdoSXolgJ1k+FP0CxN+AUOzgZLEo7uVeL+HdGc2
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Rspamd-Queue-Id: E69312292EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7144-lists,linux-leds=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This small series adds camera flash to an existing similar mainline
driver and adds it the the Samsung Expressatt's DTS

Downstream reference:
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Rudraksha Gupta (3):
      dt-bindings: leds: rt8515: Support single-GPIO flash ICs with unlock gate
      leds: flash: rt8515: Support single-GPIO flash ICs with unlock gate
      ARM: dts: qcom: msm8960: expressatt: Add camera flash

 .../devicetree/bindings/leds/richtek,rt8515.yaml   | 36 +++++++++++++++++++-
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 31 ++++++++++++++++++
 drivers/leds/flash/leds-rt8515.c                   | 38 ++++++++++++++++++----
 3 files changed, 98 insertions(+), 7 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260306-expressatt_camera_flash-13c15a7427aa
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



