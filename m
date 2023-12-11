Return-Path: <linux-leds+bounces-340-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26EA80DDD6
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 23:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7891F21BA3
	for <lists+linux-leds@lfdr.de>; Mon, 11 Dec 2023 22:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD98355774;
	Mon, 11 Dec 2023 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnBgkwTB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A754FB4
	for <linux-leds@vger.kernel.org>; Mon, 11 Dec 2023 22:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF18C433C8;
	Mon, 11 Dec 2023 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702332348;
	bh=bloHMn43vn2xcYsWUbR9nrxraHhVosF2Fsoh1X/v0ak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EnBgkwTBQrn4TocAdIBg9b1jOpPzMhTzGDQH4EfIh5fUy7R27G6XK/S6nJaEa5PZP
	 EUVojR7pR30i6qv5U02DVimYJ0xzHOCKICpJZnmgSymnMpOkmS69ZS+zIRByd4ogK7
	 f/XIcfaULXdM8jSQwiPQcZ8cSQRN1dUVV3FYvpK+b3KIimU46AQ4r8iU5/rJC2OFJo
	 ZiEu6/6BqIBujpN7sE6Gu8Ejx/W7oHqV3Xr6b7MTJquofKErK7Y+Rz18SSjMPj5oky
	 rq9lfFPvYcQnjX3hyQ1zvMfWxqx4y/CBjpCVFySxa1jF7ZCnbD8yi1HdOPcEhslaJ6
	 BPcVSewokwbsg==
Date: Mon, 11 Dec 2023 14:05:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, Andrew Lunn
 <andrew@lunn.ch>, Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Li Zetao <lizetao1@huawei.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: extend speeds up to 10G
Message-ID: <20231211140546.5c39b819@kernel.org>
In-Reply-To: <657784f6.5d0a0220.617b5.20ee@mx.google.com>
References: <99e7d3304c6bba7f4863a4a80764a869855f2085.1701143925.git.daniel@makrotopia.org>
	<170142826116.3357002.9561246405642038358.b4-ty@kernel.org>
	<6577315e.050a0220.50f30.0122@mx.google.com>
	<20231211084656.26578d89@kernel.org>
	<657784f6.5d0a0220.617b5.20ee@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 22:53:55 +0100 Christian Marangi wrote:
> Soo that it's problematic to also have on net-next? (Sorry for the
> stupid question)

Unless I pull from Lee the patch would be duplicated, we'd have two
commits with different hashes and the same diff. And if I pull we'd
get a lot of netdev-unrelated stuff into net-next:

$ git merge f07894d3b384344c43be1bcf61ef8e2fded0efe5
Auto-merging drivers/leds/trigger/ledtrig-netdev.c
Merge made by the 'ort' strategy.
 .../ABI/testing/sysfs-class-led-trigger-netdev     |  39 ++
 .../ABI/testing/sysfs-class-led-trigger-tty        |  56 ++
 .../bindings/leds/allwinner,sun50i-a100-ledc.yaml  | 137 +++++
 Documentation/devicetree/bindings/leds/common.yaml |   2 +-
 drivers/leds/Kconfig                               |  21 +
 drivers/leds/Makefile                              |   2 +
 drivers/leds/leds-max5970.c                        | 109 ++++
 drivers/leds/leds-sun50i-a100.c                    | 580 +++++++++++++++++++++
 drivers/leds/leds-syscon.c                         |   3 +-
 drivers/leds/leds-tca6507.c                        |  30 +-
 drivers/leds/rgb/leds-qcom-lpg.c                   |  52 +-
 drivers/leds/trigger/ledtrig-gpio.c                |  26 +-
 drivers/leds/trigger/ledtrig-netdev.c              |  32 +-
 drivers/leds/trigger/ledtrig-tty.c                 | 247 +++++++--
 drivers/tty/tty_io.c                               |  28 +-
 include/linux/leds.h                               |   3 +
 include/linux/tty.h                                |   1 +
 17 files changed, 1247 insertions(+), 121 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
 create mode 100644 drivers/leds/leds-max5970.c
 create mode 100644 drivers/leds/leds-sun50i-a100.c

