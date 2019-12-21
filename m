Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A9E128B43
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfLUTzw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:55:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:51398 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726593AbfLUTzw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Dec 2019 14:55:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C7C31AC81;
        Sat, 21 Dec 2019 19:55:50 +0000 (UTC)
Subject: Re: [RFC 17/25] leds: tm1628: Prepare Fude Microelectronics AiP1618
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-18-afaerber@suse.de>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <56665464-0a2f-709d-56fe-565e45ca6eea@suse.de>
Date:   Sat, 21 Dec 2019 20:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212033952.5967-18-afaerber@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am 12.12.19 um 04:39 schrieb Andreas Färber:
> diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
> index ef85712a84f2..8a8fd1562853 100644
> --- a/drivers/leds/leds-tm1628.c
> +++ b/drivers/leds/leds-tm1628.c
[...]
> @@ -411,9 +412,38 @@ static const struct tm1628_info fd628_info = {
>   	.default_pwm = 0,
>   };
>   
> +static const struct tm1628_mode aip1618_modes[4] = {
> +	{
> +		.grid_mask = GENMASK(4, 1),
> +		.seg_mask = GENMASK(8, 1),
> +	},
> +	{
> +		.grid_mask = GENMASK(5, 1),
> +		.seg_mask = GENMASK(7, 1),
> +	},
> +	{
> +		.grid_mask = GENMASK(6, 1),
> +		.seg_mask = GENMASK(6, 1),
> +	},

These three segment masks are obviously wrong - they violate the 
seg_mask below, not leaving the gap between 5 and 12. Fixed.

> +	{
> +		.grid_mask = GENMASK(7, 1),
> +		.seg_mask = GENMASK(5, 1),
> +	},
> +};
> +
> +static const struct tm1628_info aip1618_info = {
> +	.grid_mask = GENMASK(7, 1),
> +	.seg_mask = GENMASK(14, 12) | GENMASK(5, 1),
> +	.modes = aip1618_modes,
> +	.default_mode = 3,
> +	.pwm_map = tm1628_pwm_map,
> +	.default_pwm = 0,
> +};
[snip]

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
