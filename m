Return-Path: <linux-leds+bounces-2470-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B62954FCA
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 19:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2152B24E13
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C25D1C68A3;
	Fri, 16 Aug 2024 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcmX9i4V"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F01C232B;
	Fri, 16 Aug 2024 17:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828369; cv=none; b=unhdPFTi8i+hCQuaGgzSCIT1ERgrDolMJAeQ+u7KPR2CicaIN6pTcBFPirbomyAjqLyf6LKBkkLvN4C4WXCQza2eIopTseY4WOW5dlneSEFhgcxg+IkVRIS2+y+0NbZPtKUc1S2bI9XfeaITLy7akaAoSP+5CrSyw/RPWQvHotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828369; c=relaxed/simple;
	bh=BJbAOhfmR88tLFChbQZVoqdcx/W/pQUrC9UyjkKSkb4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LKyXRyK76rTaD4bNRXOZi24W8irPhM4KG9tiwfYHN210pyZ8Hp26YAQb7/7kM/uBOFjpxxyZLtIJsH8EDrN/KRGHVVS6oVQBt4VWcNdpd3Cu3/zpvY/ht0HWULktvdAaO75Ter4q2yEuSzjJjAAP1WNGRGtkOte31eCWfMQ6S/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcmX9i4V; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-710e39961f4so1637691b3a.3;
        Fri, 16 Aug 2024 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723828367; x=1724433167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=gcmX9i4VWsQHnwwqBYhwh/2dobUpeSQgxxiGByaV2XySJvOUMSIriP057yF3HRhgKZ
         0VwS8bQgzRc5v1iPsgsW1bCamSGIBE/FkBg8S/DskmcQyEk53PIrjkGzGaWGUGQ8fmLH
         TKveqoPC5lj/iIoXwwLzgnUmFCb/puAliG2K7VvmKZznUB4SZ+qirqoFxfcWoT1tW4WE
         0G1H/TnoOCXVv3P4divU7zzm8eDe+lp8tdnNvslpGb7e7c75qw/vPNALBd4oS/erKf3E
         joijdOzqBuoySWtEN31lgimfuqAQueRdGHN83w+DGdADzSLBxjrw22FOMSualBbqacjD
         rbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723828367; x=1724433167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdy9zSqWjuC2tMQ6qbmA2POy13/um9sPqP+u934ObRk=;
        b=lEs5DvU2EOKVR0cHfUMMEpZvwr9/fvAykzeyv6l3gaC/FWQdXF6g+Vav/GO+GS3lsp
         lhXSvDou8X/A91BDqqjJlB+bnv8+VdK+3ZI9n01uyxq+wCW6Hm2KcwkaAUN61640TakY
         wJTNtSJ+y/uiJ77RcrEl8Ok5iQEMhKeiU5dZthJ4EPWha2hUyaXT1PAFBbcNeSvI7Ps2
         Iq58LJ1YVeJqhXWs0nsrDMLwJsTGOCiz0NSSQTUC8NiRK8jlrS9pU4aWTXCZlISz5qBl
         5Es8ZBSxSHUFF4s//Sn9TbP6O1zXAxmLL0RFJH+noTuIDJ/B3jvhX1lHHtUcmoYB2LMr
         aZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVKjUmM339wn/xjDsKf4WIb+niGC78iszYdOy20KZieWN7N8RCwoXDV1EpFFNKO7dZDkegZqupzDqsfJd5JO66eeckra6RzM8nILWCi
X-Gm-Message-State: AOJu0YwvZmIYJTE8J+E1WpC6v9zZWjEcMgZ3kwZkus8eJiAz4NXwRyoz
	DOFfGdpk7Yu1EVy2G6dgR1eeFaQGLl9hS5pLfWOETf4BUJClUE2I
X-Google-Smtp-Source: AGHT+IGksQuXa1bgiFvGegX5wQp8wdValbEh0BdyCcOBVJ1wMLE2USqtsc8QY2Gh0jFU6u6YMS+NPw==
X-Received: by 2002:a05:6a20:6f8a:b0:1c6:a83c:d5db with SMTP id adf61e73a8af0-1c904fb49b2mr4408239637.31.1723828366480;
        Fri, 16 Aug 2024 10:12:46 -0700 (PDT)
Received: from embed-PC.. ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add3ea3sm2955952b3a.16.2024.08.16.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 10:12:45 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
Date: Fri, 16 Aug 2024 22:41:29 +0530
Message-Id: <20240816171129.6411-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
to address the checkpatch.pl warning. msleep() for such short delay
can lead to inaccurate sleep times. Switch to usleep_range()
provide more precise delay.

Fix the following warning from checkpatch.pl:

WARNING: msleep < 20ms can sleep for up to 20ms;
see Documentation/timers/timers-howto.rst
+		msleep(1);

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/leds/leds-sun50i-a100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-sun50i-a100.c b/drivers/leds/leds-sun50i-a100.c
index 119eff9471f0..4c468d487486 100644
--- a/drivers/leds/leds-sun50i-a100.c
+++ b/drivers/leds/leds-sun50i-a100.c
@@ -368,7 +368,7 @@ static int sun50i_a100_ledc_suspend(struct device *dev)
 		if (!xfer_active)
 			break;

-		msleep(1);
+		usleep_range(1000, 1100);
 	}

 	clk_disable_unprepare(priv->mod_clk);
--
2.34.1


