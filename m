Return-Path: <linux-leds+bounces-7883-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHxrO47G8GkqYgEAu9opvQ
	(envelope-from <linux-leds+bounces-7883-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:39:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC41487282
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 16:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21EAB31F93C6
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 13:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27A3438FF3;
	Tue, 28 Apr 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KhkbB3lT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52D10F1
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384758; cv=none; b=QZvAnndAO9rUi3Yc78oVSGTn7Gh6auNjWGf9HVSdAryrU+V8/zuY1yMxc/LIKAzgKi/qb0S3jOFPbPf3+YCr9TlhNJzFpS8kkCP06OVFpxMPmqFedwWNBQsMSZ9fyynMJ38t9nbAIdaw8kk3LhCmpDdqJZ/n9w7Hep/C2nTEpgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384758; c=relaxed/simple;
	bh=fStomxOM1crQBf2dh5jW011uYO0a7/MEjHDN74nHXvk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NFufEGhYkaLdE4icRfFwN7pKfQRjM3qrPs8zpE+0aTalWkj5HqNrrHOavzU6h6AQroDd/aq2lGIKrl44Yc7q7xxjfq8iiphhaSWExqZWdToCHKwrQHY+etqnumcWxOuwh8qZnwUxkpySEds4m8GR8TUHT08rAC1g7BYu+RD+1N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KhkbB3lT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48909558b3aso114973105e9.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 06:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777384754; x=1777989554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=udhA8FYIygeULMf2spSguXELNb0LFsPfqpfV0jbfFB0=;
        b=KhkbB3lTU6Uv5nLMt102SpEg0R+VLKCUDz5wDRE3UyKYEFodShHJO3H5TLqFEpSdx5
         WeLAL5t3mesZj0OTsf4lUrZkXRNw/9pndj9WK5zKTww3/19k7WNan07iwteZscrKCsJm
         x+ztriazgLny25x/CLPqVJTXrkH/KTbWYGU78my7zKMpRlvoQUeSffgDMe+wCR9Nje/f
         bNTJwwuyLAm8PHB4Nn3Enq5fUMNSDZFfxXEliLsPYp9n1qS8T2qJMPAuiuGGzYcZK5KC
         ByYddzpjPt3QDiG7mhWOQ5Ut2i9mppNvSptGPD5waS4twvtaAHwfQ3b7UBcUIf8qkZvp
         hM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384754; x=1777989554;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udhA8FYIygeULMf2spSguXELNb0LFsPfqpfV0jbfFB0=;
        b=Af2o+NK3g5aJJUdkuI9MIb7Tj2el6OEKRAFXlPXrm4sjGafXEOVBOkkmAjDX6A3ERX
         F9k3ucLD/1s+hysJKQTB06xh/FtSdxUCKvoJgU1HE6SmH8UZ6fYSaVV5mOT+QuYXbnZ3
         /GO4cIrDtg4zMdyDGpJj9fHC4uMgIJPmB31tfMkKbfaq88dMbKkYWl/I5BOWuyRg0zEA
         Jb1b54x5hvWeWAe9px67PkvHtmHCPdNqXWKwFzux8kFluDCyNEpsCR3Yssdj6Cow05Ok
         M50UrjhkdtB7160FBteCzfc2NnpaG+UQq4M9fFWxRXP8mrwdbSupKnApmoKaHag3FEvC
         l1XA==
X-Forwarded-Encrypted: i=1; AFNElJ8dG9/9qP8eqFLvoIv3cq+xUxMkOf5tlb6bblamF1ZpUHgK3oJZh85VyY/GI7VSX3egjsZUkc9+TIPW@vger.kernel.org
X-Gm-Message-State: AOJu0YyOLzTb+NH5SPx8q80X/bhFM4jWFoKWIsdmliWwIMt4qMoBHk9D
	WsbmeQo17qBTRxMQhlKIYHtthPy54MgZPLccAv6lXvtYTg3XnBGGtI8X94So292NEm4=
X-Gm-Gg: AeBDietndu8FRTDPJIQC7TDy/O9aLK28JCkcYOCyV76UplCfNybp9D4XYJ7YgyXSLjS
	0wMO/jVRXoKGUu5nHWEE09dyBHYB/Le3aOy8I4KuJeDiAy/N4hsDv+hAdLhQFrCdoS39tl7kkJP
	plAmOTALwpg/6XsiGGLtjGeTpK95R9iTDeLah0cx3QZejWvnhpE2Oqsl8YkkeFO9XgIwpuZO2yv
	fsCd02CtULGCnDx+L/+m3M8f7nwh7nD5vz8PSJTrgPNnamaFt+5jb5KEv+s9yITtjjDlyz6fwNX
	f1xJx3L5a+ARLBXdPuSEJcZ39Z2TW0MSddWO+m+woSx6k/yiZP/N03cXUeD4/5eJg6CfNIA9T1B
	vnJvLJK5FeZbs8tnh70roGgSLkkEHnT4IdsjCDArr6Ycgt1rudROOloFlgFSVEdF816EeTDuJyI
	MNUjXetd2+6lseFL9zpoZyBDnk87bBpCSlAbJeJ4IjsVaZhApJX0y52FU8Jxzf5tViRQ==
X-Received: by 2002:a05:600c:8b2f:b0:485:3b9e:caa7 with SMTP id 5b1f17b1804b1-48a77b19d6fmr55500725e9.23.1777384754118;
        Tue, 28 Apr 2026 06:59:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773efe04sm60811155e9.12.2026.04.28.06.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:59:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Tue, 28 Apr 2026 15:59:10 +0200
Message-Id: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC698GkC/yXNQQ7CIBBA0as0s3YSQCnEqxgXiFMdjUAYNDZN7
 y7q8m3+X0CoMgnshwUqvVg4pw69GSBeQ7oQ8rkbjDKj2hmPLReOKA8/WoVhDokylhzv1FAMyuy
 c9bhVXhO5SZOx0FOl0sTv3+Zw/FuepxvF9m3Dun4AbzFq8IgAAAA=
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fStomxOM1crQBf2dh5jW011uYO0a7/MEjHDN74nHXvk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8L0vzGcnPNa1ZX01cDX2xFb+HU61fFeMMwl6DH2F
 niCN/+KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafC9LwAKCRB33NvayMhJ0S/1D/
 9IGhCG7NAXzhBOSkBWur+HPJ04e478uoCh3E5AtZa7bb7QZDxv2o5d6Ior4uxN4kmXwBkRB2xvOB9e
 ty9eMPNe2OUD5P8ldWalWQxt0ez1fe2MF5woGGODSG+CVmnx8TIjsU0QZHrIqZPyECCoeLgCewIZ1f
 ASbx1dFC6OBW3GD5O+Pt84j+a7NzC35fJX4AFr0LQPS1PBez1rnOtsiXbhuKQw5f7TvBf5ANjTSTuH
 R0h6a/Ob7RAAcnzg+BXizPUmGTSyFaSgyhGIl3kznUYZae5HwmxLRao4J8z+RoYUhIQOqB+GEvMWkK
 n/O5r5zqzfQkMqU2X9iHzADB1XGGAQon4RSO/znZjDtvMlNVN46/dJPnFSnKMlCL1jjPgnSkfsg1CJ
 SvxfH4G9LjLAu5myBS1wh9JNvzoYzveq4CReN9UqJLYLYEE507y/UCbhMD/8RmzqazWyvp8nm+3ahs
 gYhiO9UuVSMMJCXdhjIpS1NuLPUPDNdddaZOhOAXtXcBQD3kHDOSogHFBI15hLemEGX/GxOy/J2QvP
 CQIO2cC53n/Uf48FWz4leqpsmQE4z/0NuHyTXfV/SgAVyfOhKvn9TyB6oKAmSDajmDBprAwUye4Tbk
 9rvsoSN7ThYC75Xt2qIu2z5c5UmLJrkwqmRxH+fOVC0w/6fgmWKGP3qH/GWg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 6DC41487282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7883-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: regulator: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  53 ++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 311 +++++++++++++++++++++
 4 files changed, 373 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


