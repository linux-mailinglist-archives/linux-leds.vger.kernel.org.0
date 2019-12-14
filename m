Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91E9511F130
	for <lists+linux-leds@lfdr.de>; Sat, 14 Dec 2019 10:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfLNJsH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 14 Dec 2019 04:48:07 -0500
Received: from mx2.suse.de ([195.135.220.15]:35174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725872AbfLNJsH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 14 Dec 2019 04:48:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D7DC5AC71;
        Sat, 14 Dec 2019 09:48:05 +0000 (UTC)
Subject: Re: [RFC 07/25] leds: Add Titan Micro Electronics TM1628
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-8-afaerber@suse.de>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <7441a2d5-f10a-8ca9-8df9-10c0a78cbeb7@suse.de>
Date:   Sat, 14 Dec 2019 10:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212033952.5967-8-afaerber@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Am 12.12.19 um 04:39 schrieb Andreas Färber:
> diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
> new file mode 100644
> index 000000000000..319bf34ce835
> --- /dev/null
> +++ b/drivers/leds/leds-tm1628.c
[...]
> +struct tm1628 {
> +	struct spi_device		*spi;
> +	const struct tm1628_info	*info;

> +	u32				grids;
> +	unsigned int			segments;

These fields were unused since introducing mode_index, dropping.

> +	int				mode_index;
> +	int				pwm_index;
> +	u8				data[14];
> +	unsigned int			num_leds;
> +	struct tm1628_led		leds[];
> +};
Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
