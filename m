Return-Path: <linux-leds+bounces-2163-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54891A11A
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 10:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAE31C21472
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 08:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4D4481D7;
	Thu, 27 Jun 2024 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8hzy0g1"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE223BE;
	Thu, 27 Jun 2024 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719475770; cv=none; b=MSXPrsV3bmKySgZmbElfhxsBFSxD8dr9pxmUQm0ETzpgth3aPeAu8GrERMthwidPp8W+4K3xjbPiO4CNqIRZ8EMkQa2BrkYNrDTAJHUPI3WtJvfWsPgLh59w57V3qrEPtl8GUWCPFk0EjE4Ot3K6Emhj4NAZ5Mi+uBg8zki5gio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719475770; c=relaxed/simple;
	bh=ux6VK6OgKfxrD3reF2GyyseKF9sQnDr7S0hNOTb9Psc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T0MwoeReQa6tpOmOmmtrzUN3xagYxgwavVhvda80JYpDhiS8vbaNOSoSRNNL+du/EATmOyu1bKQU+MQV6X8TQmtjk9hQjfZ5padxrbRGg5RvpWb3A4vT1qtcEWmWE5lbGl2re4tTIRC2PTOBClAbc2lj1CY7EwKeb9M39XyyiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8hzy0g1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA1DC2BBFC;
	Thu, 27 Jun 2024 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719475769;
	bh=ux6VK6OgKfxrD3reF2GyyseKF9sQnDr7S0hNOTb9Psc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z8hzy0g1LPbLFsSaJvHMdgFhv5bh1C0bKPqi4CoNZbJQoiy/JTiv9bSvwwZ39G6gh
	 5/D35OL5Fe9wVdR8Iiqqd4OJAQcr8wj1T1IMN7xcRrYQx4pzfZb+7RRINKvS7ZN+32
	 cMSuhU7imBYiYDStN5gTmCYEua46f/VUwdrHOADZmXRiPj/4RCnVDNyXUD3VW87X9j
	 51+MOR1kdR4lBGBQ0gs2PtqU1v8pOz5pNLBe50i7O/rQRMAFhvlziuOjIPtyKuQqvg
	 ds7sJ1XlTGNTLwtzqhMTiGQftmv/rO40XthhoLK/3cTtJZvYubDHTHZ1uLVyB6pbfb
	 vIEOWbvqp3bBg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Miaoqian Lin <linmq006@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240625-led-class-device-leak-v2-1-75fdccf47421@bootlin.com>
References: <20240625-led-class-device-leak-v2-1-75fdccf47421@bootlin.com>
Subject: Re: (subset) [PATCH v2] Revert "leds: led-core: Fix refcount leak
 in of_led_get()"
Message-Id: <171947576772.2875250.15838690035445924875.b4-ty@kernel.org>
Date: Thu, 27 Jun 2024 09:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 25 Jun 2024 10:34:38 +0200, Luca Ceresoli wrote:
> This reverts commit da1afe8e6099980fe1e2fd7436dca284af9d3f29.
> 
> Commit 699a8c7c4bd3 ("leds: Add of_led_get() and led_put()"), introduced in
> 5.5, added of_led_get() and led_put() but missed a put_device() in
> led_put(), thus creating a leak in case the consumer device is removed.
> 
> Arguably device removal was not very popular, so this went apparently
> unnoticed until 2022. In January 2023 two different patches got merged to
> fix the same bug:
> 
> [...]

Applied, thanks!

[1/1] Revert "leds: led-core: Fix refcount leak in of_led_get()"
      commit: 940b27161afc6ec53fc66245a4fb3518394cdc92

--
Lee Jones [李琼斯]


