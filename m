Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C52C11CF6D
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 15:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbfLLOKx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Dec 2019 09:10:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:48200 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729392AbfLLOKx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 12 Dec 2019 09:10:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 90F17ACE1;
        Thu, 12 Dec 2019 14:10:51 +0000 (UTC)
Subject: Re: [RFC 19/25] leds: tm1628: Add 7-segment display support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-20-afaerber@suse.de>
 <CAMuHMdWeqoqQBtsdN2Q=Urc22Ezj5nBRFPk1_V5gvGV9BGuMkw@mail.gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <a9bacb0d-eccf-ec42-5d09-ce042aff2f41@suse.de>
Date:   Thu, 12 Dec 2019 15:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWeqoqQBtsdN2Q=Urc22Ezj5nBRFPk1_V5gvGV9BGuMkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Geert,

Am 12.12.19 um 09:33 schrieb Geert Uytterhoeven:
> On Thu, Dec 12, 2019 at 4:42 AM Andreas Färber <afaerber@suse.de> wrote:
>> Detect DT child nodes covering more than one LED component and implement
>> a text to 7-segment display mapping.
>>
>> Signed-off-by: Andreas Färber <afaerber@suse.de>
> 
>> --- a/drivers/leds/leds-tm1628.c
>> +++ b/drivers/leds/leds-tm1628.c
> 
>> +static const struct tm1628_ssd_char tm1628_char_ssd_map[] = {
>> +       { '0', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
>> +              SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
> 
> Please use include/uapi/linux/map_to_7segment.h
> Yes, it is well hidden ;-).

Many thanks for that pointer! Even matches the segment/bit order of my
datasheets/defines.

The small t may be different (T?), and I don't see it mapping combined
characters (patch 22/25). The recommended sysfs map_7seg attribute may
help deal with that, but seems terribly unhandy for my busybox initrd.

Hope you also read the cover letter, where not finding this and many
other issues were discussed. I was expecting some .c file in either
drivers/leds or auxdisplay - input is indeed unexpected for output.

Still wondering whether we can somehow describe those "VFD" displays in
a more reusable way, like we do for MIPI DSI panels.

Cheers,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
