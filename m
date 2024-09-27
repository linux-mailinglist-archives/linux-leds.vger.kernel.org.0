Return-Path: <linux-leds+bounces-2863-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AE988BE0
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C83471C21379
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12161A2545;
	Fri, 27 Sep 2024 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwpHLF1L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71918A92F;
	Fri, 27 Sep 2024 21:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473103; cv=none; b=gPrUM7Wb7F5PAqrMjYmBWzDzCOVU32KD2giAWnEBFj3+BroD0q2rATluo4xDQU7D6xfwxOfjgYK81D6XEmXYc6/V7ZJ2NefKwZSztgLGIAhRbBqHI/2ZiG2i5eWK8gNBKBGui1SJxAMJhGvDTL7AIK94v6GqU8P2wgnXONTgPug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473103; c=relaxed/simple;
	bh=9uJ8SHTbTZ7XC+DRyBI/O8OtFz55iwKf6d5eETE7Zgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfBeGgEsG1DCpvWeHYI7RT/dEn2iJMqVrn26B46g7KUak/g3dprRp76l+OFePXm/P4J1w+003TNGyoveD4ilCNC4xPgc5XnA9XV5db8rZILi3OU3fVXH6yY1yix+iMVuBerCrGL69oN8H12OXEEsYNVwnHkPdPbsa+X66zJOWc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwpHLF1L; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a843bef98so330580266b.2;
        Fri, 27 Sep 2024 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473100; x=1728077900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImW9O1E1jH5Wo9Bs/Ji49hZnCSt5ZWPKHtoHPYW2B1Y=;
        b=hwpHLF1L21jGAX6bXssZHottIvSah5npzV8Y6sP/7V5Em3FOFpabZgSrVk03uR6r9V
         1Rwnrh2hfgensLEzRbpRSMIG4LhjQia16Koy1JTg6AeHz2KB2CaIjGz18TNjYKTvf+iI
         5w/uKXbbrSlaSnU5twKTQfvt8LbLIAd+WOzNryEAxWeCZ3uGglm9rypfOlPY2V/iCaCO
         Um9jAjN4w/rTQSfXHPUwQxHyG1+lajM2txNSEErG9Nqj1FRs7IzNx0XMJmKqEsgLkhoJ
         MQbISW0IfSv/VUxOgjU5nuQEMZvqPP9zEKcEIRvjjWntoYg8X6oEEV2EoJw0MAKDFEuY
         DMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473100; x=1728077900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImW9O1E1jH5Wo9Bs/Ji49hZnCSt5ZWPKHtoHPYW2B1Y=;
        b=UrCF4anKPvZZHITGPdsMbNnKAxrNUmljbLxBx1rmmzUbjozI0ct1FkoM3GZpQnEDXa
         TxwxOW4B0B3MR1OsLDhpox+e+bsI3JxgaH++oVcw+bpYRFPcXtoRB2HYXeumZ8yWHxe1
         QaTfZQkAxRF1jz3t3b5QVpEic+3QPx71CuHpurdpEm5kAaOmkORtQCOh/nVW41inxhdO
         7RSFM/AjnlUwN7eqAljidnEbv/zW1ZPKY9HEaMnWF9JrVnSQdBgsq0nuzLwBwTCU+l1s
         35lQjUeQ0ZJGHkMenLE9iKrsE8wqHJvZ9u5pE3mtHmNupJZYmqpLmIoiDnxzcyQTm4Dp
         zanw==
X-Forwarded-Encrypted: i=1; AJvYcCU+caB9sZrB5tNX5TCLD3k4ptFv34uY2fdHvwpb3OR3gTpqokpj3NSt4ttL+o9mjytdqSIxy7aT6LXBr6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YySuD00uT0kpnULf61UbzN2N/LL8e0AeHfAO1l9fBILPenAQlez
	sQ6Ersv0T8pHMp/JL6+Vy9U0h09OG9K9PR+uFCsPhIQNwu5cZUmX
X-Google-Smtp-Source: AGHT+IHIKFJ24JX1RS5dv/HVKZicIUoSC3Qq0ExHFcid4yoc6FQnBQvo56RBIrlghf4xKkyUy93xAw==
X-Received: by 2002:a17:907:8692:b0:a8d:44a5:1c2f with SMTP id a640c23a62f3a-a93c48f089bmr396325666b.6.1727473100079;
        Fri, 27 Sep 2024 14:38:20 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:42 +0200
Subject: [PATCH 3/6] leds: gpio: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-3-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=751;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=9uJ8SHTbTZ7XC+DRyBI/O8OtFz55iwKf6d5eETE7Zgk=;
 b=ekzgrQiI15ewtW4fskpgpM0g5mzZGtvX9qB0K3M3unUnRai8mcCZxrF8cyMjJhSLr4KldkeNu
 yZPQ2+ZWFctDaVv9fgPVHYc2poOBpp7Y37srPFG1YVP08mV+rGxJ5BY
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit 156a5bb89ca6 ("leds: Move led_init_default_state_get() to the
global header") moved the only element leds-gpio required from the local
leds.h to its global counterpart. Drop the inclusion of the local leds.h
as it is no longer used.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 4d1612d557c8..3ccde6a5780a 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -21,8 +21,6 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
-#include "leds.h"
-
 struct gpio_led_data {
 	struct led_classdev cdev;
 	struct gpio_desc *gpiod;

-- 
2.43.0


