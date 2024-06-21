Return-Path: <linux-leds+bounces-2100-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570F9122CD
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 12:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486701F22873
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2024 10:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A61D171E45;
	Fri, 21 Jun 2024 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5OohLDO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273C16DEC9;
	Fri, 21 Jun 2024 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718967033; cv=none; b=X7/LBoLKxdxIyyYjJ0DZKZFmuBfANYYLlY95hzxRpeOCEYk+WZvNzcDxIc5/MbqErh79aCFd6azBnBVd7b7vj2dO7BxLXl+8+aRAY7jQ0sC/NX1AkKg9tHwrWf224u+xXMn43DfgkQf1BOkFba+pmvq6lySeiosyDuPVDkNjZ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718967033; c=relaxed/simple;
	bh=Ln8MyAJWRJjptYur48wslT3ztlJphKnLLSWFVYX0roM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ScXFT2SI1sVrROjr65CztiA0y52jCVyTbAReEySLi4ZjWJ+74bhDMsaijewV4s0wkNaTbdMIUAdvnI5ZKomilDqga3aescnpv3QoKGu1U3diRzjM5rYvGDp9XLjxTNC++1ybBw7dMOnKoX7EGix62i55WbhvYF5GYIkrRKNJzkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5OohLDO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82571C2BBFC;
	Fri, 21 Jun 2024 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718967032;
	bh=Ln8MyAJWRJjptYur48wslT3ztlJphKnLLSWFVYX0roM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5OohLDO6TTY7DUQNYpPw0pRZN9qPTMb0x6AiYXo3c9xhrxzct72y1FDgmRRkzTom
	 j0cg9xSYfkRwfGY1kQdG+wvoO+xWC/kU8CIZgLcfFbbEPZaf6zWQMLH9iAuPX2kZfC
	 hX8ev6bNZOYi2rwD55wXYHeN2KKljoI4xHUG7DPVmSGknD3x9hKhFyBioONT7wawFk
	 vpTcDrvRMnYFlnonXCAtklfWNeJTgJykhAd1QhgrEmRpacP4YkFH0B3x5zamJYKOkA
	 Vg0bxDuvDwuSolhWkjnWRu2wXxUKf5GS5zNPFzuq7gXStbu+fusftDf3l1LFiEC14v
	 goaVSMYqlYNlA==
Date: Fri, 21 Jun 2024 11:50:27 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Pavel Machek <pavel@ucw.cz>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [GIT PULL] Immutable branch between LEDS and MFD due for the v6.11
 merge window
Message-ID: <20240621105027.GM1318296@google.com>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>

Enjoy!

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/ib-leds-mfd-v6.11

for you to fetch changes up to b107093f433c3afb83a46af43c830e578e2ba54d:

  mfd: cros_ec: Register LED subdevice (2024-06-21 11:41:51 +0100)

----------------------------------------------------------------
Immutable branch between LEDS and MFD due for the v6.11 merge window

----------------------------------------------------------------
Thomas Weißschuh (5):
      leds: core: Introduce led_get_color_name() function
      leds: multicolor: Use led_get_color_name() function
      leds: core: Unexport led_colors[] array
      leds: Add ChromeOS EC driver
      mfd: cros_ec: Register LED subdevice

 MAINTAINERS                         |   5 +
 drivers/leds/Kconfig                |  15 ++
 drivers/leds/Makefile               |   1 +
 drivers/leds/led-class-multicolor.c |   2 +-
 drivers/leds/led-core.c             |  12 +-
 drivers/leds/leds-cros_ec.c         | 277 ++++++++++++++++++++++++++++++++++++
 drivers/leds/leds.h                 |   1 -
 drivers/mfd/cros_ec_dev.c           |   9 ++
 include/linux/leds.h                |  10 ++
 9 files changed, 328 insertions(+), 4 deletions(-)
 create mode 100644 drivers/leds/leds-cros_ec.c

-- 
Lee Jones [李琼斯]

