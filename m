Return-Path: <linux-leds+bounces-2969-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66294991E6B
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 15:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEB63B214BC
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2024 13:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BDE176ABB;
	Sun,  6 Oct 2024 13:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHpRTOKX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578F45008;
	Sun,  6 Oct 2024 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728220431; cv=none; b=fpe9L+ugVXdA8lX9qHYdNWIFCEP9Q4/8zvKEU1fIvLTP0GnB72++5rDFMYjAsmCZ3d+mEXs0iOWzb/mKSOLhEm5c1Ux7C4OViSlraVIChmB2Y32fZMtJFbHM2wLggfgXjmNzNHXMYaf32dWeEMYGZ6c1+JB7h5vtTT6ay7AsX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728220431; c=relaxed/simple;
	bh=KlY1ZMudWhGO563TKeMDeFUta90TjsP+eSiV771NCps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FomleL9nZu0b7s3ELxEixhHSwoiGNK5ZWKLu1H7pJ0EPG+TiiOl8s6mM+YssyXd4McvqlI59B5TMwnpg5PiMyHgXT62CFaxvbtl4NSN/aQcOwpoapV0mu5ZpruQ4otM9AB7yYv6Hj156942NiB2F730mreL0BwPfXiO37HtLVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHpRTOKX; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e075ceebdaso2581058a91.2;
        Sun, 06 Oct 2024 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728220429; x=1728825229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8RbTndRs8Mr2poqllCCMfJYqEYtpr6QKfUt0AvEB+I=;
        b=JHpRTOKX9z3+AnDOoEoVZ7HehuVXcepSRNTKL8PxglFwMoaDdzal8nD9adA3lHz/WI
         y85ZVd3Utmoq9Wcms+RCukcQFdcymeoK7fq6wfAMxB4f5ZvkKDNUPw3GR4nWVmY9WQo2
         jmxvgTHyD0/7I5r6gVbX83Aecscyq6mnmLqaNwo73CaRqnlFrW4yB2Y2vXVKvfb27oSL
         jILbmZRNM/ALbyQj4uJOWwvwuqjnkUS7R7qsmRQv9PKa+MZAHGHb6ETjaXN/YmvrIyPm
         FUvryFeNOH/C78+768SKV8ZdHVwvskT6Fdf0ah7i5N2SUP+TgeuzwmeC4CmWZJEBoxYx
         6SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728220429; x=1728825229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8RbTndRs8Mr2poqllCCMfJYqEYtpr6QKfUt0AvEB+I=;
        b=YcsKwvs2hvALxQvAuYK+ytwr8cPyaJGptPXd8umggSeTS/xZ8eXuxsi2NBuLiErF38
         TUw+sLXMGZjYGKTdHzytGITgS+HLkk78Ija+HJKJZJRcg/hxdVZwxohjFOY0ol8d5pL4
         9HF176qUzc+0VQBf5h+fLYuP2QgE7U+6AFiX+T7wUF6u46KSVuWUklrj6lFX0IZy1f/U
         ofiSX5accWYzaxTcJGYdbv4y/PnrWu/iysD//LmhPGBZ7RUKEqPt6I11bForkFx7rtNO
         GWvwKsQjHlVoWTsAmvHL4NZjsRNScenyNCcjssqobupakshAax8xZ+5EUYe21j1yZWaW
         k2uw==
X-Forwarded-Encrypted: i=1; AJvYcCUYEcrjLHT/ot3OGadxB5eWhkWKtUCjrvpaOlQdmtJCKZMJo0rumbO7s1bU1IA9LOL+JK/Zd66AWBUMUQ==@vger.kernel.org, AJvYcCVAJntV1nmdBfDoAb5ajLlt9VnU0CQmIQFhF2rzrCeS+Y5SHLecVT7VxU3X3GNvLHm2DRlMD8VeLEe8FNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/10h0CWGeKcKbQC9TRztJ+6GfyezQXnvrO7dTDQYXH4A2kyRK
	8jMI9otOuhqhpALP8di2wqV6KTvsAYYVRvaqROZWaEMvc+rBCRR/
X-Google-Smtp-Source: AGHT+IH7TNSZveAqC65bkebWCC7FHOuBiFSYW53Nym3R2L/efZPBhA72yqf+9hYNzgHlNZhCGxlkeQ==
X-Received: by 2002:a17:90a:ce96:b0:2d8:f515:3169 with SMTP id 98e67ed59e1d1-2e1e620ea68mr9386754a91.6.1728220428835;
        Sun, 06 Oct 2024 06:13:48 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:230:2966:38a7:3af4:46b4:a902])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e83ca284sm5117215a91.11.2024.10.06.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 06:13:48 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: pavel@ucw.cz,
	lee@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
Date: Sun,  6 Oct 2024 18:43:37 +0530
Message-Id: <20241006131337.48442-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
to resolve the following warning:
drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
error: uninitialized symbol 'ret'.
Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
access.

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 10a0b5b45..87805c21e 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
 	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
 	struct mt6370_priv *priv = led->priv;
 	struct mc_subled *subled;
-	int i, ret;
+	int i, ret = 0;
 
 	mutex_lock(&led->priv->lock);
 
-- 
2.34.1


