Return-Path: <linux-leds+bounces-2068-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1A910E2B
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 19:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010EE1C211DD
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 17:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D991B3F27;
	Thu, 20 Jun 2024 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1MTkw5r"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808E1B3F1D;
	Thu, 20 Jun 2024 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903612; cv=none; b=NzXbZYSvOfaRCELNdl5Lpq/3OwgNGq0Ots7Ent3yVfIQSzEyMooiW/0rQEB2rxpgBd0xi7JCL/md6+679a13VpIluOZcn0+LxtDe2pvt0wj9PF4ezhAOjJ8xhclosmh0RszHm/AqEkYGf7CUhdiUm3wzM+GqiQTQuEAH93pJiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903612; c=relaxed/simple;
	bh=PTTLUdzOSl/Wb9GnjZJ14W/5eKogr5nn0VBaPjKDyXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c6CyE1SWqKYYB7vi3f3PCQp0OhXRipFyRd7S0UJbk5d6qhHhV/b0QBebn3NJaKFpd3P7fIEtBhZ1dBfHmAJkACT/HnGeoSEjpPmLzlfzH6bhJbzMCyG3bmNVnhqjVwQbVxiUdE3t59W/61tHNYVEP+DWJlhEin616JcJfSzfK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1MTkw5r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCAEC4AF07;
	Thu, 20 Jun 2024 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718903611;
	bh=PTTLUdzOSl/Wb9GnjZJ14W/5eKogr5nn0VBaPjKDyXk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M1MTkw5rbV+zxpFJuDF+SgOEv8UK5/62SI4sqhFR5hT35wVuEjNRBwm38cr980K0/
	 vzSIa8sc82j2rRkws2hMigvRZ6GQhh3+JDWoyhdvNX+KO/xpJ+y0cfojKcBKOZeqvW
	 85WW0Ff23rl/4/aX3FnPZMW1bsH23PirO0IHsLKVrr4iAlj88T3Aa+u9jvXLTwGNMA
	 MbMB4bMpCVBXFLohqeTf6jv2psBCWOlclOk/MzWWRgo8LrAzPIoJXGunTboawJNoUu
	 hf9lAYf4JILkfIleOARsnDWIq4y+GIrPQSDxb/ZAYPf+Lim8f98MCqrqziP5VINqy0
	 YgTs/8fF3o20w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
Subject: Re: [PATCH v3 0/5] ChromeOS Embedded Controller LED driver
Message-Id: <171890360929.1308679.1495946714677532623.b4-ty@kernel.org>
Date: Thu, 20 Jun 2024 18:13:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 13 Jun 2024 16:48:35 +0200, Thomas Weißschuh wrote:
> Add a LED driver that supports the LED devices exposed by the
> ChromeOS Embedded Controller.
> 
> Patch 1-3 add a utility function to the led subsystem.
> Patch 4 introduces the actual driver.
> Patch 5 registers the driver through the cros_ec mfd devices.
> 
> [...]

Applied, thanks!

[1/5] leds: core: Introduce led_get_color_name() function
      commit: ab52674e673ae3ecf457ee6036c24b2c5e0a2cca
[2/5] leds: multicolor: Use led_get_color_name() function
      commit: f5e22810770af92f69d266d4a7db505679264eab
[3/5] leds: core: Unexport led_colors[] array
      commit: e056183d2852d6e8cfd0da2a1e3eaf9c08801963
[4/5] leds: Add ChromeOS EC driver
      commit: 583745b475ace58b6223aee6d174ee46f04bce95
[5/5] mfd: cros_ec: Register LED subdevice
      commit: 2796819735adfc3cdf388696ab20a6780effb525

--
Lee Jones [李琼斯]


