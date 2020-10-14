Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5494328D953
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 06:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgJNEgd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 00:36:33 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55545 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726037AbgJNEgd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 00:36:33 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Oct 2020 00:36:31 EDT
Received: from cust-57f2be97 ([IPv6:fc0c:c196:c6c4:fdf1:aa47:ab6:e251:d2a8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SYPfkX4erv4gESYPgkqQKq; Wed, 14 Oct 2020 06:29:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602649765; bh=8LFunZGvj9uDc/Uy5IRwb5Vxy25DEwf7O9uD3K3f/LE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a9Y4JSBBo6D2Dj5o/Gv8r9fmf7z4ycsFR5f0QSC6SeS7Ogq5GL2SjSOQuDU2zS8Om
         GcXiR6AaTpYHFUBqxXnvVTeL9Hqt/I8j2sagP6ud0KUxk/hKdYV21TN98fn9tUGaWu
         b6QmViGEsVMbuQvqROgSji79wUjPlTvNDXxqmEfO76zPq57H0IoIb7860DVKpkTCes
         9ncI2OzV28ii5+udHsPS+TcX2HPwHX8sFkXZ2vWPzKEIi70Ubzt3ycv1JioahFqrsv
         HWXw6qyRY0S9/5dx4/nyQuFDOTtWA8JU6HcrIIzjbQ3Ua9m9FaHU08HYatBEQqjmzh
         yOqEyVi1nxTMg==
Subject: Re: disabling CONFIG_LED_CLASS
To:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
From:   Udo van den Heuvel <udovdh@xs4all.nl>
Autocrypt: addr=udovdh@xs4all.nl; prefer-encrypt=mutual; keydata=
 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
Organization: hierzo
Message-ID: <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
Date:   Wed, 14 Oct 2020 06:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBoOWzmngHLO2ydAeXUlGNpl157AWLSE4AmQYkXK/KVI8BqF+OgtED3CIPZgtzvkxOoYqxV6H3HTEA2qw2MFw0HLD6qbqOOoupgjEyQ/6M6tewp2t7yw
 mIyXZhrUF3+ErefoWRip3Kaar2NfXm5svbCXS8gAv81++Berxv8BfSoDsXSNMYsmSTKnskXr+J1ozbbs5wyNeGx6pt+HETqw5yd87X712QKvNN8LCYE4Kj2E
 d/XjiJ19kN+HPad4/tCtv1XpRVpzb0CQXaMSlWjLalprMLY3ckhBN6nN6KQfpbKLFnD9XlfElfVfjx5rIZ5PHv4BS1ZcFgJcu8E6Tv5r25lKPAkCM9oRne9+
 LfuFXnvdTuFpFQTd5UVeeq1AUnQpKw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 13-10-2020 18:03, Randy Dunlap wrote:
> On 10/13/20 8:53 AM, Randy Dunlap wrote:
>> [adding LED people + list]
>>
>> On 10/13/20 6:24 AM, Udo van den Heuvel wrote:
(...)
>>>> So how do I disable this stuff?
>>>>
> 
> I was able to disable LEDS_CLASS and NEW_LEDS after I disabled the following
> config symbols:
> 
> 
> --- xx64/config-def64	2020-10-13 08:53:56.050501724 -0700
> +++ xx64/.config	2020-10-13 08:58:12.439205389 -0700
> -CONFIG_MAC80211_LEDS=y
> -CONFIG_RFKILL_LEDS=y
> -# CONFIG_LED_TRIGGER_PHY is not set
> -CONFIG_INPUT_LEDS=y
> -# CONFIG_HID_LED is not set
> -# CONFIG_USB_LED_TRIG is not set
> -# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
> -CONFIG_LEDS_TRIGGERS=y
> -CONFIG_EEEPC_LAPTOP=y
> +# CONFIG_EEEPC_LAPTOP is not set
> 
> This last one was the biggest problem for me.
> I started with x86_64 defconfig.

# grep LED .config
# grep LEDS .config
# grep EEPC .config
# make oldconfig
(...)
*
* LED Support
*
LED Support (NEW_LEDS) [Y/?] (NEW) y
  LED Class Support (LEDS_CLASS) [M/y/?] (NEW) n

So we still are stuck.

Udo

