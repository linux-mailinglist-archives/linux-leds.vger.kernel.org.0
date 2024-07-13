Return-Path: <linux-leds+bounces-2278-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7206930668
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jul 2024 18:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29588B21812
	for <lists+linux-leds@lfdr.de>; Sat, 13 Jul 2024 16:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FBD13BC0E;
	Sat, 13 Jul 2024 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaDCh1zs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C409C1E507;
	Sat, 13 Jul 2024 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720888533; cv=none; b=HLydczJSez5JMV4d7f18OKubH6ju/SIrDZ7ghvu9KiylJJ5FOjnlEOl/S8bcwU0vh1C4np4bRCrofW+GF2EuIKW5CgENM34DptZN5qbqxPTVVfI+1rCdKTTbfr7A/jmYj0AZHYaxwthzg4h/bsRn6XO7/wxwwexwypQIlCpHZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720888533; c=relaxed/simple;
	bh=Gd3IneYqf04MaRo7Ssmcq0qpHfcEl/tbrCJgGq/2e0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NVKEcUMOscbcOQaXRAj4hTU6qKhFeAn/JvRmc2MzbVjB75ej+XtuFbpNAtBNdyRY+rSuUQQ6HtH4RxkJ2skd0LXHNC1VoFyQ1xLEzOnBjhlBeiDJY/B2UP1B3bCpKSSVOhxu6Yz/3jkg8oaPcI4uk05UdEQ1JiaCJq2lBxfV0Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaDCh1zs; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso30070821fa.3;
        Sat, 13 Jul 2024 09:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720888529; x=1721493329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/3nR4der/vxlRqDW7m9SsLUqgipW3siIAQy0+M0Z0M=;
        b=MaDCh1zs1Z+WpNa3BKvbWRXJjjtshjLSiI2tm07jX87FFlKOU1Z/QSDy3uD0JewQc/
         OWqmbhA4wtthaL0vdWf1QRD9y62hJwQGIX7vW041AQUjDlMyFnF9kbeqU/cku4HeXrKh
         MCtu7l7Zow9Cn5awTJ1s4ZgDNNi74tWSLn96U3+vChgGuB4GSWChFA7TF7syOPusPbVz
         CG/e5TeAfZdLeD2yno0XOtWqV2S8x93HnPZDLtnFVrxXoELuqICGFTHc2ffjZoax2LHN
         lCMjfx2QNLaqYVWx2iOGoDwkzfXCCeitKh97qAkDdCIy7NNSQJ1KMD0H5Y225cKFZv4B
         YXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720888529; x=1721493329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/3nR4der/vxlRqDW7m9SsLUqgipW3siIAQy0+M0Z0M=;
        b=mN80uobD/bumrqQ/BxHEzKSxZC7gG2QcfguQgI3RW+3qiFcUEc8F3PZcrZLxhLcfFs
         5eB4IxZA7F9E0+qYDDJt8MtWbX8UiLHXzR+TLCCtl/ag4Sgskmny40jQpB0zQBYUPVEG
         Mw0H1cvyQ4eFcH59t2gWajVuTewQeMk1goykR1fQbyFA4W9IEa48DvgEYbQCBwdUDZEO
         FEkBmcq6DsDfjkxDSZFmFUA0GN7Wt3LhoAq83sXkSJKgx2UcHwToU65ukhP77BNfgErN
         tNv+ytnDTAowI3R+tZoQdR15EQMEuyHZlO0DVAB4kDgpDcdHwKQf/W/Qvv3l/9oSpbPW
         8RRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJDqgmDui92xtILOdduH9F/ugejf3P4WS2fbrh1UxR+4fjQpkjPO2C6Z4+h0RA3NOfFOrJGzYLtSey4aCFDcs4oYbhYkro13WDhosIuEBEapyXBw83MNKegm38x4HT3Rbz6829lPH13PId2yq36G114242fRGnTgMfwiOn1w1aKtX7FcIHlPOM+AQTNV6fsMrP/iBgsLM7mL6QXLmPYL65W2YdrwlEl9x+nA==
X-Gm-Message-State: AOJu0Yx/sba3Phk5kVBRqQUeYDmMpHPtgAWdC9cSCTlt6BcXNFqSL6eY
	ZqRW2dKi2IR/ilGCUpQsM8mFBr7mKV/zIhHp+pDpmvqTsPlK2SIc
X-Google-Smtp-Source: AGHT+IHp7YhShN+wlqKduKSeFSQWJgeyuMGHWcrkDZQoTNzmSsgIZYb4F6zmqODAtHkYbNxN2iLEwg==
X-Received: by 2002:a2e:b046:0:b0:2ee:83f7:8b32 with SMTP id 38308e7fff4ca-2eeb30dc45amr89959781fa.21.1720888528532;
        Sat, 13 Jul 2024 09:35:28 -0700 (PDT)
Received: from localhost.localdomain ([94.120.81.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b26f62bd9sm953753a12.94.2024.07.13.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 09:35:28 -0700 (PDT)
From: =?UTF-8?q?Mustafa=20Ek=C5=9Fi?= <mustafa.eskieksi@gmail.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: mustafa.eskieksi@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	rishitbansal0@gmail.com,
	bahaku@elrant.team,
	carlosmiguelferreira.2003@gmail.com,
	alviro.iskandar@gnuweeb.org,
	ammarfaizi2@gnuweeb.org,
	bedirhan_kurt22@erdogan.edu.tr
Subject: [PATCH v6] platform/x86: Add wmi driver for Casper Excalibur laptops
Date: Sat, 13 Jul 2024 19:35:20 +0300
Message-ID: <20240713163521.21958-1-mustafa.eskieksi@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, I apologize for the delay. I recently saw Carlos's patch and your
reviews, so I improved my driver according to it and made it ready for
another version.

I didn't include the documentation for the new zoned keyboard backlight
naming since Carlos is going to do that. However, I changed the naming of
corner led because it isn't affected when other zones' brightness changes.
And one last reason to not name it kbd_zoned_backlight is the fact that it
isn't on the keyboard, it's on the two corners of the laptop. I'm still not
sure how to name it, so I named it 'backlight'.
Here's a photo of the laptop: https://imgur.com/a/JEqMiGL

Mustafa Ekşi (1):
  platform/x86: Add wmi driver for Casper Excalibur laptops

 MAINTAINERS                       |   6 +
 drivers/platform/x86/Kconfig      |  14 +
 drivers/platform/x86/Makefile     |   1 +
 drivers/platform/x86/casper-wmi.c | 656 ++++++++++++++++++++++++++++++
 4 files changed, 677 insertions(+)
 create mode 100644 drivers/platform/x86/casper-wmi.c

-- 
2.45.2


