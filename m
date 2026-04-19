Return-Path: <linux-leds+bounces-7770-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBbzLtah5Gl6XgEAu9opvQ
	(envelope-from <linux-leds+bounces-7770-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:35:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1EE423836
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47C093016273
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 09:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C6037881C;
	Sun, 19 Apr 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zl6oi0IA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98952749EA
	for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591277; cv=none; b=tD4I1CdTsvSJBKXpLFtDTgbC8ORaTVRKkGtxd9nK0gwee/DklZ/BYFSRJbREATctDih/G58MSoH/zsg+YfP+Y1QWVP1cc0t/qMWsRdb20eIwX2aapolnIJuhSXPlnHM48UIO8javfigjVtwmFqVQfqL6rqbkRE23YhsJnR582zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591277; c=relaxed/simple;
	bh=norNfde2cZxGgr7iCJx3n/UVpBzudP2qM89x8qgS1b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBzovtnKF+MC87+w9J7o82IW1JB6ZrjYUGLHUcDf/2YVeK4ldhsfw++exhzd1g7VjCtLJd+iFV/vhAeRoI/yw7HdWOuCC+wVbJAFRIFbh5+LpItQxXaTpyFquQ+twMZxcSKxt1PPYVODGiF6/nQ3Jc49GsXD/XThQvdNTZSwEx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zl6oi0IA; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ccde812ecso20054021fa.0
        for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591274; x=1777196074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/2aUHxdqDtp+3Z99o+AnFQJqjm5BGPJpL3yuh69NhM=;
        b=Zl6oi0IA7lpu+i7E/xp0y4TRY7uzWJvQ1zo6BAS5oOpAZ1obZLp11Ytn3wfkNmyVUJ
         r7hU6v60uN60FioQOlb8dFp9k706X2Jd82uXif2EVDV7jdamqMkXJlwAAsRtXLHW8O0/
         LBvFVoO8+UQUAFB1yZWwZtsncuuVejN2Xv2XlYRNoiZ8b1/Nwl828Arr5Cd1OkxVo8LF
         6fpSC+oovOdpKIXp9GeN+YIe17ZUs/QD1Tw4juIDxroK+q1I23Tz96ihoJv41OrI+lXg
         ZZDojhWK+pus3WGM25zeLdEC8hS+WfqDJ4X7yEb2FuL437OMarCwoiSYNy82zgr1k+eV
         gWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591274; x=1777196074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/2aUHxdqDtp+3Z99o+AnFQJqjm5BGPJpL3yuh69NhM=;
        b=RWZO38B85dUeKxeC6tgW8WeUoJZt52YkCfQ4ADhA5V76KfBvVfBtnTtFatQvtFbUZK
         +NnQEB4N3AlgsRsbW7ZkfS2GU48BittQQJ5hS5nLtCHS8Umkt7jqfwxg4nqjsVrTHuDI
         r+ZfPcLl/bevFb3Y/4w28VvcP9IqLqVU9oEXLSoV0sff2P7D140ONQAeG8tqJsTZgW/s
         nzOUBm/dtrR1V0SBtF/TPXeCnCftNmDgfiEJmc94W/aQzKhqMnJHa95RGuhwyUQ/DOJe
         H9QbDCI+BNQIZD5zgk7g66qGh0nP1yjMl8kXm2WeQ46ogUNHshpz/jBq7pQZhQtV3UHR
         AioA==
X-Gm-Message-State: AOJu0YwaC1+u420m+CUxzb1dnuSWgYDmszvlIKm8o2ryHjfGt0SP7mts
	z/xlIAWu4GNRDIv5UEnPutAFIPtf2h/VoxfZAKV1h4EGs8jZ6TeaDeEM
X-Gm-Gg: AeBDies1r6sT8sJArm7SsonRDQyJw/2XZatcgqgThFJktB4A25pN8W08xQiHIT5mgkZ
	IvCZWmJvGuc6c911JvdYeeH0oYjxrCp1PYQZ4O1eDG8lkqD4UeU1ztiIBSAq9S24IfMLYGCLd5l
	u7f+/I5lO9tublqfF/AKKKjm6s56ylFac0rl0fhtRtgbYshm5e1X+cOdvD9ABuhQwgxSde4i51p
	Pr826cK8XLfzkP8qKNGKUa+bLF1BgS9xDWbOyPMRSenbigBTxc9xYGPawQVFKLkPZqaFIPy43ND
	HJPPHQLpV8PO9VCide5rR7UwDYWQeefY8c1UG7aJ6SUq9va48rTjvXyDaZW824MH72ET6zrRN01
	cH3oNDS6E21sY1mSipuJUc5r4TITOeYhyHnBHhote2L1ObXkSoVPJwUux0BLisYaXWfdQ24x3ae
	ijPkfFZ6imuZtS5EDqqraB5jBzTNmy0V/m4Q==
X-Received: by 2002:a2e:3302:0:b0:38e:9415:eb2b with SMTP id 38308e7fff4ca-38ec8fb23d5mr17461481fa.3.1776591273968;
        Sun, 19 Apr 2026 02:34:33 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] media: lm3560: convert to use OF bindings
Date: Sun, 19 Apr 2026 12:34:07 +0300
Message-ID: <20260419093412.40796-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7770-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D1EE423836
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (5):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
 drivers/media/i2c/lm3560.c                    | 262 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 -
 3 files changed, 340 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


