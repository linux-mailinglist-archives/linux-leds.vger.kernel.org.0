Return-Path: <linux-leds+bounces-6684-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEwXAUFUcWkKCQAAu9opvQ
	(envelope-from <linux-leds+bounces-6684-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 23:33:37 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D265EDC3
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 23:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D34766A55BA
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 12:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C14F42980D;
	Tue, 20 Jan 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYfjS2yy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0C429801
	for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913446; cv=none; b=uYDzq+L0KSrI0HM/0M4DOPdewigT5mRrbWSeU9uIqY4Gteen1B0uWbzQ7jE6gQfNQMwxc+89UHZhYMLNSsKyir268TCKK6HB0q4xbXFPcG+nywYfwpABnJtQqwxRWvP9eoWq+cF2jG6k4J0GbCJnfqKWygz23Kq4s2pHQLEzJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913446; c=relaxed/simple;
	bh=6sMqGXnBsWs7Qtna1yPZgI8g0wHllWWzrqehilIX0J4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SVnZfkZjsL2D9qiT+UqwSUjKcKh81sAHgeSFwhGK3azQsqXyzD0rel4Z3BqVhxmZUbIL+gzTsAh9H4npjQvKCnC7a/e4gc7c0YRAGwntiEdQ218x1JXN7zyszAnm6ZwZ36A9R4ddClk8p7vrNaf0KTEWWAOXtMhURc6VFMrGYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYfjS2yy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29f1bc40b35so53754795ad.2
        for <linux-leds@vger.kernel.org>; Tue, 20 Jan 2026 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913444; x=1769518244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJYUWQwQhgkeAbC/dM1w7lsNUkVncAvp21VUFc05s9E=;
        b=MYfjS2yyNT3EgyCloriC6EOaPE4vKXLkAjxfqTCmte2Ls/zCzZKJk9p90e7f1LquGL
         f2bCEOyOGziLUZuP8Dy7yBoTSV1DQ4AHNrPu5hkd7AeEhpDENNwKS+K8RXQctTUIg32v
         dKc+0oVX9MIM3ArcRR/EUH62OLEH3Q6H4r0mSJc36usfYJ06Mq6vKbMQUabZA4vrEU/j
         FqJ90OACA9cE/BAAwXL7d9LXUMBbJYl8W2tD2N9GagMb87LZWFPBgHGRyD0m/dd0/yaK
         eOl505ERFcC1/eT1VJ0GNBU/wU7TVP4mksc0q3lfd9cBRcG/ste7VDnx68psnBamMbg6
         7SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913444; x=1769518244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJYUWQwQhgkeAbC/dM1w7lsNUkVncAvp21VUFc05s9E=;
        b=VPCcNgPJizDklSY165JKarvV/4Wr0bic6cAF8qZFCL0n05HJHyPJbQvaWupAlhPfb0
         Zv1UQzHIKnD5S06so4VYvBJzQBGy6eT2znNptlPmnAELBqj9Sh8rPNcQIyRqNopywDOF
         fnXbqt+ZzjZComty1CiB8Q56Orzye3kbddw7EI03hP8ILAzk03ay4gI1PrPaDLd1PgRw
         j2HnL0Ztzp2HE7gfMDzTDgcjovd85g/a8WHgaEOvca14UxPLiNw0GuBy727cD2CK4a9T
         fBXeXj8bH2Njl1C8isFVWcYLHZ34xb6dBENf/RNgPVFNLGKgM3qPOdETc3oqUPcmFJtx
         Px8g==
X-Forwarded-Encrypted: i=1; AJvYcCX58GdOP5XMPo+cvhQXXBs2L+WP3sE+QiNvX/zp/e/alOv+Sv0F2MpMS+0mgimxKYy2b+XASwQALzka@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9kzKjo3wy069b1CgOZLioykIiegFp4M7AKhnNITZ/TTN4OH4u
	fVqaG7PaFl8EvzbYi/hoPLAoIey5mJ1BANSLwcFuPx30BP058kM1pHtN
X-Gm-Gg: AZuq6aLfyoOdYr1xuDCCMX+pM2eRHqRULVHPwC/SQe7TpOmt5eym5bhvwzMDPXj6J0m
	dZ8F45Id6NAo7p2yJx5hkkHybBdBm8CYmGUJT+qaS9L/yQ3UI8DsFTn4r5IT5sUn7GDlzjHEf2y
	AS7ucYcZh1Kn0m+GCkCPbZGqSxO2DxayVKFbAzW7QX8ozq1eyVjF5SJsR/r2xWntAv1JZ1779Yx
	MVEL1pR7znYA0VXuihk8aibgxXjt3HZ12rrkBnDpeuFqIJ5AOwTMip9cBPITDzqx8oSkq0cnmUJ
	VJj6zqLZBAroeB1KM4RiS9NaNEotQt7zVj3KCByxW2JxIH/JY3HzMO6C+WMgbnEQIk9jhO0Q4xY
	yguQCBKwuLUkia4MLvwGygXaUe2X92tcG/c4QEpRBYz5gqMAgEHSiDaxeS+bZfKuz3xzLgHv1AC
	qoC8enXaKHLGgBv7ro4LkJ11HejOy5fFf+XyBz
X-Received: by 2002:a17:903:1447:b0:298:2afa:796d with SMTP id d9443c01a7336-2a76b26ccd2mr17322155ad.61.1768913443613;
        Tue, 20 Jan 2026 04:50:43 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd582sm124973815ad.52.2026.01.20.04.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:50:43 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com
Cc: deller@gmx.de,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v2 0/2] backlight: gpio: add support for multiple GPIOs for backlight control
Date: Tue, 20 Jan 2026 18:20:34 +0530
Message-Id: <20260120125036.2203995-1-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[33];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-6684-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a01:60a::1994:3:14:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.25.139.140:received,209.85.214.169:received,103.218.174.23:received];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 93D265EDC3
X-Rspamd-Action: no action

Hi all,

This patch extends the gpio-backlight driver and its Device Tree
bindings to support multiple GPIOs for controlling a single
backlight device.

Some panels require more than one GPIO to enable or disable the
backlight, and previously the driver only supported a single GPIO.
With this change:
 - The driver now handles an array of GPIOs and updates all of them
   based on brightness state.
 - The Device Tree binding has been updated to allow specifying one
   or more GPIOs for a gpio-backlight node.

This approach avoids describing multiple backlight devices in DT for a
single panel.

Changes in v2:
 - Used devm_gpiod_get_array() and struct gpio_descs
 - Replaced per-index GPIO handling with descriptor array access
 - Moved the bitmap allocation to probe using devm_kcalloc().
 - Updated commit messages.

Thanks,
Anusha

Sudarshan Shetty (2):
  dt-bindings: backlight: gpio-backlight: allow multiple GPIOs
  backlight: gpio: add support for multiple GPIOs for backlight control

 .../leds/backlight/gpio-backlight.yaml        | 24 ++++++-
 drivers/video/backlight/gpio_backlight.c      | 66 +++++++++++++------
 2 files changed, 67 insertions(+), 23 deletions(-)

-- 
2.34.1


