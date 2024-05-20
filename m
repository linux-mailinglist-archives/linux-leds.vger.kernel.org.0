Return-Path: <linux-leds+bounces-1686-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA638C9AE0
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 12:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3065E1F2166C
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2024 10:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCCD4D117;
	Mon, 20 May 2024 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NxI8gI70"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453F210E7;
	Mon, 20 May 2024 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716199276; cv=none; b=iIAJhyReL4G8LOdkYg04uD/4v8pSZvg4ejMKY+fLTeu31MMYj9onPqrHffX2v95IpPbzGAtWr4sNB2JdNlCI2W2jEO+tYyLmaLzCzpFXm87Nki13vs4Nk5GyECxy34nc89tdOdSWqActUZJO1or55fdNSZjouVFEzntmPzDgmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716199276; c=relaxed/simple;
	bh=DNxb9Q+EgsM24VqcBmbvjT6zK7dkJ6oWXCSwdBa6psc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IIl5arceG9zie27rC0Rx0IoSPhMxJZxEXMcGXyFHPThSZsSY3+CMSHQzdOowVCq+jHr/9hEl6WuCwyalbLWbffOm+YEcFbH4h5XozcrRlbXqfzNe/JL3UhHh+RB52rLKIJM4pQ2qbzARYpEbLQhvECdGjkBmuD9+sdse970pQ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NxI8gI70; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716199266;
	bh=DNxb9Q+EgsM24VqcBmbvjT6zK7dkJ6oWXCSwdBa6psc=;
	h=From:Subject:Date:To:Cc:From;
	b=NxI8gI70wT5rB+FkirUCuDK/7TNkudQyluMoi6EII72BnVPs9lBaIDSq3JxwmQYCc
	 cke9sO4A87eYmMhyfcgPnDjVRLzLcL1PkiatGs00ZUcfQeCRYiddhRMv8hSsutfRhM
	 qP7jVh6o2g5ydHSGiiqZjj3vUeYJIVuH7LcPcNiA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] ChromeOS Embedded Controller LED driver
Date: Mon, 20 May 2024 12:00:28 +0200
Message-Id: <20240520-cros_ec-led-v1-0-4068fc5c051a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADwfS2YC/x3MQQqAIBRF0a3IHyek1sC2EhGir/oQGgoRhHtPG
 p7BvS8VZEahSbyUcXPhFBtUJ8gfLu6QHJpJ93roR2Wlz6ms8PJEkAab0wOMtQrUiitj4+e/zUu
 tH1U/JexdAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716199265; l=1387;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DNxb9Q+EgsM24VqcBmbvjT6zK7dkJ6oWXCSwdBa6psc=;
 b=J0Us/FA3Xq6fffueC/im/YnLftY6uXVXMSfvKnGOl9iiBZNcpWqN4SyC6E1g0nPlzFUAL19nn
 09oTf2LcWugDniJFmuUaEBTWBgB9PxW5fDmp/aZ3x/7RL9eE8oYB3/X
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Add a LED driver that supports the LED devices exposed by the
ChromeOS Embedded Controller.

Patch 1-3 add a utility function to the led subsystem.
Patch 4 introduces the actual driver.
Patch 5 registers the driver through the cros_ec mfd devices.

Currently the driver introduces some non-standard LED functions.
(See "cros_ec_led_functions")

Tested on a Framework 13 AMD, Firmware 3.05.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      leds: introduce led_color_name function
      leds: multicolor: use led_color_name function
      leds: unexport led_colors array
      leds: add ChromeOS EC driver
      mfd: cros_ec: Register LED subdevice

 MAINTAINERS                         |   5 +
 drivers/leds/Kconfig                |  15 ++
 drivers/leds/Makefile               |   1 +
 drivers/leds/led-class-multicolor.c |   2 +-
 drivers/leds/led-core.c             |  12 +-
 drivers/leds/leds-cros_ec.c         | 299 ++++++++++++++++++++++++++++++++++++
 drivers/leds/leds.h                 |   1 -
 drivers/mfd/cros_ec_dev.c           |   9 ++
 include/linux/leds.h                |  10 ++
 9 files changed, 350 insertions(+), 4 deletions(-)
---
base-commit: eb6a9339efeb6f3d2b5c86fdf2382cdc293eca2c
change-id: 20240519-cros_ec-led-3efa24e3991e

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


