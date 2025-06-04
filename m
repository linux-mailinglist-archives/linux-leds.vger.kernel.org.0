Return-Path: <linux-leds+bounces-4742-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90052ACE719
	for <lists+linux-leds@lfdr.de>; Thu,  5 Jun 2025 01:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AA613A9827
	for <lists+linux-leds@lfdr.de>; Wed,  4 Jun 2025 23:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632A222068F;
	Wed,  4 Jun 2025 23:16:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF449659;
	Wed,  4 Jun 2025 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078981; cv=none; b=igSz9qITS+ow3qs7iSadW2czA5k/XKy1NL+XzkxaWDUuz5DzbGiIdfPE/iQEX/RCYX5vm21i3FCY3OQfKMpJRRiO88LUs3EQr3VnawVA0cyW2DQBHo1/fCuVawqMW6ka9znJc5NZltFa9PzCb+gat5imopBD9Wqq9GkoC4n8ktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078981; c=relaxed/simple;
	bh=xDdN81P97Meu5mnJjUgkvSRGBaKxGpzdQ3fbYtSbGsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY4R0hh1KPXqbROalTAaZecixNRDPPECYrLb8AFCssCkbVke8e3K1HwhK9BDSob3lP8DKW14skObnL5B+wSoYxAyOw7nO/ZEjpOlRgaUaaMeJYEF76hoiJcWDAs9IjkA5JBWG6cYOCX9jZGq+o7+/gyNJVDpdwMtE5d6sLHlk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bCNk45gwHz9t5Y;
	Thu,  5 Jun 2025 01:16:12 +0200 (CEST)
Message-ID: <7dfa4866-038e-4c38-843a-9d91afd5c333@timmermann.space>
Date: Thu, 5 Jun 2025 01:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: [PATCH v3 0/2] Follow-Up: Support for Osram as3668 LED driver
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250604225838.102910-1-linux@timmermann.space>
Content-Language: en-US, de-DE
From: Lukas Timmermann <linux@timmermann.space>
In-Reply-To: <20250604225838.102910-1-linux@timmermann.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I forgot to include the changelog in my previous patch cover letter 
(https://lore.kernel.org/linux-leds/20250604225838.102910-1-linux@timmermann.space/T/#t). 
Here is the changelog:

Changes in v3:
- Fixed an extra whitespace in the dt bindings documentation.
- Sent patch to all related lists and maintainers.
- Link to v2: 
https://lore.kernel.org/lkml/20250531120715.302870-4-linux@timmermann.space/
Changes in v2:
- Fixed reading led subnodes in dt incorrectly, which caused wrong 
numbering and a segfault when removing the driver module
- Fixed calling of_property_read_u8 with an int, causing a compiler error
- Added more error checking during writes to the i2c bus
- Link to v1: 
https://lore.kernel.org/linux-leds/20250530184219.78085-3-linux@timmermann.space/

Please let me know if any further details are needed.

Thanks!
Lukas Timmermann

Am 05.06.25 um 00:58 schrieb Lukas Timmermann:
> This patch adds basic support for the as3668 driver IC via I2C interface.
> The IC is capable of driving four individual LEDs up to 25.5mA per
> channel. Hardware blinking would be theoretically possible, but this chip
> only supports a few set on/off-delays which makes using that feature
> unfeasable, therefore my driver doesn't offer that capability.
> It's intended applications is in mobile devices such as phones,
> tablets and cameras. This driver was tested and is working on
> a samsung-manta which is running postmarketOS with a near mainline kernel.
> 
> This is v3 of the patch series adding support for the as3668 LED driver.
> I am sending v3 because I discovered major issues in v1 that required
> correction before review and made some fixes in my workflow during v2.
> 
> Please note: This is my first suggested patch to the kernel.
> checkpatch.pl runs without warnings or errors.
> I've read the docs in regards to the led subsystem,
> coding style and submission of patches,
> but I'm still a bit unsure about the general workflow.
> 
> I will try my best.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> 
> Lukas Timmermann (2):
>    leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
>    dt-bindings: leds: Add new as3668 support
> 
>   .../devicetree/bindings/leds/leds-as3668.yaml |  76 +++++++
>   MAINTAINERS                                   |   6 +
>   drivers/leds/Kconfig                          |  14 ++
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-as3668.c                    | 196 ++++++++++++++++++
>   5 files changed, 293 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-as3668.yaml
>   create mode 100644 drivers/leds/leds-as3668.c
> 


