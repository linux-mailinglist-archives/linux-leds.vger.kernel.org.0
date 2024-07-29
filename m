Return-Path: <linux-leds+bounces-2353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E9893FFA5
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 22:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AF3283974
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2024 20:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4660518C320;
	Mon, 29 Jul 2024 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aveEfELR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91D187325
	for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 20:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722285660; cv=none; b=Pf8j+KSZIGc5as6DIZ+13XrChm02jc3VHoPGsgY0P4+KLgn4QKlXC6ve7NOe5Xp/Jzyx929+vQREm1h7CXwF1XexVWfKhMI6FFTggtw2iIh9j5UEoqN2x+NucpkJI/TXCoODkSlANpXQJGGXu68W9pwJIGNAS3roxDg8r2NkRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722285660; c=relaxed/simple;
	bh=JDPEiWSJjysWusTQvGLI5kdhss1TZceatUOZLyfukGw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sQxGVmPiYnRQj2P/m+iLKS3SFEo/bFaYlCu9YgZOWeQ88oPNv9X9Mpk205DnzzAyG51yVMPNqIAzahY6+S1Uwp5SNactl+ohVFNPbNBLgeo2Gn8YQzE9uZ2pRS08Es3xKG/LwsL3W/MSS1HnRulQo/6H9akVmb/aZL0IG+DM1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aveEfELR; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-66af35f84a3so79569857b3.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Jul 2024 13:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722285658; x=1722890458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n7ZbQjS7fYcpPV8CeoeZ/SVTCnctOwY25lHwhKuyOmE=;
        b=aveEfELRynQDeu6m8lfJxC6PffSi4c+Vhkq+X7jVBgjQE0aDy1c7VcyQpsUNY/EyxF
         BaBkhKp2aKsDAleAZ46Byo9Ndf93Ibvxj+UNXoPe0ylGelBb3vjLuzE2QJwuUDeN3SXm
         wYAHlA841E8nuGqxJDfWQM42fhec94XxdWkKc2Zlod1BBH8Eg9rlqQC8uPKdZg6w6bpf
         FjJUqxWhpSUjmE/Q20Sllq/+hIzYH+XHAKDD045ryFkrANFkSBB6MoxABldNFUeZTHXi
         ov0kTWTJLkVx2nyx/Svfa5SOC9zickePGuoMNY7G/xJLRf3TUMpepZ15l+w+QQ3SsXCM
         IOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722285658; x=1722890458;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7ZbQjS7fYcpPV8CeoeZ/SVTCnctOwY25lHwhKuyOmE=;
        b=AOm3ImZlr6eJNuvVyuXeOLc9CSNy1kkUOD0/g6q71mzzLLuTfUm+hEiscVSIZHOOxj
         nzNZfQhgtNKWTP3KITLA/SEaiAXwIUCPc433lEDdk6QLFIHdz2S8yxOg3EadwqyEZGRy
         rr5XNQ9dmnsN3lcUykpeAieI39wt8P+r48upIQAdrgXC8rtfTiNHE3BMJtDvWqky7+It
         smJ0IYhDVJeVR3D53ypifR+ri1Xtzue26aVy2SddJFEWHv6D3wKl/RsO1Akwl+TzS96R
         HVCz8RX3Q85IMPsl7A/z4f3emc4mmzIAHWuWijcUqkRihqOdvDW7WdlGsNWOWIo3qaP7
         qXtw==
X-Forwarded-Encrypted: i=1; AJvYcCWWvcKCrzptnYsNOoGXtuAcfRgrzGyFpKoNr1VxpS8cMhmNzcHBMST0Nj9ODIeQs8JkoPJtoY3pedYlwUQlg6Cvux52pBMxsj+M5g==
X-Gm-Message-State: AOJu0YwYCa/EX0gKeDhEcj591PcIEX7aDI7bxc8t5+Ijo2ZUCcBvrFuh
	y5/0cK4zsrEnp7QNPdKK4QOyP8V4Lp8JHyc3O1PBRLIDlzAgsEJ8Rk4N7cFBMlQ87My3TLmZHJj
	bVd0GwOomckotokkyWg==
X-Google-Smtp-Source: AGHT+IF42e6dPo93pFDAH6b7KWc5DCBD36rR4/DxpqnZk4t1+1z42eObI3nYz2JdBz4NjrRNYjjHK3hIHceT3N/F
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a05:6902:2b0d:b0:e05:fb86:1909 with
 SMTP id 3f1490d57ef6-e0b5445e804mr861185276.6.1722285657746; Mon, 29 Jul 2024
 13:40:57 -0700 (PDT)
Date: Mon, 29 Jul 2024 16:40:54 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240729204054.2269031-1-zenghuchen@google.com>
Subject: [PATCH] leds: lm3601x: reset led controller during init
From: Jack Chen <zenghuchen@google.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jack Chen <zenghuchen@google.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

LED controller should be reset during initialization to avoid abnormal
behaviors. For example, when power to SoC is recycled but power to LED
controller is not, LED controller should not presume to be in original
state.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/leds/flash/leds-lm3601x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 7e93c447fec5..978256310540 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -434,6 +434,10 @@ static int lm3601x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = regmap_write(led->regmap, LM3601X_DEV_ID_REG, LM3601X_SW_RESET);
+	if (ret)
+		dev_warn(&client->dev, "led controller is failed to reset\n");
+
 	mutex_init(&led->lock);
 
 	return lm3601x_register_leds(led, fwnode);
-- 
2.46.0.rc1.232.g9752f9e123-goog


