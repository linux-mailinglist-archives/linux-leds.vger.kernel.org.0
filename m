Return-Path: <linux-leds+bounces-2866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A2988BE6
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E41F31C21890
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6B21B07D3;
	Fri, 27 Sep 2024 21:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFJvlGT8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631E1B07A7;
	Fri, 27 Sep 2024 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473108; cv=none; b=gpLNmodxLW7jxugrCCToRJvprcsk+M55gjd3OWl5rowJDtWX+7iVsVwwsOMnBXX9pJmldk9ImI+jnOllNqL59QBy+cNtnclmEKoikHHr/2UzCMRcZhpdFqNe5klpD1lfGqwreTcAysSLQpiwJDl0iED20zAZFf51Je/WVvDHo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473108; c=relaxed/simple;
	bh=QufH1xxg/E8IioG2o4riVxLCSynj093uASTK1ajoGdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APwv7GDL6P7P1SvQZQN6k7A72Lumfj4oR4pbGH/JL/9dNRxsitr25EwKgWHL+kJwGy81X3pgqFCbDe11g2X3U89GoLfbhhjE95rVusZPd5wAwUycuOanfc3HbHjjGTdoCMnOGPdDtGvTBh2vkkPTtz6lVnnoeiQXxir1v0glITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFJvlGT8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso472362266b.1;
        Fri, 27 Sep 2024 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473105; x=1728077905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWnwm8RblNa7aLdkeV2+jPl5Nar5YevPhQoaza9x0d4=;
        b=kFJvlGT8Ujbj23mYaGtzaxQYyiIBSN9nivc1uxRlUpbjHulAJYpvWbN7Rl5yqN4Yp4
         ZUXu81bSehdIQL+Uf/rxrsIPiZLwks4t1oHWrD7ljlyhRPolsIREEcrZI6vXT3EGnxTi
         FpI2XVkEVtDsiGQjOdsSJjzs7Wey6DLJzwu6RcTIZTnLqh87yXBZOZsg/hB+5vyfN01e
         AVN8J6pZfEhHwEbxQ3dCSwMsDVaGMkR0ngwqnWP/DKyv05wD+5QNiDemkDd8SMq4BMni
         i5sNoKsqTRZRr8sIbK3t47orozdYrXBwYeNEAjzKak2oJYZX7qKz/cDTN/yVyM2vs1vP
         nxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473105; x=1728077905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWnwm8RblNa7aLdkeV2+jPl5Nar5YevPhQoaza9x0d4=;
        b=usX6+yeCWX21WHhwgFSBrlRxoiFJUbpjJW8IgsnB3SDeFZNP5EWIJamMK29L5JZ+Wl
         MSsVUnT1/c6a+Ah/KMXbTOZKZ9xnxZtyXYg2OshRA5q7eHJzCP9C2Q2futXRiNRj6hvZ
         4QjCAdw+na3+dIv9va/NCifgqDO94I80vfQOMjeCz9fjEfnV3NjacvW349sAMuxrXYIt
         o5w3BPeqwyMB8DAdZOY5KWGB8JMLS/sdFsmd1JnOrddxcO4rakxQI+x45rK2q0Szh+Tv
         9uke4J4Bt6j/0CNzTfMfhgg7PDSvRJWyBwM3jpqV+sMe9QFn3KG8B2ZIVnKciiqetoI5
         Ny3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5Cn/m1g+cOa9dtE0QxL+ecHsBen+gY+PeUomyyl11eWgVcLOLe/3vbYyXM6ATlErDKPIXyGOm0c/wJyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwPiiwmMBDVz2jsfDHpF+nhwVOrOQX+52Q8zk/kmQjLse/FY1
	PO9yJdSaan+9vWXP6Uyvz8rvOFI+onDEdLiAGmALv59AV1OWZGd/XQc49sQ8
X-Google-Smtp-Source: AGHT+IHdfDM6R7tkZ+oiDrTeifvU/oMnXiRgg17qNPeWfNC8fTVDrKvpa5JNRStnh0rePDUeOl/drA==
X-Received: by 2002:a17:907:3e86:b0:a8d:2281:94d9 with SMTP id a640c23a62f3a-a93b165e095mr905562266b.23.1727473104547;
        Fri, 27 Sep 2024 14:38:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:45 +0200
Subject: [PATCH 6/6] leds: turris-omnia: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-6-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=637;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=QufH1xxg/E8IioG2o4riVxLCSynj093uASTK1ajoGdI=;
 b=HdMSEXk3ThbdIHd4WAtT6cxocBp7FdSt0AqaIA75ozBtxJpMJkSaC5SNcDF49VkVdENxFo9ix
 PkKgBwxoT9mCiFG4uoOCxZb2rfnseS9KXAUTMIEAX/dt/vrMmmXeagd
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This driver does not require any element from the local leds.h. Drop
unused header.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-turris-omnia.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 4cff8c4b020c..2de825ac08b3 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include "leds.h"
 
 #define OMNIA_BOARD_LEDS	12
 #define OMNIA_LED_NUM_CHANNELS	3

-- 
2.43.0


