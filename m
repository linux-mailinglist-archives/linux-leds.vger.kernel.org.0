Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF6B28D961
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 06:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgJNE4f (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 00:56:35 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43361 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726037AbgJNE4f (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Oct 2020 00:56:35 -0400
Received: from cust-57f2be97 ([IPv6:fc0c:c196:c6c4:fdf1:aa47:ab6:e251:d2a8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id SYpzkXDIDv4gESYq0kqf9E; Wed, 14 Oct 2020 06:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602651392; bh=IVwfBSG6XJytpDdk5ZBGLvTPAt5ZZWknQxriWw+b0AI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dr1UMk7ZsYCxWwsf8J6E7Uf5zu1xnqt0h88dcw07Gof2v9TLUHfRYh4Tz8yHbP+dA
         NKYkzXJj8W5SPqZJ8HnCDs3fJvJN6mf9VSKjD7VigJ9n4QDUky9MF7iU8MhJJdcqHF
         y+soxAtbn4t2SYPOMfaj0q/FipaLeEK6HKGB5Jp2rkv7wdiKZnuXOaxNWqwQi+/U7w
         ZgeM5ba2b8l8mEDMMVV18f+pmIXtiqNzbXiggegpUWkoaUSd8JXMfSkHaK75Sdr+x9
         BXz2if+r4D5+YEc/7zc1W2Zgl+pLJsBc8tlwTSVA4WQu/piYXnc2Srtku9zMs9Qs8l
         IpJVxAnaBPzww==
Subject: Re: disabling CONFIG_LED_CLASS
To:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Pavel Machek <pavel@ucw.cz>
References: <2835d02a-380b-6a3a-0e4d-abf07aee18bc@xs4all.nl>
 <53e698c1-86e4-8b1f-afb0-b8471349e701@xs4all.nl>
 <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
From:   Udo van den Heuvel <udovdh@xs4all.nl>
Autocrypt: addr=udovdh@xs4all.nl; prefer-encrypt=mutual; keydata=
 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
Organization: hierzo
Message-ID: <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
Date:   Wed, 14 Oct 2020 06:56:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHXqzLTsEIS5k8cyXDRUuan9IVwIoHQ55pfM3+61t1c4BOE8K/QWLxZO54gCx4NQ8/jFBFZVDVgLGpGnTOIu1NmZsOWFuMKvkuNRsdOnpvecOxJCdlQM
 NvGlYo1rundOK/g23wUfAitCo29Zb2ZOYK4tQEha9lN9oc0Bzy00y1T+tnEUYGt+ZthN1TjWmceP1ZiACDEy86rN/UwoWZrKShxguXVQN45eGxa5JyX5tmtC
 kjY+x67rVK0tKh9tYlOkjPAo7o1Dx785mdRGAPxX+u5oYW8hmXK5sjCc0H6OtfP2db/nvFqdR1JwO/BGi3++p0rCpvlpxAr3z/tlQN/QFVe7EDkKI5qehh1j
 AYnjxliPhW5AjA/PfGrX+fZ1jSiOlQ==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 14-10-2020 06:49, Randy Dunlap wrote:
> If you disable SND_HDA_CODEC_REALTEK, then the rest of the
> LED kconfig symbols can be disabled.

Sure,

but:

# dmesg|grep audi
(...)

[   19.971537] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x7, too
many assigned pins
[   19.973547] snd_hda_codec_generic hdaudioC0D0: autoconfig for
Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
[   19.975642] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[   19.977774] snd_hda_codec_generic hdaudioC0D0:    hp_outs=0
(0x0/0x0/0x0/0x0/0x0)
[   19.980176] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
[   19.982257] snd_hda_codec_generic hdaudioC0D0:    dig-out=0x3/0x5
[   19.984412] snd_hda_codec_generic hdaudioC0D0:    inputs:
[   20.035088] snd_hda_codec_realtek hdaudioC1D0: autoconfig for
ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
[   20.036940] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[   20.039579] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1
(0x1b/0x0/0x0/0x0/0x0)
[   20.041690] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[   20.044076] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
[   20.046173] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   20.049252] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
[   20.051287] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
[   20.053084] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
[   20.427487] usbcore: registered new interface driver snd-usb-audio

I.e.: it looks like I will lose some funcionality when I disable
SND_HDA_CODEC_REALTEK.

Kind regards,
Udo
