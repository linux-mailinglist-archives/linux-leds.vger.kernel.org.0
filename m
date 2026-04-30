Return-Path: <linux-leds+bounces-7921-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP8xHekn82mwxgEAu9opvQ
	(envelope-from <linux-leds+bounces-7921-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:59:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E14A05E3
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF315302A0AB
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 09:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9397402B9C;
	Thu, 30 Apr 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qloev3DS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638BA402449
	for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542446; cv=none; b=Hehf5uF73r0eao6OpfM0QTgvKUHZKqlNKMJF5ouSBm/MJmcn1OLwCBQLVmmEWqaX6juwJYHWDkAlj38L/iSW0VvCbhTdsiNy29Ytx+7jB5USr0c7t3MSshuQGWQGcfTN2q27C3Fr9bXd0ekv/mbmSxchLzDlZ+snFDKhOQiQvmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542446; c=relaxed/simple;
	bh=sTmt6cdg1kP2+eYTeEKKnHTzDGESqLOto0bqSvNzmv4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eE/M3JNJqhn1/iMCNMZ/8xprXZDYxhB4KFJdnaDZ7atRFwLl+aYrhxAodf3/+mcQPiIMblh9V7KDov6qZfeIlnSDxiItR1H61mwSmw4xPqpkSrZeXKWA2t7N0+E2VYpHQZOsyciSdLfcFtylpSrCqoigRwK/vyZ+e4EB/BwnGM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qloev3DS; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso6180285e9.2
        for <linux-leds@vger.kernel.org>; Thu, 30 Apr 2026 02:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777542442; x=1778147242; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRjYmZEKAOcTK8eSw3z2UVlFOUwJtPih74xVLDcM6go=;
        b=Qloev3DS5tHBdsybmK/z0AIhQARlY1xsZLmzpOu/fAjvVfrjKvCL8zmVqqfsTL3DUL
         L32j0m6BNHRj/xC7xTYAWeikHaAMwBaO6vFKYEXosivLpMEVsp3tgkUeQUQVimKB/sWE
         M5kWjWlfaQHGBApN/xRJU8fmoQIr4w2rRCdieSAQ3MY84rw5aIQ04lKV4WAPgXPSM4pz
         E4ufEyt91fz/BADWcYqAG9K3hQO4yERjD8zqPgeT1FR+ICy/EXQbIbX9p+EWsAJk2qmN
         Q5DKy7sRkYaMjieRD10lHablDA4KITo01c6fwRzRnIK5B0U/OWHrFXxEkGMo1IRR/vQI
         dS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542442; x=1778147242;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRjYmZEKAOcTK8eSw3z2UVlFOUwJtPih74xVLDcM6go=;
        b=akW6n9ZrmQy0Suz7xFFSnK5qpnuPe9bQf4FRUjZ9bDqCBjiRozFYsxCVIemxkzjRTs
         cyBnmhAlQPCuOc7Xc3s6x10D9gpvD9eEqosXk0As0AU9dYSwQQwBT0VfWWk2Nca0xrUv
         nyBXGfriRushR95PO6E1yYl9TmpBHaqTlkvSKtAroMZ6UQYb9qQ/SKMms2lATJk10yl9
         WY5rTJQaugrIe4Buk6bm5vGzrUcmVF6OjSrx4o3fsAeYi8AiQRZE+giNKTH4hCJkLg8A
         Z2idqbU0JGVkuiELHigdLc5FdQ8xAoDVjHz9ENWv+/JD9lklvPOK1OARn/qWTB4QcI8B
         e2fg==
X-Forwarded-Encrypted: i=1; AFNElJ8WLW0pTupa/cXQgRcQTmXbDHJwJtknK0Ov7/3DRxkXKC+0tDKh73MHECZpCNzRi6MhH7KLa1+iVPhS@vger.kernel.org
X-Gm-Message-State: AOJu0YxvlvlPBPfhIwf1M5pMP8t6kj8LqtelvZLmtqfUfd2Tp5OLWGCA
	LUBkyj/+yNYMwmGx8NkCDEVVFLqT/QpSnJW7wFziq4V70Ja58+QLgEoWR2OPzkGPRyE=
X-Gm-Gg: AeBDievxrzvzR6gBzGe+GT8lSraraVbV06/C6hTKKXjJuAv6sAJ4X/Lq3hFAALVQfZi
	Ham2xPO8BqOddxhBmjCp4ZG8LYfm/MVR9ZSVhvZjkOhsc215T0VfwUHjO+zO7heLTMqQsCq08la
	58exWmQ/W4r4e0EJegN2w8owDsrBjZV4AIt2xQECdYC2zr+XIZ1jlZO0UqostcUVfrEdGqwlVa7
	GNPkvXY8r/sBHwZtGWGlEmI8rp3f4J1pSZ7anm2EKo6HDDLw5JfxVtKHyke6M8d3H9leyVJvgzp
	O6RIkt3/6f4p4+ZWdIXLyJbbnAiZ4cLKst79hqI0m2ddBGblniO4H9pZNH4h8yQrPKSowv1/UXW
	WTSXK7muVbk1zzMB0nw+hPdBclj6n74igvChUYGT8yIZrFkGCEGvO1Z4TC6Rc3/FxEmiwXpbSj8
	L8QoEjWE6kb2z97pIqvScKQVUH6/KzHWsKUPJ5OeM1Av4iQcsXxq+dDwo=
X-Received: by 2002:a05:600c:a312:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-48a83d119a7mr27313465e9.0.1777542441736;
        Thu, 30 Apr 2026 02:47:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b9493bsm48984745e9.0.2026.04.30.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:47:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Thu, 30 Apr 2026 11:47:14 +0200
Message-Id: <20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIl82kC/5WOTQ6CMBBGr2K6dkwpFhpX3sOwKGWA8aclnUokh
 LsLeAKXL3n53jcLxkjI4nKYRcSRmIJfQR0PwvXWdwjUrCyUVIU8KwMpDOSAX6bQEuxkPQYYgnt
 gAlbAU1lqA7k0GWLZZqi0WKeGiC199syt+jG/6zu6tG1vRk+cQpz2H2O2eX8mxwwkSGdtg7pt6
 lxdn+RtDKcQO1Ety/IFCKGgpOsAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sTmt6cdg1kP2+eYTeEKKnHTzDGESqLOto0bqSvNzmv4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp8yUmoqUJMN6KNXMYggn4lvttmBXtPuV5E+4QafFy
 alS9YaSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafMlJgAKCRB33NvayMhJ0USJEA
 DLLfrV+XmHVTW0+P0QA9uwsYnnl//UlTxUS+XiiMlrgttbffXtd9m2HIhP7aWnLwK3BcGSNyvm8z3Q
 nbl4+8HkGfS/jsDRnCrHRT+cSvpBl0gLyaF7yarxlI4U2FlS8dcDyWEOD6306AXPrFcSnzxXYwNO2z
 J6HOROZkbBe2rsbTC7kTI9BsJq/vwizGsHzOnLEczfJp1bks34RE8PrAr/U/25d+09/jkXoU1DGXeZ
 8+i3NE4tV5P0+TXCWCHsBdPrvtJlGXFYG/4/nk9J1zNTISz/XXOwy8MIziBkv+wX4s6d5S6+M9aK9V
 oXFOBSScGN7N2/y54VcDJ/k6jI5z2KBkvoSFfwvLkQ8pbRBCCyLFnimrT+bLgT6RZyImrVrJi70MNI
 IEiCN1hGnAYbcsldxgw0oFbUr3swseraQKWequ5W0vGwVWJGC6ORpy7XdOyETiiqt9D1rrvrnPdEZq
 cTK/RAPZcoJbCtDuJw88xOXVxaa/2/xkDJFH5VBxAmVlALPZTKjXFFNjkXObuZqgfiO5bBHezjkFHm
 H6tN/NVPOfFIE8iXMOgMCHOIzbrdBlN2czkQ6FHmhRK++TAlvsr3HWr7s6v1+GnWABOzsQ16wYQ+u/
 A3a3Z7suvh4S3r8aqe3gaWm5HVEHtPNvPQ6IxtLBvVuR3WaASL2HSIbfJ5YQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: BA6E14A05E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7921-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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


