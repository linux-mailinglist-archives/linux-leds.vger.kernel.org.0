Return-Path: <linux-leds+bounces-8381-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLgHM+roGWpazwgAu9opvQ
	(envelope-from <linux-leds+bounces-8381-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:28:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB0607D5E
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 21:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF85F30B4545
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 19:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D591372EF7;
	Fri, 29 May 2026 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B0zVxuQV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12539B486
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082594; cv=none; b=NFUiBWUR/ieJzbm+ZT/s3BISV9ROYTnouNLFfvw+MaOde0KhJsrKdwsRtxPefOzH7wIiF0Y2UGsBLB8FGG2phexOC8/dIqj2cORfN1RC8qgB05/PwU//qXRsEs1+J7b0EsmLLcUROHubv1rQbUnmgDEfqhhPwC7F45MOh3r6qwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082594; c=relaxed/simple;
	bh=hyz4a9KfkQdq6GF9UiDXxz4gzafyVLqjGocQwFon4KY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O5Y4t/tBwASH3s7LhzFdB21JSH44gBVGWNjHulmkhVcSeLq1DFgMG4IbYNmMipkLKAN80eKnk0Ciclu9Lc+XzWx9t1c3tyHI5az1oapa4xGC1NRTJ0TNk9Gli0u0jbQiKtK1DeErKgFRTHmp1KU88bakTwj0yxr91XyjJz1i8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B0zVxuQV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4909def6a21so4948425e9.3
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 12:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780082592; x=1780687392; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndz1hoCdDpCMZ0CBl4eGMfc4kRE7BfbvXniyLhRZSE4=;
        b=B0zVxuQVlDJvt7ACcjEg57tiAkrD2iExtrSosNnyIAb4hsQTstKoXD/92xpvsfhqmB
         LFFUQ/5Q1ZYmVZVvSwxGEQiIAY2JwVKh8eTodKAoE0jilHX8By963GUNRq6bMs5GENxm
         zdbPG8k3nrlSXqm6ga3VbBw+EHoDUnBGX/6Q4MiETx8aNqLKaOiygFnq3OiuTJFTcF40
         AjyrXXgAgULnvlNTbeZbl9ZaCQxw/rsWsgM6tGrMbVRrUl/mbfISunZmMJypPI9JhBrb
         D05jlMYl6DvvJAt3u8QVllVKcS68ImHj18OEoqCuOOeHSFcAs/ooGAn9XuVfKbgCBEAT
         eV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082592; x=1780687392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndz1hoCdDpCMZ0CBl4eGMfc4kRE7BfbvXniyLhRZSE4=;
        b=ER/ED8JopYhN379LlL+13sHU9GRb4D2teAmL1sSbIdmMMXoC2wx/tMF49FXbUd2moM
         wrP7wpwak7A9NNKP4fcmAT0hJsR6j5AA1LDTt+kCDBkuNv164TbmNRwyM4oZgrqS/KAT
         qNRLs/HFjQNFDyWUcEIm3RfTPIHYfVc03Hwei+uyzzM7utgAncCJehUcihNxsUpHu6ar
         WOTOjUxhUNhu7U8GL3DExddPCdTbzhmSJGmFke7H/cYTntR7EaaYFwyqmydJ9F1BBQJs
         3iNMs34nRzYcahY10t7HTHyMsiSPiGD/BeflXk+2mmVTu7ElsTpaVwtbLcTgtkJ6yUwR
         yqFA==
X-Forwarded-Encrypted: i=1; AFNElJ/K2cLBOpN8S69d3tSDQVKlIFJpWlJDxXsCR/B/ZIjUYfAujbqrkdN5cO6d2BfvnKhsFVo/u4hRO0wE@vger.kernel.org
X-Gm-Message-State: AOJu0YwgUNyi5fWle8DutSgjIQw62Xs4rvzSjtko5amYGwNNEz3szJ/U
	SFhvdUXi6UBx2kBdxghGTka54Z6ltBcr2Qdsoe9POwBXJTUoWFh/QYdzV/4f9O7WMZE=
X-Gm-Gg: Acq92OGGmaONvGKQo7iRyo6OKfZGK/ViicgWoxaarfByYD12t/mTa7X8mcYmSG2A6yb
	XhbBCoieEB1xKIkfXV7XpEQBU4PvzUDLbXLHNPIUaVgYPolUIQ8n7M1hZgL2rIKlvygJChJY9Fw
	zL2ejuaQQop8iCPg4ZzSRmWSDNqUeS/u56LCE7O5oeuFInUQa0sRKQOxEDZ7DTDcua7YZwiNpLw
	gmuyF1tO0KZrdFnTeabccbZs9WoBpFXadc6C33vyJqpr1DjdMP5Uoey/riqo0hoYCbS7Dw2mXcj
	bfAXHYlHAO0BhY6apKO7T1S1RR6NUD+PlNufpB8T2RUQQWucV6TMOOYcuFd4oQ8Eup0W78yNPsA
	w8984+bkbxrE+y6XcNSCNUvkQag/sp+mCYUwvu7CkpYc2tWhREAlo55hWkgdqzj5bFlgvCP8ETl
	tqgqjUbQh9enXZlK2ADgwCH6w2F98FguwAG5zHHi2xMFX25GXOkkLQOyg=
X-Received: by 2002:a05:600c:8b6c:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490a292fba3mr15871725e9.18.1780082592072;
        Fri, 29 May 2026 12:23:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm28692545e9.9.2026.05.29.12.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 12:23:11 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Fri, 29 May 2026 21:23:07 +0200
Message-Id: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvnGWoC/5XPwU7EIBAG4FfZcHYMDFCoJ9/DeKB0uou6pYHa2
 Gz67sJ6cM1e6vFP/nz/zIVlSoEyezpcWKIl5BDHEvTDgfmTG48EoS+ZIceGK7Qwxyl4yGfbaA5
 udSNFmKJ/pxkyQl6N0RYkt4LIDIJQs0JNiYbwdZ15ef3J+bN7Iz9XuzZOIc8xrdc7FlF7/5xcB
 HDg3rme9NB3Ep8/wuhSfIzpyOrmgjeq5DtVLGr9RvFG8Z7aO1X+qlq0O1VZVPJWtKrrvLX6TlU
 3Koqdqiqqkd5IbIQm5f6o27Z9A+OP9kDtAQAA
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1975;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hyz4a9KfkQdq6GF9UiDXxz4gzafyVLqjGocQwFon4KY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqGeedDSAmaxEWFCz8CYt6xxzZKkdzED+A2UmDL8D2
 nVNNL4CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCahnnnQAKCRB33NvayMhJ0dn9D/
 sE/AU77M7s/TwXuyqD/Mj1TYB7fXk4pCI+bWHvo+AEKx3QpoHQ6cLP/EZCUtdwYRsuWCFDI8afjfJr
 9psSKOo2Fly28TOIETBHkajm6CHMHh+e0Pb2biwVuUl00Rp5+KVHNMvogZg/kfNqh88baJPXGIwQNJ
 PCXJr7FP/tFpp5hFcZbacugiKvc2nohC61M84GNKpwgmGUzkbDNYgY4MEzgIj9Ww4PMai1Fc5AWxm4
 HINbalshfz5hR1omdn90hXK9F6+FOGEfKajDmcG5EhNacQlVON/10by2hKHG55MC6C4ofHsl4ApSrj
 IyG+wbtMoZmwG3tVi+obY4D0GAdQ37+JRqAnTA+9gJGSXJ8nZaYrp1+ID4G1Kd8u4i1nRIUjrjYS0L
 yCtbu82jAH8qXG8eUBOyRnzWr/Uy7h7oCiuZTzWiI0hpcNx1IOv4rIp4vC1F1IXx8dTU7GVgPCihZT
 YSQFpSGbU1VISH8Xu+7RuP3xfHdoCH0pEyTn4Oucd5bjEaBHXMAuCdAFWRy638S7Nk3/c5Qa8I4zvJ
 LkDeVo1whnBmBUd2uqtF7pRLAP5zMJuzHS4SZf+v6wYCZ5N4j91OcxQ45vK2miY3RgxDB2bvX2ACWj
 XWi0WdtUHPd/1OPlw+z7BRpTJi2O95IlMYgircSQ2I1AB/eP9cr8dWAGU42w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8381-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,msgid.link:url]
X-Rspamd-Queue-Id: 67FB0607D5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Rename vddio to vdd and make it optional in bindings
- Kept the bindings review since the change is trivial
- Link to v4: https://patch.msgid.link/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org

Changes in v4:
- Fixed Kconfig typo
- Remove again unused macros
- Added delay.h include
- Link to v3: https://patch.msgid.link/20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org

Changes in v3:
- Dropped unused macros
- Added second autho entry to match header and commit message
- Move my signof at the end
- Switched to flseep()
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org

Changes in v2:
- Fixed bindings subject and removed "|"
- Added review tag
- Added higher delay before reading ID from HW (100us was too short)
- Removed probe defer if i2c read fails
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org

---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  52 +++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 259 +++++++++++++++++++++
 4 files changed, 320 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


