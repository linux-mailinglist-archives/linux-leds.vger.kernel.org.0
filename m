Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119A828DBE2
	for <lists+linux-leds@lfdr.de>; Wed, 14 Oct 2020 10:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729900AbgJNIov (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Oct 2020 04:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729894AbgJNIoj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Oct 2020 04:44:39 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A671CC04584A;
        Tue, 13 Oct 2020 22:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=L5wcSRZYm3YJ3O3wMUyj3Nk4lgiS3rr7hUykrk/I+Xw=; b=tE4ATn14phABLTG2J45w1RLwVl
        j8WeY2aehX9bM4/4AZNMEuNtnDJJNZGGhRXmvH6/oGi4oMIpsImRDym2yGEDjTxehYLUAWPV1bIGd
        SnaYZMlKHpY2G8ZPR6HgApegTPRvnobT6ZItq8fnpiCFSKwFQtpDQEVQRFZrUi3HQ5kXPmitCpN+O
        V+JeUYDprWkaF6Tv6MfoxPlLdqfX6j5ZMW5rRekoWjq8kr5iKfNqTE+TtLdXR6rVa4TPh4clr9mvy
        gEJo/iVfiql1X5hybdy0wY78/c7EtQV6dm/87cyXre/eGPlB0NZ9gDtlwX6B4+SJe0REV6leBz9r7
        VOiWrfAQ==;
Received: from [2601:1c0:6280:3f0::507c]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSZ0v-0006rb-5K; Wed, 14 Oct 2020 05:07:49 +0000
Subject: Re: disabling CONFIG_LED_CLASS
To:     Udo van den Heuvel <udovdh@xs4all.nl>,
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
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
Date:   Tue, 13 Oct 2020 22:07:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/13/20 9:56 PM, Udo van den Heuvel wrote:
> On 14-10-2020 06:49, Randy Dunlap wrote:
>> If you disable SND_HDA_CODEC_REALTEK, then the rest of the
>> LED kconfig symbols can be disabled.
> 
> Sure,
> 
> but:
> 
> # dmesg|grep audi
> (...)
> 
> [   19.971537] snd_hda_codec_generic hdaudioC0D0: ignore pin 0x7, too
> many assigned pins
> [   19.973547] snd_hda_codec_generic hdaudioC0D0: autoconfig for
> Generic: line_outs=0 (0x0/0x0/0x0/0x0/0x0) type:line
> [   19.975642] snd_hda_codec_generic hdaudioC0D0:    speaker_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [   19.977774] snd_hda_codec_generic hdaudioC0D0:    hp_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [   19.980176] snd_hda_codec_generic hdaudioC0D0:    mono: mono_out=0x0
> [   19.982257] snd_hda_codec_generic hdaudioC0D0:    dig-out=0x3/0x5
> [   19.984412] snd_hda_codec_generic hdaudioC0D0:    inputs:
> [   20.035088] snd_hda_codec_realtek hdaudioC1D0: autoconfig for
> ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
> [   20.036940] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0
> (0x0/0x0/0x0/0x0/0x0)
> [   20.039579] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1
> (0x1b/0x0/0x0/0x0/0x0)
> [   20.041690] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
> [   20.044076] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
> [   20.046173] snd_hda_codec_realtek hdaudioC1D0:    inputs:
> [   20.049252] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
> [   20.051287] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
> [   20.053084] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
> [   20.427487] usbcore: registered new interface driver snd-usb-audio
> 
> I.e.: it looks like I will lose some funcionality when I disable
> SND_HDA_CODEC_REALTEK.

OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
with no LEDS. That driver apparently wants LEDS.

According to this commit:

commit 7cdf8c49b1df0a385db06c4f9a5ba1b16510fdcc
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Jun 18 13:08:31 2020 +0200
    ALSA: hda: generic: Add a helper for mic-mute LED with LED classdev

the Realtek and other drivers need LED support:

"""
    Also, introduce a new kconfig CONFIG_SND_HDA_GENERIC_LEDS, to indicate
    the usage of mute / mic-mute LED helpers.  It's selected by the codec
    drivers (Realtek, Conexant and Sigmatel), while it selects the
    necessary LED class dependencies.
"""


-- 
~Randy

