Return-Path: <linux-leds+bounces-7050-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFOwFMAtpWmj5AUAu9opvQ
	(envelope-from <linux-leds+bounces-7050-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Mar 2026 07:27:12 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F01D3703
	for <lists+linux-leds@lfdr.de>; Mon, 02 Mar 2026 07:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CF58301324F
	for <lists+linux-leds@lfdr.de>; Mon,  2 Mar 2026 06:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455A23358DA;
	Mon,  2 Mar 2026 06:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxrcUD37"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1A2D23A6
	for <linux-leds@vger.kernel.org>; Mon,  2 Mar 2026 06:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772432822; cv=none; b=qb1SuLGrDHBH4xjM3KIyTSR2H5XDnJ+MxPTCJ1k+Ew9SMFQPXEJec1mRQYNkhSLY/D7nXpnN3UBklyzwuFpWwzZS3pWxUbNP8BpEao7SuZZ9y0n4hKXOlrmJ6vpNOWwvLyDmMuqX9r1XKjJk6qK32NRBrmAS+iWT53dfE4lGATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772432822; c=relaxed/simple;
	bh=zo6+Q8rEnySkoF/Ls1i+DHFGAQlp2Ml7zWL3tOI0U8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nAMpQ3NCPa6tpQJsV60E6nDhGMTo0EoKQEmxHoxT/MdQOuqeg9X//XpwPL/8pcW2sObI1kiB/HRhRuI+soJULCzxD/jS+hNo2SbN/JbyFRFYe5ZCD60bykOJ+3EWruYMzKQrec1CAr13ptp9nsChukQSFETvIY/cDivAnonduI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxrcUD37; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8273eb7798eso1710643b3a.1
        for <linux-leds@vger.kernel.org>; Sun, 01 Mar 2026 22:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772432819; x=1773037619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L91Q8IatAKBkKu8hLYz+uIzJctBddoN9o5GCq8n1+hg=;
        b=ZxrcUD37oB1dB/urTG5HyZMSjPYMOkCe1JkdTpChSy82v6A40/GsvAnjKUPkkQ65u9
         rvErQ5Q4li3JXXvTtYelREbyg2yRkXWdzRtX58q4Lv1kj3hS74uzjHygq8caCWLfy3mG
         KaLU0yE2+4evcCMpuODs87+Kvk4fPfRGTTD2c/meD4h7gXtDo5jSVR0717EVbc2g6dsd
         troK1Vx4gTg698smEouSKQmlhMYYg3Dju6OOI06PxBabhRLp5Ingn0fFBfI8e71s0fbh
         Xa8R4UiZVb0X8FxGPx/zs4u2sbHkF31H6DhgapLj4ScLK1ti8n+AOdqYO6vVRvqXeK3b
         4vjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772432819; x=1773037619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L91Q8IatAKBkKu8hLYz+uIzJctBddoN9o5GCq8n1+hg=;
        b=NCDOZQtQPG3S5fClSKPpPk6QZc2g+QDTCyMlv4L5b12rEDkNgkd3mLkeO0igfGVNzm
         B2vq1Ug+OtBCGKM+8IUgfEy8DFKd0mG2q+9/4hmLGygI4BB07Olug3U2OVkKs8zN3pxg
         GZmyN9+tlKhKblR505u83qFSsBk2sHwU60FZ9XWYHAs0qM9shhIBom6h9X5GmD0D04WA
         dMs7s8TyBeEWum/jM74Y5Hx3e4QQaL8p2WioIQ2moGt6CISPW+FMnMXWZPaGB9gQoK5I
         PAnjd/YwHCp74ucC4u80axEgynIkgAsSDIYaQo/Idt8f25SV9RuK8Av4EzbdNO72MfIe
         0eNA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNlk/KagntYrccKobjyuNxq8ZlH5Z0AwUbpGB+gpdBwMd8OHcg0h7OAjM2+SsuvrgyHA9lVp5kc24@vger.kernel.org
X-Gm-Message-State: AOJu0YyhOnJgws3gy67+kwhnTU+Hq21qaYjZnv6iCLob4gFsl+nHErXz
	DulTvLX5CnHszXyuthC9bhgzTVsFOwHJkZT4I3a//TKADbt7NiaCYXuy
X-Gm-Gg: ATEYQzyfpyYrqsR5bPBvDB6AAUP/BI2ibChlvMcdleAqrkgzyL0Oybzclxm01GGHbPh
	M6zxKJAwiQxddLg5QScL06dmFCvlGBpK6VzcwXd1yqW5Kzrd0QDu8TiHfzUX0NA/19+U4jeuiF1
	uW+vQKIcN0JbMDsoxQ+tXA35eZ/SlL080HIa7G5NHebV/u08XVp6dzOoIhVlHZOuKkUuIvip5Ln
	pzeUDvs6+EiGiIO7ZnQI2KvNu9vWzA1ERnUO6PuOY+W9oESeeMcYsXvvrvdGeEA5t0SyHUGQr1R
	26lDeEorIAr0RIRLdqyOnvhq+z9W8dbikK0iTEITDKTmePqtZ4a1v1NQv8fMmUQWShMa0d6nJ/m
	/QAZx10LZ/vEk2rmcE/K1sivtRQzyULie4NMAEKf5cSUqjNORJTStA8WtaNn6lPhGOWBTtH7h5k
	2zJuBReJCUdLXakw09qQzfgMReFDKET3VKqJ3fWoX3e9C8+FbnBb/B7X8g2hvn9w==
X-Received: by 2002:a05:6a20:9404:b0:38d:e674:b60a with SMTP id adf61e73a8af0-395c3ae3834mr10889293637.36.1772432819513;
        Sun, 01 Mar 2026 22:26:59 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm12274234b3a.6.2026.03.01.22.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 22:26:58 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH 0/1] leds/build: allow tristate for leds-syscon
Date: Mon,  2 Mar 2026 17:26:45 +1100
Message-ID: <20260302062646.938576-1-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7050-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F23F01D3703
X-Rspamd-Action: no action

My first submission to a linux-kernel list, so apologies for any errors.

In OpenWrt one core kernel image is built for a particular subtarget,
after which it's only modules that can be excluded from an rootfs image to
reduce the space consumed.  Unfortunately leds-syscon currently doesn't
seem to allow for being compiled as a module where it could be excluded
from an image. In my testing, it seemed relatively straight forward to
enable this however.
I wouldn't anticipate issues for other systems, as they would still be
able to request CONFIG_LEDS_SYSCON=y to get the current behaviour,
identical to how they currently operate.


Bevan Weiss (1):
  leds/build: allow tristate for leds-syscon

 drivers/leds/Kconfig       | 4 ++--
 drivers/leds/leds-syscon.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.43.0


