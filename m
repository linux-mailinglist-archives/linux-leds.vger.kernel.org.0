Return-Path: <linux-leds+bounces-3590-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4299EFB08
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 19:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD6A9289D82
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2024 18:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B5C22332E;
	Thu, 12 Dec 2024 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA2UjYyY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07765218594;
	Thu, 12 Dec 2024 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734028444; cv=none; b=UnHKgNbt3bf2qdAWA7VZXUdB/gAx9xKLmbbwQ2d3n0LHE/5Nh6DKKp+0JKQgO2MsXSuJpGeGCkNiL3XY3Nu/w95P4I6/E1tEAGpJKR9prNIjDAx7nD4/Qs+5TZnXlTdfkfhKFkr+Efuh2abocL+F71O+r1NsJiOtq248ITZgftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734028444; c=relaxed/simple;
	bh=VFuqqsV6p5jUQLaL1yiL40jofl3gxXoUYZqAdo4dXEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+sVhlVieTb5rCmMfN9B2gRKviOHsKsy14m4iUinejiRjDyJTsTKPSsrGPUAKvRuFZW5a6Jh1rgRZg5LqAyJgTcJCDN2YAVhvf8nF0hSghVScATP57+mD4KbX3x8DF4WHvcVnzrUE8RtvICNZtfu/cwV9fyZ+9WoQULwiitAqvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA2UjYyY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C330C4CED3;
	Thu, 12 Dec 2024 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734028443;
	bh=VFuqqsV6p5jUQLaL1yiL40jofl3gxXoUYZqAdo4dXEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lA2UjYyYvZIh/OZwI7XZj7G9COLH6ZYmV/Mp6ptDf60lFXAt4fs0CYNHRdNLOZCz5
	 Yw0fB76Ji2uD4kiTy58CJ+BBVvzhNqdNv4XFKDYD4uwi+XpvQy4DxCoB2kpjL5hUwW
	 B/MNy8P5sG15QMNrasHoVyKpOflRw61nTFwiMa7T9aVJ+MnhtXWI160uqLCVzf6+Y+
	 R85aRNYIQYWDqt9YkEirkky64bZmKSeyL17c230w/C363KmudVtkyHyAx3/eRJAGAH
	 5OkqoADi9mS6E0MJ+oQ4AKpxQ5fGbVtEIlsjKZFUcqfVhhKmeoFU1Td/lsIafDlctD
	 hWGiUvOvxygeg==
Date: Thu, 12 Dec 2024 18:33:57 +0000
From: Lee Jones <lee@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v7 03/11] turris-omnia-mcu-interface.h: Add LED
 commands related definitions to global header
Message-ID: <20241212183357.GK7139@google.com>
References: <20241111100355.6978-1-kabel@kernel.org>
 <20241111100355.6978-4-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111100355.6978-4-kabel@kernel.org>

On Mon, 11 Nov 2024, Marek Behún wrote:

> Add definitions for contents of the OMNIA_CMD_LED_MODE and
> OMNIA_CMD_LED_STATE commands to the global turris-omnia-mcu-interface.h
> header.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  include/linux/turris-omnia-mcu-interface.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/turris-omnia-mcu-interface.h b/include/linux/turris-omnia-mcu-interface.h
> index 7f24cc682780..06c94e032c6f 100644
> --- a/include/linux/turris-omnia-mcu-interface.h
> +++ b/include/linux/turris-omnia-mcu-interface.h
> @@ -239,6 +239,18 @@ enum omnia_int_e {
>  	OMNIA_INT_LAN5_LED1		= BIT(31),
>  };
>  
> +enum omnia_cmd_led_mode_e {
> +	OMNIA_CMD_LED_MODE_LED_MASK	= GENMASK(3, 0),
> +#define OMNIA_CMD_LED_MODE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_MODE_LED_MASK, _l)
> +	OMNIA_CMD_LED_MODE_USER		= BIT(4),
> +};
> +
> +enum omnia_cmd_led_state_e {
> +	OMNIA_CMD_LED_STATE_LED_MASK	= GENMASK(3, 0),
> +#define OMNIA_CMD_LED_STATE_LED(_l)	FIELD_PREP(OMNIA_CMD_LED_STATE_LED_MASK, _l)
> +	OMNIA_CMD_LED_STATE_ON		= BIT(4),
> +};

I'm going to take this set now as-is, but can you submit a patch moving
these #defines out of the enum block please?

-- 
Lee Jones [李琼斯]

