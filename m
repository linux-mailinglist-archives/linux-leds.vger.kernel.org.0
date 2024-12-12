Return-Path: <linux-leds+bounces-3591-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2A9EFB39
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 19:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E5E116BD0D
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 18:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792AA223C59;
	Thu, 12 Dec 2024 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPeEdbnm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4577F223338;
	Thu, 12 Dec 2024 18:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028688; cv=none; b=HcWUWhn2t520aRW7f/dDnZTSFRlcOqcayi/xB+0dRqRHSwcMS+xHOBq0A9P8aYIi15+/yODqrRJb1JLUKBcvWyookFj/jIYHWonEEzZbXNwutePaR7C+FGVhEiJD0TLZofvvoubabfvKk0RByfDGrxZaaZwq/NgIMHnBgKJAiu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028688; c=relaxed/simple;
	bh=o6VGbM38GON/sJN/xa92Zh6V4Zo+f8EMhFUEc2b+Rhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S3di8N7vAqrxXap82/sAf9FyJ+QIH9iFcxGV/L39xM4XYE5gB1ZAy8BSwpQQ9anCZx10sD7UKsY8n6UIwAca1oqyDM4SEHGXNJUQQ4ddcy4oszt1y/9h9/vzydMOnRAiY3DvTxZKCkozFBxppI63uqBVJtMbbenVSWrDTOuXEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPeEdbnm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D482FC4CECE;
	Thu, 12 Dec 2024 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734028687;
	bh=o6VGbM38GON/sJN/xa92Zh6V4Zo+f8EMhFUEc2b+Rhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gPeEdbnmf3G2S0k4t2SeS4H37yCg10e+kl08dA0pmGZ081TORVA3+lgkMKW56I+TF
	 ZpeIqcUUxQVzNjEyCEo6kMrmOcRcmSdSaO9+gOmo1FxAA5NIupb4tAg6KpJaJsYRYV
	 WtXuXgR14ZVjLduKubxjvAAAo/HEfi31lH+5zDp3uNqyyTWx+8PtEoQXTkKoSb99zy
	 BtxXRdI983ratvCl8flWvSrV4LBS6KJTjTCsIeyZm1dUw8NWsFE3wRPjpDQbpoc+gH
	 IykMOGuk3hn8/G6wG/EWhBMQPV/sbrlclWeuUarE+0gXy6YzCBO52qrsbdFmGg/mPo
	 kONoHpihokyrQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, 
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20241111100355.6978-1-kabel@kernel.org>
References: <20241111100355.6978-1-kabel@kernel.org>
Subject: Re: [PATCH leds v7 00/11] Turris Omnia LED driver changes
Message-Id: <173402868459.2361547.14700129518355452742.b4-ty@kernel.org>
Date: Thu, 12 Dec 2024 18:38:04 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 11 Nov 2024 11:03:44 +0100, Marek Behún wrote:
> this is v7 of Turris Omnia LED driver changes.
> v1 to v6 can be found at
>   https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
>   https://lore.kernel.org/linux-leds/20240903101930.16251-1-kabel@kernel.org/
>   https://lore.kernel.org/linux-leds/20240913123103.21226-1-kabel@kernel.org/
>   https://lore.kernel.org/linux-leds/20241029135621.12546-1-kabel@kernel.org/
>   https://lore.kernel.org/linux-leds/20241104141924.18816-1-kabel@kernel.org/
>   https://lore.kernel.org/linux-leds/20241108132845.31005-1-kabel@kernel.org/
> 
> [...]

Applied, thanks!

[01/11] turris-omnia-mcu-interface.h: Move command execution function to global header
        commit: 082e8f6db9092d19ae84549874daaef240c2207b
[02/11] leds: turris-omnia: Use command execution functions from the MCU driver
        commit: b4c3960da27dd91412e04bc263311c16e6c46fb0
[03/11] turris-omnia-mcu-interface.h: Add LED commands related definitions to global header
        commit: d665d7f2800fff5da9311e4c8c236966ba57d440
[04/11] leds: turris-omnia: Use global header for MCU command definitions
        commit: 5d2f88320c2f7d15830f2f3b51726ef6ba999195
[05/11] dt-bindings: leds: cznic,turris-omnia-leds: Allow interrupts property
        commit: 2b73a24f327070390f1a17570fcab35b61a92c24
[06/11] leds: turris-omnia: Document driver private structures
        commit: 8ca5bf8ad183e1b05034ccfd96d59e7b802d6335
[07/11] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
        commit: d82e09d62b3bdbfa9dac2daf3c3c071b6a79d2aa
[08/11] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
        commit: 1783b766940f37aeaf7c841f777be8cf68326908
[09/11] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
        commit: 2de889e9cf25558bf12505b6827dcd435cbc1b11
[10/11] leds: turris-omnia: Use dev_err_probe() where appropriate
        commit: eda057c7c7c2c99c15b86bb5e3c1858b8650c074
[11/11] leds: turris-omnia: Use uppercase first letter in all comments
        commit: 4cc40bf45b6f6b6ae350e1f75ee0af49b81f9b1f

--
Lee Jones [李琼斯]


