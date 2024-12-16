Return-Path: <linux-leds+bounces-3610-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52C9F2B29
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 08:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25CE21658E3
	for <lists+linux-leds@lfdr.de>; Mon, 16 Dec 2024 07:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541401AAA24;
	Mon, 16 Dec 2024 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Ayvszt2j"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1901FF1C4
	for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2024 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335374; cv=none; b=CdWLgGjS3enbMETeWsISsVpODdO94EYqHG05+HNHaCMc5gE90qj7VKAibPVzFCyXk3bXqtUOiPeNWTUkUWab45B6zMkdRgIzygMX0+pRQ+t80NxuZK6TwlLRs3DjYrFsOQe+lYzzArZOhMfwHKa9vjs1z/WsknD0+mG+6j3V720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335374; c=relaxed/simple;
	bh=mKfecYvyd9Ed+foU21elt75SnTQ7jxLys65foSfdhj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cfctdEq0leWiVqaz4vsN/M2gxJklwLfLjIPJbyq3D8jNugJwqUfRqOiOwQDgyO0+XU8jV++aD+8Oyq8GvA6ZmYlnMQp6XRGWE9utOhkfY98sXfOFxVrIpsy/1bY1Rlp/BmQ0h7hQtxEBjxuJ1DIPfmuUUWFKMiRPtmPwBWara6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Ayvszt2j; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ee6f56b4so3129112b3a.3
        for <linux-leds@vger.kernel.org>; Sun, 15 Dec 2024 23:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734335371; x=1734940171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3YGcdpgc7Msq5fznO1WU85erCIPp7Gi0gsPLgpOxGt4=;
        b=Ayvszt2jkFzUyT/i6bighz+31KtU1VMhKwJ9ShNAHZaKkNXw2UuR2I+AEfQBM+zgai
         00QNatpPGExrP/ABoyDSa7DAVTd5Pd3scAgp6n461Tej2/g40D/lBlN+MNDmpy/czihk
         vfdL7PI2s1NE09yjcwjKoHB+jmv93NkExzDJgH41+uuKBfwDoQt0RYf1xVuwjOoaPjMp
         d6rhfE3GrmKOh06OJI5a2hpEeDZKtn5U6oPwhajZsRNPBtFz8IIo1GdoEV4P1HmvcQIB
         tqmpv6prUqFgJcKhG4o9VU+LcFciEX6Ty5fSpy0OUm44QmR+wIzadfUeGDRy4hT5eR6q
         QoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734335371; x=1734940171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YGcdpgc7Msq5fznO1WU85erCIPp7Gi0gsPLgpOxGt4=;
        b=wdR5L/8LP2fBNJrzj2w0GgPtDsrMiAY9RhjEqh9Ep0rzhzwF0hbstw/vORac6dPao4
         Qw3csA0OJLPuhgvHIkTViuB2f0MlhyyC7fw3y5TKOxu2rEa3LHRPV2SfazheWXhMQRdE
         cN3JK65nBu6zvHF9aUUyCbccukTZEQcWhaKnaDJHglabegIOH9N1gJMAyb0cKrq3VSFi
         NihBmerbuL9QiplRJNUuxiaZPfiGzswcsTHWOROrAfsTxfAptBtDadtgL8G8CNM5dh7f
         CKlUhYRybWOEoIxp6vRdY//KG6hWQpiT/YIUaO2Fj7pe5BOyWJbzhMP8TMgGzzPC9R48
         ugxg==
X-Gm-Message-State: AOJu0YxLSYOvJ4odub5GhgwNdDu0dlvzfS/W3HOwied2dhTvJY/Grm03
	TVrLD1gLyxGFqumVx7nChg4FBrg/o+L/uCwAmZHfcxnui/Q7l6ynongSf98CYEE=
X-Gm-Gg: ASbGnctlqevJWkUlykgmn4MO3/YVD4UBRHwbWTPMPbHKqnYadhbV7Wfnztz/+cgeu/9
	znD2VZVbRIkJscI0PtXhQUUs71lJzgmWc9owUvjMLik/P+3j9ck/S11bfkKQAvkvkaHRDJJqvuE
	y2/pp+fpNCKvq1TxkR6Sg0JQQtOYF9sdW9v+m21sFq12I1LR8/s8rnbLHfZfQT9Gai1FGY3muUf
	npzHFbwNy21pW3mf76Om0cPms+ueoDA6g/YzJ5k5GLiFQxJ8PDMmlsP5uUQwTPXnTgfANyXBAQB
	MrRBVPEtlBOGsPlWSVN7DfM902/gDwddlNlrfc3wB9o=
X-Google-Smtp-Source: AGHT+IH32xOi6VDRoL9F3SunYc9OwUouoRIkW4oKlIZqPeZrarfrSmbLhN+JUl2VMy/wNFlj7EVivQ==
X-Received: by 2002:aa7:8c19:0:b0:729:1c0f:b957 with SMTP id d2e1a72fcca58-7291c0fbb05mr8118227b3a.25.1734335370783;
        Sun, 15 Dec 2024 23:49:30 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad81asm4114072b3a.151.2024.12.15.23.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:49:30 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: pavel@ucw.cz,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] leds: netxbig: fix an OF node reference leak in netxbig_leds_get_of_pdata()
Date: Mon, 16 Dec 2024 16:49:23 +0900
Message-Id: <20241216074923.628509-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netxbig_leds_get_of_pdata() does not release the OF node obtained by
of_parse_phandle() when of_find_device_by_node() fails. Add an
of_node_put() call to fix the leak.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 9af512e81964 ("leds: netxbig: Convert to use GPIO descriptors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/leds/leds-netxbig.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index af5a908b8d9e..e95287416ef8 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -439,6 +439,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	}
 	gpio_ext_pdev = of_find_device_by_node(gpio_ext_np);
 	if (!gpio_ext_pdev) {
+		of_node_put(gpio_ext_np);
 		dev_err(dev, "Failed to find platform device for gpio-ext\n");
 		return -ENODEV;
 	}
-- 
2.34.1


