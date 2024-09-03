Return-Path: <linux-leds+bounces-2591-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C9D96A087
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 16:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C921F2784D
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D68189521;
	Tue,  3 Sep 2024 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkbCYtHd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD08189507
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373608; cv=none; b=peNxNqYiZ6+veAb1j5ixDVH0YT/U0GvlADDtV0ZQqpqVGfSP04nGYvIFwcQOWoS4sfWbWqPGLrdgwmyPskFPwoEuVLwT+ObpaEUu1AX/XJbERXEn9ooi4sMP5ZrL0M5FnV5hNwCF9+j7RoMDx/Wu0aC1TBa2Ox7heCBtfyC2Ufw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373608; c=relaxed/simple;
	bh=Hj1yivyYJankQDXcGlg/R1Vke/ZctiA++fiXMrswr54=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jozh674IcVlXdkVxBY8u1OEtjVYPMAAHpDRDY90bsvu2E4J4Sw8wc0cqmE7pxFLSknO/gkadObBTb/1UKE2aSCW3MkabiqHhIHotxUTAN1YAKv6uFPD1vEfKY38qp0uJ6u0m7G20nBYgjZBWaT0+Kyj0nIlmiT9cNM6wZjWrmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkbCYtHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A63C4CEC9;
	Tue,  3 Sep 2024 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373608;
	bh=Hj1yivyYJankQDXcGlg/R1Vke/ZctiA++fiXMrswr54=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=IkbCYtHdw6Ew4ZzvsoQISiVKPOZMpn0ovpdwamRhGSlsqS5CsVFCXJH1c/1AtPHo1
	 SJmP8fN9RaUGdFhyZgZ+9lXDrJH6ciENVmKJD4r5YhU0Mh7WFzhcHpbiC5p+9huE69
	 DPe6ftVLe/+qQVYQm3jqto90bUMmyM5o4flToJ/L8e9Y9Scnwzu06wclbVRr/Xf/n6
	 Sjqa1d9NeB44QGpcSYDV3+9cNt8n5eIcz21CXLOZ0X1XoJybAYSbfDmhIe7EZ1r3sL
	 3oMV3hQbQKOjXpHhZElJy5O95+zME1De+GltV5rmrANeyD7gyp7/oFTaFE4LXsBpdr
	 4xJqbOWreOjEQ==
Date: Tue, 03 Sep 2024 09:26:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>, arm@kernel.org, linux-leds@vger.kernel.org, 
 Hans de Goede <hdegoede@redhat.com>, soc@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
Message-Id: <172537335178.875540.10164997021345385818.robh@kernel.org>
Subject: Re: [PATCH leds v2 00/11] Turris Omnia LED driver changes


On Tue, 03 Sep 2024 12:19:19 +0200, Marek Behún wrote:
> Hello Lee,
> 
> this is v2 of Turris Omnia LED driver changes.
> v1 can be found at
>   https://lore.kernel.org/linux-leds/20240902124104.14297-1-kabel@kernel.org/
> 
> This series is for 6.12, but it depends on changes that have been
> merged to 6.11-rc3. Your for-leds-next branch is based on 6.11-rc1, so
> it won't apply there.
> 
> Changes since v1:
> - patch 2 does away also with i2c_master_send() call, in favor of
>   omnia_cmd_write()
> - patch 5 was rewritten to not use devm_device_add_group() anymore,
>   since this function was deprecated. Instead, the sysfs_put() call for
>   the "brightness" node is done the first time the IRQ handler is
>   called, instead of driver probe.
> - the changes were done with 100 columns limit in mind
> - added 3 more "cosmetic" patches
> 
> Marek
> 
> Marek Behún (11):
>   turris-omnia-mcu-interface.h: Move command execution function to
>     global header
>   leds: turris-omnia: Use command execution functions from the MCU
>     driver
>   turris-omnia-mcu-interface.h: Add LED commands related definitions to
>     global header
>   leds: turris-omnia: Use global header for MCU command definitions
>   leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
>   platform: cznic: turris-omnia-mcu: Inform about missing LED panel
>     brightness change interrupt feature
>   leds: turris-omnia: Inform about missing LED gamma correction feature
>     in the MCU driver
>   leds: turris-omnia: Use dev_err_probe() where appropriate
>   leds: turris-omnia: Use uppercase first letter in all comments
>   leds: turris-omnia: Use 100 columns in the rest of the code
>   ARM: dts: turris-omnia: Add global LED brightness change interrupt
> 
>  .../dts/marvell/armada-385-turris-omnia.dts   |   1 +
>  drivers/leds/leds-turris-omnia.c              | 283 +++++++-----------
>  .../platform/cznic/turris-omnia-mcu-base.c    |   3 +
>  drivers/platform/cznic/turris-omnia-mcu.h     | 130 --------
>  include/linux/turris-omnia-mcu-interface.h    | 148 ++++++++-
>  5 files changed, 257 insertions(+), 308 deletions(-)
> 
> --
> 2.44.2
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y marvell/armada-385-turris-omnia.dtb' for 20240903101930.16251-1-kabel@kernel.org:

arch/arm/boot/dts/marvell/armada-385-turris-omnia.dtb: led-controller@2b: 'interrupts-extended' does not match any of the regexes: '^multi-led@[0-9a-b]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#






