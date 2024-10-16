Return-Path: <linux-leds+bounces-3106-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2379A0018
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 06:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 956911F2553B
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 04:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C91817C210;
	Wed, 16 Oct 2024 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdJerczv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649321E3BF;
	Wed, 16 Oct 2024 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729052587; cv=none; b=kaBoENfH7QYW0TvtaJddZO8i7tpGlKoEv17ZOKi/+PozasHJkLf7MZasV88SLZiKScwOBIgDxiRV/KVJQfRQ7E8areow8K/BAHkII2ayVDtrc8l0CXTYpA4zvOWAyUfYeVN4wH5/yzn1b5tiHREKDp8k1ziiqpNB91IWP1cAvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729052587; c=relaxed/simple;
	bh=PDZSBTmMWo9b2kbSmMjE8hqFjfWQA2TYq8R1eBX3HW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHZS1+trsAc5lgjetxueq09iFQE9TZo5jDY5IfK9ufNWDkkDe7y00m2q6DzhxfoNczZGlgNS1S67bs4x0XAVIHICrIqridfMkDMv5AXVY7EALyXKXRgKx3AB1xLzcdegdCWVhjXVQOViI5NEDGF6QeTr150HjSnMtrm/DyLsIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdJerczv; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e4e481692so3595610b3a.1;
        Tue, 15 Oct 2024 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729052585; x=1729657385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmOBl26ejau5/esp+8BV+SXFKf70pqYfUEKz4LKsJpY=;
        b=XdJerczvtyBs494uziGwMss0fnPQdygzGPY8OAW9bCRpIYDDIVheYV90nErSIb5XYd
         dG4qqpm7Cb8/aFmZWlAt6bJkbsdE0hblpTZF2i+XRUEKKcxDVfKtADgoCwKLZziuEkrR
         3GGNjOJsaPDkNeyQZ1qJFmvwGDvS9xSS6KNgKvD6Y7zADOh7LhOuZKGNBNTTVkCUYJY8
         BuxMKvws19lo7jtnQWro/iTfIOnG90SFzWleSiuQc/aZK0e/xBYL+CE4Mv6IbcZX7Lpz
         OPVVXqXtF0yOoCP/jMNU4HtCKnK+DbAJnDb2AkRu2vp+GiAetqYi1ck+FMgwnwKS4uOB
         V7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729052585; x=1729657385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmOBl26ejau5/esp+8BV+SXFKf70pqYfUEKz4LKsJpY=;
        b=YqffFblIwyM/0wpxCtVpyrfYr3QzF6HXg6/XNajTXufxm6y4oGM2DpW3ZxlqzPMP8z
         d7J/MYmaGKyRigQGrDkEz/0wKJa27d/7zfSGDi/xBpmsSeNPybz2tkfsKe/zwZfXi3vj
         Gc4wG/OXO7FBMn2SUPgbJOYwcjP9DFYFkOuLNqXE1ZsQmpsS2ckY2Hp27J8VGrM4a5by
         W02TGkLrxAPV5hfn6rCH0PhEFhWFyk5OkZ9W5N1QTwt07b30BmKY61e+L3giYK5QwC4V
         fgOL7jELXDiS0sTv5H35SsrB+1lVqJpvUOqI7vHdXGYP540lzH66uu8WB8hPWOaDAanX
         kLXw==
X-Forwarded-Encrypted: i=1; AJvYcCWFyWYa2ps5vhhvIMZ24X9Y9J2m4HfZ0I7dXY87Hnq4Q8CwK8f6ymQO+AnLOKTbQITp3+VmFddfk+sdiQ==@vger.kernel.org, AJvYcCXnkzfwdLYKlCGNKUR1N6zBhqn53lD7/433nmYkT4R4Iv6AGjiShj3WnBaGOsDGw/UQzcabKoM1qNywxyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYrepdANVCVgRzs8u/HtSf2hKCEvYhM8+necq9s/g8bKSKufw
	F/TztPUfWN0gY8uA08BfHFz2ec4O/GXXdOID5K6+GnKH1lIyroMp
X-Google-Smtp-Source: AGHT+IGyfYPslhJwRcAU6liAsqT25zSnwSsDE6zYG2noVYjDGvopXZPINLehXxi+3oijkmz8hoSnpg==
X-Received: by 2002:a05:6a00:181d:b0:71e:104d:6316 with SMTP id d2e1a72fcca58-71e4c1bfb5cmr21039998b3a.21.1729052584819;
        Tue, 15 Oct 2024 21:23:04 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:11a6:bd6f:94e5:e911:e544:8911])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2f2asm2175122b3a.51.2024.10.15.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 21:23:04 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: lee@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	pavel@ucw.cz,
	surajsonawane0215@gmail.com
Subject: [PATCH v2] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
Date: Wed, 16 Oct 2024 09:51:42 +0530
Message-Id: <20241016042142.8088-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015085842.GC8348@google.com>
References: <20241015085842.GC8348@google.com>
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

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
V1 : https://lore.kernel.org/linux-arm-kernel/83572cde-19a1-4089-b02b-361a8ef40bee@gmail.com/T/
V2 : Updated .gitconfig to use the real name "Suraj Sonawane" as per the feedback.

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


