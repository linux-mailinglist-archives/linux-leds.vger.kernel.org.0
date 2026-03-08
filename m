Return-Path: <linux-leds+bounces-7150-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yY1GJEbXrGnVvAEAu9opvQ
	(envelope-from <linux-leds+bounces-7150-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:56:22 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0347822E487
	for <lists+linux-leds@lfdr.de>; Sun, 08 Mar 2026 02:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0767301107B
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 01:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F6D2580F3;
	Sun,  8 Mar 2026 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQMOvDUA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270351CAA79
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 01:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772934978; cv=none; b=bQCZn3AgtoyWtTUlpkiRiV3jkpQVjCi0jtMedgZ5VvS7M0gkFen7iHOkekAsa15KLOZTt5BtARWB4kh7PeiC+KmVyFg9jRPJCkX5T45KDu+2WidtcCM5FB3CFX/IdPhJDhKUeIA93EdXwIkZ1aO5DNtQo/R0/119+EKNL5ZXc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772934978; c=relaxed/simple;
	bh=laQV1vVD5UeRPg5aVrnjS2a8ORtfFMt2mFTQJwLRy0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyrbsKoMfeQhhz3BS1HDtqCOeWRrrsDW0xmhD8s3UgP8bhjEZVzm9OW3Jv6lTyTJ/nCYOcKpbWlLMEMH/3hM74uzyrYiFTP+yU8gMHMbVMMlDbSFNgasT6YhJnRKidB4dHE+HZimzJn8t3OtqaHl1ibSXKSJovGV5VgYyWxGJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQMOvDUA; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd80f56b27so24458185a.1
        for <linux-leds@vger.kernel.org>; Sat, 07 Mar 2026 17:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772934976; x=1773539776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0ZlraAcI3wbiEU1l8IOyIiSX6Jx0dmte314dQ86Jm8=;
        b=WQMOvDUAWyIpezxHnbF/feOJHI7KgHQYPaND4dFBgMUA3jTiiH1ZfXnbYYgjeLS2YO
         QBedg5pC4nEBeAva4akcBNA0IJrugyZi4r1NsdqxxfwBDuoIQO1LnmJDFmJgzbdv8WHz
         EXyGSaDtawfqOMcgel/XWo7axTSSi2tPqRC0xGT9j1S9p28HYJh1kjeLHnZ1MhfkjBVJ
         sGNqmdG5O3bdAUaiBQ7njOhERTDNt1JuzkjUhSlsUu8ISHWXoz43UasxibuUjxpkHhH6
         npts6K7MsF6M2ow4oexPaRmjTXcM3+rSI3M04rCjz81G4FuIGWaa85uONqPTNem3CJzQ
         LfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772934976; x=1773539776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0ZlraAcI3wbiEU1l8IOyIiSX6Jx0dmte314dQ86Jm8=;
        b=vMCmKEGnrZcTw5ayrPq3BL40nn5s9tPryZcAFhQ8TcPEJ7aSmbQGzH0CWzRj5N2KuB
         zdwT4wfOdoIPlEcT3UfzfeHc6QneXTu0lZO97AT19PF2LTcutctdCMNYhhcFFVe0JbSJ
         CPZrOxk67bZjbNDgHJtsGQA6brmWR3Z+VP2iZhYbvD4IhVAfN1XPotj2cd4aHN6TZJnl
         HfKDWj+wsbW+DScxGonhGRCk0iHIAd7s3r1Pw2otBHQfH/upbCyH9ND09JFFcT7VLLDR
         j13ntn+P2olG5d9MB8lwgl7t62+xxGtobApyonXXONil9kMIc9OLjm3z3qfyRE48M199
         Cuqg==
X-Gm-Message-State: AOJu0YwK7eCwjKrn+ctcU9IB0x7CIXuk83xEq3Tuy61kqaZou+yD/5B5
	BrlT7XnYKKvInbs6ZG0Atgo83G3Ruo/1p9hed+PwstM76qYjuT7dsfhp
X-Gm-Gg: ATEYQzzKzHBnYeIwMqhSmTrb2WGSuAODws893pGjT0e9RSINGFXf5LgyPQVB3S1p0Hb
	qiYV8ba+iH2bOz91SvpbHbVxRFE+L3jWY2qC6RctArmUHXV7sCwE4LAOnsW+l9cGXZwQtUgpW+q
	nY/3nD8s67bcT1e/DPKTnCmBH9XW54V9EDRA2BDT/u5nAYGk+W5BfAbz5xQjxOKya6zfOqOYLjo
	CDJ4KCGHtRXGGMjxktRdTP9XU5uNRqAZgo5ta/0JUlhmYH7QuWA05r3/2pQhE4wnM8oAxC7Mn9N
	LmBjJKKWDVZDcUcQQ4rAdeXYZPPsnPvodFExk787WbExOmVqzPumpejwpcN1FOK3Y+Vt1neLgRf
	uE5NGvLM91ct/aWx9s8ddzSUlpeYdFm1vpp//w8c3fuiR+eg8JaMesWy8cpyFilfsfpleDG1YWK
	bggIBruGG+LuvouoV/TBoCY5u78zEKhIRkG+N2+uRGFv/Gu0viur0=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr859672985a.39.1772934976040;
        Sat, 07 Mar 2026 17:56:16 -0800 (PST)
Received: from localhost.localdomain ([202.63.77.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f57291esm447786985a.50.2026.03.07.17.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 17:56:15 -0800 (PST)
From: Bevan Weiss <bevan.weiss@gmail.com>
To: Lee Jones <lee.jones@linaro.org>,
	Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bevan Weiss <bevan.weiss@gmail.com>
Subject: [PATCH v2 0/1] leds: syscon: Add tristate option
Date: Sun,  8 Mar 2026 12:56:03 +1100
Message-ID: <20260308015604.2318336-1-bevan.weiss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0347822E487
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7150-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bevanweiss@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

> My first submission to a linux-kernel list, so apologies for any errors.
Apologies, that didn't age well, I should have looked at the file history.
It looks like the module=>builtin was done before, so this change reverts
that.

It also adds MODULE_DESCRIPTION and MODULE_LICENSE along with the tristate
Kconfig.

In OpenWrt, this allows leds-syscon to be .config'd as a module in 
subtargets, and then included / excluded from rootfs filesystems as 
required for specific boards.  Without this, every board would need to have
leds-syscon compiled as builtin just to provide it for one specific board.
And OpenWrt devices are often space-constrained, where this is a
significant concern. 


Bevan Weiss (1):
  leds: syscon: Add tristate option

 drivers/leds/Kconfig       |  4 ++--
 drivers/leds/leds-syscon.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.43.0


