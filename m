Return-Path: <linux-leds+bounces-3996-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0008A3AFC6
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 03:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7941891024
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 02:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3975E132122;
	Wed, 19 Feb 2025 02:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="KL7JCiIF"
X-Original-To: linux-leds@vger.kernel.org
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D912862AC;
	Wed, 19 Feb 2025 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739933243; cv=none; b=JoIThteznS/HVIWHc8brMlDPavk7ioetY3HzMLLcOFOeXO6xugT9VqHWTGaoJL03soxabX8zWvPXCvc2B6odqKaECL4nEfnJhx1W0ofHVmJ8rYU25fNPImRcQAgnXKIJqKn2qE+ye1Pfl2+0JQbvbLZv8/nxbHEF+VxRgBl/OBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739933243; c=relaxed/simple;
	bh=2jUcymUQX+U55aj1eHYm4YWW8fcMiJF+Zlc06aTROcI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=oW6TOwdMvJhwQBR7F/uKWoYkXm0PLH2gK5KyimPpqmyvO59d4FXEtyivmgAkxLa5WiwAI7qYmtHukQ5jQkUycuzJRuQyVNw08/O+Eh2LIFXKsmehpRkn+r0EXLNIWoRqasg0glqrWtztVzavK5IkKdO2F0N3J5sfQlZ0aDF+SJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=KL7JCiIF; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1739932925;
	bh=j/DlKSMN+0Gau2QXCxGFQb02s03fvPC0qY57NYcKGeg=;
	h=From:To:Cc:Subject:Date;
	b=KL7JCiIF2upyF19w66GzhmUo2TYxM5hWwnM7/Z1BQmot6lOI/o0Hz0dWIcG7oNDp3
	 ioUBNQP4cmXofL1txlAyWkLgAiXbZH8ercI7tYJmbRsKB6TTLKiqlPV427hiZU3NCA
	 GsShhI4mUhb5D+qLjVa+88oZhP4TqhOdMsx+7Sc8=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id A83B46A3; Wed, 19 Feb 2025 10:42:03 +0800
X-QQ-mid: xmsmtpt1739932923t1kemos6h
Message-ID: <tencent_3DF7518D407679C99C4CCCB1B8E64638700A@qq.com>
X-QQ-XMAILINFO: NwU6Bou9okj/8UgLCzAiFtwOmoGDW4nAhghnmxCmf7HSURIcKRXvkaMUpUNaYN
	 hDhUM3B1vjJ2oFExbiR9HukDUNI0pJmMrKIepU8w/95h7q4D1sc8ovzBiGP6Uaf+kRT/fOSOMzlu
	 LIv9cuUYsg8UYVoyAJy20uR61ukEYbpkOuHoXQkU7zvgOthc/ENkWcRac/7boivQXkdRLUQO+uTz
	 brxFfO5ngwlFjxfdCkNe+neeDUBh1CC6MFJtv6H9hZDWxq0nRAfsbapEbN1nj2j0jNJZ7r3WGhnE
	 32cjnw2YGqNR+uFagm0cxXwagzOfdmpXOOXLKFGFc9gqS130Wx7b5iNfVxUDQh8Q/UrK7ktMFc1d
	 JFtp7xeDqoprKR2VqUzo1gZjfxXiYCpSAztGNeFCy587ooA4Xk1NWBvXaJfE+6M2UvK/kRxtwRqv
	 2A9iIwiK7wWOp8kYCy5yC6XLEG002Jp8GpLg/U2spAJTvKoPz0jjog/ZlyLsajL1BuSS20RWEPjv
	 n934cJ4bePr7HcrRJi3ribsUkWhhrydyrXdQnj8FgET5YwvHm6mPmfBn5009tniWTn0XwJdw++Q9
	 iXpdEg1irq6vQmqo4NP/LFiT4384sMrvxL9XQV0xTnBlIEOYOHeIbm6UaNgFymDKzUj720l3FU8t
	 Zqjbz7OkFUpSCcfKYIa+8Z8nT8gEstzSXAA05nvFnwKSDZHLmJ03N9ET+291xlsDe0I0g60aCLHI
	 mxfMxFQWXWbPADScPWTDMlG3EqXU0c2UZ4YmqrRjpuVsSTKJyI+x3iROhIdX0sErb7sU88dxSm7k
	 bXqe+f0mML9qGskDu+y+o6m9feDQYvzMGnzvmhJmxzFsPSeZuaNW/6d7qoMJe/a03VvMoQVU/HZm
	 kgYnMu8Sr5O/+BIDW7ZUIyGsN+21ogjjBzIas56LZw9VKg7AUG2eyxneTgeiAm6TDrhGD1o+nJ1c
	 jtF+gUrANOYuIYWwrD7aZ971pELWXbT0ga+MpDFf0BHL2oSoa+GA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: xiaopeitux@foxmail.com
To: vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: Refactor st1202_led_set to use !! operator for boolean conversion
Date: Wed, 19 Feb 2025 10:42:02 +0800
X-OQ-MSGID: <0f0dde44621e51c701d1998841967571770a9995.1739932807.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

cocci warnings:
    drivers/leds/leds-st1202.c:194:66-71: WARNING: conversion to bool not
needed here.

st1202_led_set function now uses the !! operator to convert the
enum led_brightness value to a boolean active state, which is then
passed to the st1202_channel_set function. This change maintains the
existing functionality.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502181845.xESVrC61-lkp@intel.com/
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/leds/leds-st1202.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b691c4886993..361c431a03c5 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -189,9 +189,8 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
-	struct st1202_chip *chip = led->chip;
 
-	return st1202_channel_set(chip, led->led_num, value == LED_OFF ? false : true);
+	return st1202_channel_set(led->chip, led->led_num, !!value);
 }
 
 static int st1202_led_pattern_clear(struct led_classdev *ldev)
-- 
2.25.1


