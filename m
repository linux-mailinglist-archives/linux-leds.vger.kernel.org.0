Return-Path: <linux-leds+bounces-2860-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F51988BDA
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B213C1C2128C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AF416F909;
	Fri, 27 Sep 2024 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqN8A9B9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7ED27733;
	Fri, 27 Sep 2024 21:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473099; cv=none; b=Vuh1UFP6e7uw8u6QJN7Vi6vyn1UMiOSmhCbmW+a0XphNP9cjoU/CCTrpOkxpFtrKEiy9RE8q41jHRh4TsIpmKYh22woTkGCIt8lrYBzxhg5vmPeWsxrxkIX04G8Bxo5KYM43bZVnS0KXzyBEj/mTLmKobcZMzIgKU5YZD919sQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473099; c=relaxed/simple;
	bh=3UQZeHfK5/gRkdAT3WZTH2zqHNW/VEXeYje1wlyMW7c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4t90k7MFYble97+fhPHrNOAaAnSRKr0TMtstSIoERSVOVPbbe1Gk8MbtRzprJPamo1zbPHBNW5jOtcCIDWjP9jI8vgpW/Qm4hQMd9YUbzLduAebokaOLA7XwN10V2Qpm0M5CluNWqJoU2s/Q7OLUcrks3cKhpFgHE5Q3+S8LaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqN8A9B9; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f761461150so38698541fa.0;
        Fri, 27 Sep 2024 14:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473096; x=1728077896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLovns2KL8c7D/KfYP9IZ4phHb9upAJmIjj3CCHbk/o=;
        b=XqN8A9B9JA2gDViICMFPydFjdQTbtV6X6NXMcMuTpq03c6BWPFQlmzWecMcZjR+Gie
         1hPb1BuygfUQhpdnQxLdOZqD9lIWaMFAdmCqHpgpviN4WFH4hGjbVZBf8GDwmNi3K4O+
         rCZzbemDMqpIklEkZJYYxGeOd35vre1dmgzXH+5tBiIWFK8LrXZRtcTstjWVKnzMqTCP
         jjuACv5dR0M1MpsaOdK1uRR/AET22+3Ivc+ahtjdGDkg6fmkQjRItUZ/Wciel0fsVSMy
         VY6Ym9NhWUwcbLnsRcsek/WeyOJhTzMr81rJQ/gHQJv+U3tiK2YVtNRQDp3+bBAkCJTy
         nMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473096; x=1728077896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLovns2KL8c7D/KfYP9IZ4phHb9upAJmIjj3CCHbk/o=;
        b=Wtu61fdgrHkH1EC2Iqz2cQ5p9Hkyieei/42IMAfusjoEPKXSsvBTuDERhLC4yfgLEG
         CKKtBNCbm9qjfSc9q8EYJkh0AzgZ0b8rTT6zZR8rkRf5ureXgUf1psx601Har5wVZgJ4
         RHmwzkERzecKWpyZCBX9HcJ+PYztcRFCj4A139s247Rc+p/8FyspoIIlRzqyM7/9a7ol
         duuiXeEdsxInjNvU0vf1rFZUQiiGMyzddLl3p4poIs7GS/Ap0QGkUV75C/YUtZfRhURr
         ISYONKVryxpi2w4ncYkO/HcjYtXvVo3nAZQFrcdzCxf7HZImYVku25PDeWuJKH0mLfDu
         IwHA==
X-Forwarded-Encrypted: i=1; AJvYcCWmWYuM022ubuZMil3UArWMbpgSbljQ/G5n9FzYLPlfjFhDLfK52uX3WlHJNeVnlzZguWCL7dO2FXy4aME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkLAyogXUjJuUy7vbwv2Th5vYfGiNaATiboYL/SIO7mnVZRKG4
	SGS9ew90tl3d1iWhBUTiITuRvYMwd6jkuUqHJdoq9h3hCHmX+1QJ
X-Google-Smtp-Source: AGHT+IFi017WXeQrWtNjLMQtyIiZQitRA4AP6LqRLB2tT4j5IiFL+0AbQNRoAfVQm2zwRmStDDJFlQ==
X-Received: by 2002:a05:651c:2126:b0:2f7:562d:cb6c with SMTP id 38308e7fff4ca-2f9d3e3d2a5mr44986391fa.2.1727473095919;
        Fri, 27 Sep 2024 14:38:15 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:15 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/6] leds: Remove local leds.h where not required
Date: Fri, 27 Sep 2024 23:37:39 +0200
Message-Id: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMl92YC/x2MQQqAIBAAvyJ7TjApzL4SIaJbLYSFSxGEf0+6z
 RxmXmDMhAyjeCHjTUxHqtI2AsLm04qSYnXQSnfKaiN3jOyudDFG9/Mm/WKs8sH0cVBQwzPjQs8
 /neZSPo+2W4dkAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=1718;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=3UQZeHfK5/gRkdAT3WZTH2zqHNW/VEXeYje1wlyMW7c=;
 b=34E4CMKjaRNaKvfM1srxdfPO+whMqRPlZ0SxFcN1CjgQ+fQFIHrzo4AU8zQ3enO23w0+wxGpI
 L/PH2SOpTK9C//g+aYoeIg4g8IRkwjLM7gsM2EfDoA0nr2Q40JKrNPS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

There is a logical tendency to move elements from the local leds.h to
the global one under include/linux/ to make them accessible for users
outside the leds subsystem. On the other hand, some users of the local
header, which also include the global one, do not need to include it
anymore as the elements they required are no longer there.

That has been the case for leds-gpio and leds-pwm, which used to obtain
led_init_default_state_get() from that header. I could not identify the
reason why the rest of affected drivers included leds.h from the
beginning, but I suppose they used to require something that might not
be there anymore, or it was just added "by default". Either way, they
don't require it in their current form.

This series has been validated by building the kernel with both Clang
and GCC without any issues.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (6):
      leds: flash: Remove unused local leds.h
      leds: multicolor: Remove unused local leds.h
      leds: gpio: Remove unused local leds.h
      leds: lp50xx: Remove unused local leds.h
      leds: pwm: Remove unused local leds.h
      leds: turris-omnia: Remove unused local leds.h

 drivers/leds/led-class-flash.c      | 1 -
 drivers/leds/led-class-multicolor.c | 2 --
 drivers/leds/leds-gpio.c            | 2 --
 drivers/leds/leds-lp50xx.c          | 2 --
 drivers/leds/leds-pwm.c             | 1 -
 drivers/leds/leds-turris-omnia.c    | 1 -
 6 files changed, 9 deletions(-)
---
base-commit: 40e0c9d414f57d450e3ad03c12765e797fc3fede
change-id: 20240927-leds_unused_leds_h-af790ac75d80

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


