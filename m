Return-Path: <linux-leds+bounces-2575-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F19699F0
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20E82812C5
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91E517C9B3;
	Tue,  3 Sep 2024 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTGKq8Jo"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937EF2904
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358776; cv=none; b=Vm6erZO4fobmM1Hz/23l1Rbd+mH39412d5XkWE8N6/yG/WUoirP3ryCxHktKerzTcoZIOJL37pox7jqNkIS1/bPDftW9gsltx73/eThwB7Xu9Q27rhXlK+rpAhRqdt3bi3nJxNBXLPeWSsRtphyh4YrWoX5UWbtaKS2yMuSv//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358776; c=relaxed/simple;
	bh=zOl5UJC+OXlvlIIJzVEwApk7WtJxOv98Ox7oX7DxnF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nhBwyXwiyUtdbAdmLJutVJ4Ap9AaNQIg08W+VzahFJZSdkrKr67gXLxUMew4UJXT87g824koT7CvSi+PFP4WHFH7xNSqMBh23D/q+bA6bxd+TTzkSmdWGXsTZ1wd2Rnlc9gpJf4wQ6/L1MwrfopkNWcupXOMoE3MRub66HcEjVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTGKq8Jo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7637EC4CEC4;
	Tue,  3 Sep 2024 10:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358776;
	bh=zOl5UJC+OXlvlIIJzVEwApk7WtJxOv98Ox7oX7DxnF4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=LTGKq8JoP+YyyTcGlGu61iCZW9Yeoldxa8gQzwxkCw6JENEFy9e5uhFydCRZ7lYOD
	 R+ortx9yNk8Onace9hrQ7gz+q2zJetkfhyaeK+DHDMsj5RkOOZKWkt0VZkR2yzdlVd
	 gR4KuUFmN35APHoQJoKrrEzg9nxHY3aN2xUo680oIXf59gsSl6QEtaxRbNll/WVRbz
	 r6SPSuVwBAmP81b1AVfiZji6x2L9yVM7hbKwrRfkjEwyDFz3LOGlNO4CAIryyWRk5M
	 3YUgjCni0nvuxa9iiIK0mV5S1eBJEJ424hrGoqeTGrloJDmhqoO7urS+dVzmxs4SQV
	 mfiSOs23BNbBQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 00/11] Turris Omnia LED driver changes
Date: Tue,  3 Sep 2024 12:19:19 +0200
Message-ID: <20240903101930.16251-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Lee,

this is v2 of Turris Omnia LED driver changes.
v1 can be found at
  https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/

This series is for 6.12, but it depends on changes that have been
merged to 6.11-rc3. Your for-leds-next branch is based on 6.11-rc1, so
it won't apply there.

Changes since v1:
- patch 2 does away also with i2c_master_send() call, in favor of
  omnia_cmd_write()
- patch 5 was rewritten to not use devm_device_add_group() anymore,
  since this function was deprecated. Instead, the sysfs_put() call for
  the "brightness" node is done the first time the IRQ handler is
  called, instead of driver probe.
- the changes were done with 100 columns limit in mind
- added 3 more "cosmetic" patches

Marek

Marek Behún (11):
  turris-omnia-mcu-interface.h: Move command execution function to
    global header
  leds: turris-omnia: Use command execution functions from the MCU
    driver
  turris-omnia-mcu-interface.h: Add LED commands related definitions to
    global header
  leds: turris-omnia: Use global header for MCU command definitions
  leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
  platform: cznic: turris-omnia-mcu: Inform about missing LED panel
    brightness change interrupt feature
  leds: turris-omnia: Inform about missing LED gamma correction feature
    in the MCU driver
  leds: turris-omnia: Use dev_err_probe() where appropriate
  leds: turris-omnia: Use uppercase first letter in all comments
  leds: turris-omnia: Use 100 columns in the rest of the code
  ARM: dts: turris-omnia: Add global LED brightness change interrupt

 .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
 drivers/leds/leds-turris-omnia.c              | 283 +++++++-----------
 .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
 drivers/platform/cznic/turris-omnia-mcu.h     | 130 --------
 include/linux/turris-omnia-mcu-interface.h    | 148 ++++++++-
 5 files changed, 257 insertions(+), 308 deletions(-)

-- 
2.44.2


